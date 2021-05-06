package gov.taxation.service;

import gov.taxation.entity.ReportStatus;
import gov.taxation.enumerated.ReportStatusEnum;
import gov.taxation.repository.ReportStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReportStatusService {

    @Autowired
    private ReportStatusRepository reportStatusRepository;

    public List<ReportStatus> findAll() {
        return this.reportStatusRepository.findAll();
    }

    public ReportStatus getStatus(ReportStatusEnum reportStatusEnum) {
        return this.reportStatusRepository.findByName(reportStatusEnum.getName());
    }
}