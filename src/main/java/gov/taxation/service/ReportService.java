package gov.taxation.service;

import gov.taxation.dto.ReportSearchForm;
import gov.taxation.entity.Report;
import gov.taxation.entity.User;
import gov.taxation.enumerated.RoleEnum;
import gov.taxation.repository.ReportRepository;
import gov.taxation.util.ReportSpecification;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
public class ReportService {

    private static final Logger LOG = LoggerFactory.getLogger(ReportService.class);

    @Autowired
    private ReportRepository reportRepository;

    @Transactional
    public Report save(Report report) {
        LOG.info("Create or update report: {}", report.getId());
        return reportRepository.save(report);
    }

    public Optional<Report> findReportById(Long id) {
        return reportRepository.findById(id);
    }

    @Secured("ROLE_ADMIN")
    public Page<Report> findPaginated(User user, Pageable pageable, ReportSearchForm form) {

        Specification<Report> specification = null;

        if (form.getName() != null && !form.getName().isEmpty()) {
            specification = ReportSpecification.hasUserName(form.getName());
        }

        if (form.getType() != null) {
            if (specification == null) {
                specification = ReportSpecification.hasUserType(form.getType());
            } else {
                specification = specification.and(ReportSpecification.hasUserType(form.getType()));
            }
        }

        if (form.getStatus() != null) {
            if (specification == null) {
                specification = ReportSpecification.hasStatus(form.getStatus());
            } else {
                specification = specification.and(ReportSpecification.hasStatus(form.getStatus()));
            }
        }

        if (!user.getRole().getName().equals(RoleEnum.ROLE_ADMIN.name())) {
            if (specification == null) {
                specification = ReportSpecification.hasUser(user);
            } else {
                specification = specification.and(ReportSpecification.hasUser(user));
            }
        }

        if (specification != null) {
            return this.reportRepository.findAll(specification, pageable);
        }


        return reportRepository.findAll(pageable);

    }

    public Page<Report> findPaginated(User user, Pageable pageable) {
        if (user.getRole().getName().equals(RoleEnum.ROLE_ADMIN.name())) {
            return reportRepository.findAll(pageable);
        } else {
            return this.reportRepository.findByUser(user, pageable);
        }
    }

}
