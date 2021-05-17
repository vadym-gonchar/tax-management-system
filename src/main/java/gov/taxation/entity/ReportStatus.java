package gov.taxation.entity;

import lombok.Data;

import javax.persistence.*;

@Entity(name = "report_statuses")
@Data
public class ReportStatus {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;
}