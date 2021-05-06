package gov.taxation.repository;

import gov.taxation.entity.ReportStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReportStatusRepository extends JpaRepository<ReportStatus, Long> {

    ReportStatus findByName(String name);

}