package gov.taxation.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity(name = "report_statuses")
@Getter
@Setter
public class ReportStatus {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;
}