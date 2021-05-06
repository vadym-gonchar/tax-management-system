package gov.taxation.controller;

import gov.taxation.entity.Report;
import gov.taxation.entity.User;
import gov.taxation.enumerated.ReportStatusEnum;
import gov.taxation.enumerated.RoleEnum;
import gov.taxation.service.ReportService;
import gov.taxation.service.ReportStatusService;
import gov.taxation.service.UserTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Optional;
import java.util.logging.Logger;

@Controller
public class ReportController {

    @Autowired
    private ReportService reportService;

    @Autowired
    private ReportStatusService reportStatusService;

    @Autowired
    private UserTypeService userTypeService;

    private final Logger logger = Logger.getLogger(getClass().getName());

    @GetMapping("/showFormForAdd")
    public String createReportForm(Model model, HttpSession session) {

        Report report = new Report();

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
            redirectAttributes.addFlashAttribute("reportNotFound", "This report has not been found");
            return this.createReportForm(model, session);
        }

        Report report = reportOptional.get();

        User user = (User) session.getAttribute("user");

        if (user.getRole().getName().equals(RoleEnum.ROLE_USER.name()) && !this.isReportBelongToUser(user, report)) {
            redirectAttributes.addFlashAttribute("reportNotBelong", "This report is not the user's report");
            return this.createReportForm(model, session);
        }

        model.addAttribute("report", report);
        model.addAttribute("readOnly",
                (report.getStatus().getName().equals(ReportStatusEnum.APPROVED.getName()) || user.getRole().getName().equals(RoleEnum.ROLE_ADMIN.name())));
        model.addAttribute("reportStatusPending", report.getStatus().getName().equals(ReportStatusEnum.PENDING.getName()));
        model.addAttribute("reportStatusRejected", report.getStatus().getName().equals(ReportStatusEnum.REJECTED.getName()));
        model.addAttribute("reportStatusApproved", report.getStatus().getName().equals(ReportStatusEnum.APPROVED.getName()));
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

        if (bindingResult.hasErrors()) {
            logger.warning("Create or update form error");
            return "report-form";
        }

        if (report.getId() != null) {

            Optional<Report> reportOptional = reportService.findReportById(report.getId());

            if (!reportOptional.isPresent()) {
                redirectAttributes.addFlashAttribute("reportNotFound", "This report has not been found");
                return this.createReportForm(model, session);
            }

            Report existingReport = reportOptional.get();

            if (!this.isReportBelongToUser(user, existingReport)) {
                redirectAttributes.addFlashAttribute("reportNotBelong", "This report is not the user's report");
                return this.createReportForm(model, session);
            }

            if (this.isReportApproved(existingReport)) {
                redirectAttributes.addFlashAttribute("reportIsApproved", "Report has been successfully approved");
                return this.viewReportForm(report.getId(), model, session, redirectAttributes);
            }

            report.setComment(existingReport.getComment());

        }

        report.setStatus(this.reportStatusService.getStatus(ReportStatusEnum.PENDING));

        this.reportService.save(report);

        return "redirect:/";
    }

    @PostMapping("/admin/save")
    public String changeReportStatus(@ModelAttribute("report") @Valid Report report,
                                     Model model,
                                     HttpSession session, RedirectAttributes redirectAttributes) {

        Optional<Report> reportOptional = reportService.findReportById(report.getId());

        if (!reportOptional.isPresent()) {
            redirectAttributes.addFlashAttribute("reportNotFound", "This report has not been found");
            return this.createReportForm(model, session);
        }

        Report existingReport = reportOptional.get();

        if (this.isReportApproved(existingReport)) {
            redirectAttributes.addFlashAttribute("reportIsApproved", "Report has been successfully approved");
            return this.viewReportForm(report.getId(), model, session, redirectAttributes);
        }

        existingReport.setStatus(report.getStatus());
        existingReport.setComment(report.getComment());

        this.reportService.save(existingReport);

        return this.viewReportForm(report.getId(), model, session, redirectAttributes);
    }

    private boolean isReportApproved(final Report report) {
        return report.getStatus().getName().equals(ReportStatusEnum.APPROVED.getName());
    }

    private boolean isReportBelongToUser(User user, Report report) {
        return user.getId().equals(report.getUser().getId());
    }
}