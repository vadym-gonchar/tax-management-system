package gov.taxation.controller;

import gov.taxation.dto.ReportSearchForm;
import gov.taxation.entity.Report;
import gov.taxation.entity.User;
import gov.taxation.service.ReportService;
import gov.taxation.service.ReportStatusService;
import gov.taxation.service.UserTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    @Autowired
    private ReportService reportService;

    @Autowired
    private ReportStatusService reportStatusService;

    @Autowired
    private UserTypeService userTypeService;

    @GetMapping("/")
    public String listReports(Model model,
                              @PageableDefault(size = 10, sort = "status", direction = Sort.Direction.ASC) Pageable pageable,
                              HttpSession session,
                              @RequestParam(name = "sort", required = false, defaultValue = "status,asc") String sort) {

        User user = (User) session.getAttribute("user");

        if (session.getAttribute("reportSearchForm") == null) {
            model.addAttribute("reportSearchForm", new ReportSearchForm());

            Page<Report> page = reportService.findPaginated(user, pageable);

            model.addAttribute("page", page);
        } else {
            ReportSearchForm form = (ReportSearchForm) session.getAttribute("reportSearchForm");
            model.addAttribute("reportSearchForm", form);
            Page<Report> page = reportService.findPaginated(user, pageable, form);
            model.addAttribute("page", page);
        }

        model.addAttribute("pageable", pageable);
        model.addAttribute("sort", sort);
        model.addAttribute("statuses", this.reportStatusService.findAll());
        model.addAttribute("userTypes", this.userTypeService.findAll());

        return "home";
    }

    @PostMapping("/")
    public String searchForm(@ModelAttribute("reportSearchForm") ReportSearchForm form, HttpSession session, Model model,
                             @PageableDefault(size = 10, sort = "status", direction = Sort.Direction.ASC) Pageable pageable,
                             @RequestParam(name = "sort", required = false, defaultValue = "status,asc") String sort) {

        session.setAttribute("reportSearchForm", form);

        return this.listReports(model, pageable, session, sort);

    }
}