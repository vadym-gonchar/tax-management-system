package gov.taxation.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import gov.taxation.dto.UploadedReport;
import gov.taxation.entity.Report;
import gov.taxation.entity.ReportStatus;
import gov.taxation.entity.User;
import gov.taxation.enumerated.ReportStatusEnum;
import gov.taxation.enumerated.RoleEnum;
import gov.taxation.service.ReportService;
import gov.taxation.service.ReportStatusService;
import gov.taxation.service.UserTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Optional;

@Controller
public class ReportController {

    @Autowired
    private ReportService reportService;

    @Autowired
    private ReportStatusService reportStatusService;

    @Autowired
    private UserTypeService userTypeService;

    @Autowired
    private ObjectMapper mapper;

    @GetMapping("/showFormForAdd")
    public String createReportForm(Report report, Model model, HttpSession session) {

        report = (report == null) ? new Report() : report;

        User user = (User) session.getAttribute("user");

        report.setUser(user);

        model.addAttribute("report", report);
        model.addAttribute("approvedStatus", this.reportStatusService.getStatus(ReportStatusEnum.APPROVED));
        model.addAttribute("rejectedStatus", this.reportStatusService.getStatus(ReportStatusEnum.REJECTED));

        return "report-form";
    }

    @GetMapping("/updateReport/{reportId}")
    public String viewReportForm(@PathVariable("reportId") Long reportId, Model model, HttpSession session,
                                 RedirectAttributes redirectAttributes) {

        Optional<Report> reportOptional = reportService.findReportById(reportId);

        if (!reportOptional.isPresent()) {
            redirectAttributes.addFlashAttribute("reportNotFound", "error.reportNotFound");
            return this.createReportForm(null, model, session);
        }

        Report report = reportOptional.get();

        User user = (User) session.getAttribute("user");

        if (user.getRole().getName().equals(RoleEnum.ROLE_USER.name()) && !this.isReportBelongToUser(user, report)) {
            redirectAttributes.addFlashAttribute("reportNotBelong", "reportForm.reportNotBelong");
            return this.createReportForm(null, model, session);
        }

        this.fillModel(report, model);
        model.addAttribute("readOnly",
                (report.getStatus().getName().equals(ReportStatusEnum.APPROVED.getName()) || user.getRole().getName().equals(RoleEnum.ROLE_ADMIN.name())));
        model.addAttribute("userTypes", userTypeService.findAll());

        model.addAttribute("approvedStatus", this.reportStatusService.getStatus(ReportStatusEnum.APPROVED));
        model.addAttribute("rejectedStatus", this.reportStatusService.getStatus(ReportStatusEnum.REJECTED));

        return "report-form";
    }

    @PostMapping("/save")
    public String createOrUpdateReport(@Valid @ModelAttribute("report") Report report,
                                       BindingResult bindingResult,
                                       Model model,
                                       HttpSession session,
                                       RedirectAttributes redirectAttributes) {

        User user = (User) session.getAttribute("user");

        report.setUser(user);
        report.setStatus(this.reportStatusService.getStatus(ReportStatusEnum.PENDING));

        if (report.getId() != null) {

            Optional<Report> reportOptional = reportService.findReportById(report.getId());

            if (!reportOptional.isPresent()) {
                redirectAttributes.addFlashAttribute("reportNotFound", "error.reportNotFound");
                return this.createReportForm(null, model, session);
            }

            Report existingReport = reportOptional.get();

            this.fillModel(report, model);

            if (!this.isReportBelongToUser(user, existingReport)) {
                redirectAttributes.addFlashAttribute("reportNotBelong", "reportForm.reportNotBelong");
                return this.createReportForm(null, model, session);
            }

            if (this.isReportApproved(existingReport)) {
                redirectAttributes.addFlashAttribute("reportIsApproved", "success.reportIsApproved");
                return this.viewReportForm(report.getId(), model, session, redirectAttributes);
            }

            report.setComment(existingReport.getComment());

        }

        if (bindingResult.hasErrors()) {
            return "report-form";
        }

        if (report.getId() == null) {
            redirectAttributes.addAttribute("page", 0);
            redirectAttributes.addAttribute("sort", "createdAt,desc");
        }

        this.reportService.save(report);

        return "redirect:/";
    }

    @PostMapping("/report/upload")
    public String reportUpload(@RequestParam("file") MultipartFile file,
                               Model model,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) throws IOException {

        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("emptyFileError", "error.emptyFileError");
            return "redirect:/";
        }

        if (MediaType.APPLICATION_JSON_VALUE.equals(file.getContentType())) {

            UploadedReport uploadedReport = this.mapper.readValue(file.getBytes(), UploadedReport.class);
            Report report = new Report();
            report.setReportDate(uploadedReport.getReportDate());
            report.setRate(uploadedReport.getRate());

            return this.createReportForm(report, model, session);

        }else {
            redirectAttributes.addFlashAttribute("fileFormatError", "error.fileFormatError");
            return "redirect:/";
        }
    }

    @PostMapping("/admin/save")
    public String changeReportStatus(@Valid @ModelAttribute("report") Report report,
                                     Model model,
                                     HttpSession session,
                                     RedirectAttributes redirectAttributes) {

        Optional<Report> reportOptional = reportService.findReportById(report.getId());

        if (!reportOptional.isPresent()) {
            redirectAttributes.addFlashAttribute("reportNotFound", "error.reportNotFound");
            return this.createReportForm(null, model, session);
        }

        Report existingReport = reportOptional.get();

        if (this.isReportApproved(existingReport)) {
            redirectAttributes.addFlashAttribute("reportIsApproved", "success.reportIsApproved");
            return this.viewReportForm(report.getId(), model, session, redirectAttributes);
        }

        final ReportStatus adminStatus = report.getStatus();

        Optional<ReportStatus> optionalReportStatus = this.reportStatusService.findById(adminStatus);

        if (!optionalReportStatus.isPresent()) {
            model.addAttribute("statusFormError", "reportForm.status.incorrect");
            return this.viewReportForm(report.getId(), model, session, redirectAttributes);
        }

        existingReport.setStatus(report.getStatus());
        existingReport.setComment(report.getComment());

        this.reportService.save(existingReport);

        return this.viewReportForm(report.getId(), model, session, redirectAttributes);
    }

    private boolean isReportApproved(Report report) {
        return report.getStatus().getName().equals(ReportStatusEnum.APPROVED.getName());
    }

    private boolean isReportBelongToUser(User user, Report report) {
        return user.getId().equals(report.getUser().getId());
    }

    private void fillModel(Report report, Model model) {
        model.addAttribute("report", report);
        model.addAttribute("reportStatusPending", report.getStatus().getName().equals(ReportStatusEnum.PENDING.getName()));
        model.addAttribute("reportStatusRejected", report.getStatus().getName().equals(ReportStatusEnum.REJECTED.getName()));
        model.addAttribute("reportStatusApproved", report.getStatus().getName().equals(ReportStatusEnum.APPROVED.getName()));
    }
}