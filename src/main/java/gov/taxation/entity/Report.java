package gov.taxation.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import java.math.BigDecimal;
import java.util.Date;

@Entity(name = "reports")
@Data
public class Report {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "report_date")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @NotNull
    private Date reportDate;

    @Column(name = "rate")
    @NotNull
    @Digits(integer = 6, fraction = 2)
    @Positive
    private BigDecimal rate;

    @Column(name = "comment")
    private String comment;

    @ManyToOne
    @JoinColumn(name = "status_id")
    private ReportStatus status;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_at", updatable = false)
    private Date createdAt;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "last_modified")
    private Date lastModified;

    @ManyToOne
    @JoinColumn(name = "users_id")
    private User user;

    @PrePersist
    public void onCreate() {
        lastModified = createdAt = new Date();
    }

    @PreUpdate
    public void onUpdate() {
        lastModified = new Date();
    }
}