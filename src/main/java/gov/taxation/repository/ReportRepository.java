package gov.taxation.repository;

import gov.taxation.entity.Report;
import gov.taxation.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReportRepository extends JpaRepository<Report, Long> {

    @EntityGraph(attributePaths = "status")
    Page<Report> findByUser(User user, Pageable pageable);

    @Override
    @EntityGraph(attributePaths = {"status", "user"})
    Page<Report> findAll(Pageable pageable);

}