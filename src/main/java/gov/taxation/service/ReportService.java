package gov.taxation.service;

import gov.taxation.entity.Report;
import gov.taxation.entity.User;
import gov.taxation.enumerated.RoleEnum;
import gov.taxation.repository.ReportRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

    public Page<Report> findPaginated(User user, Pageable pageable) {

        if (user == null) {
            LOG.error("User is Null");
            throw new RuntimeException("User has not been found");
        }

        if (user.getRole().getName().equals(RoleEnum.ROLE_ADMIN.name())) {
            return reportRepository.findAll(pageable);
        } else {
            return this.reportRepository.findByUser(user, pageable);
        }
    }

}
