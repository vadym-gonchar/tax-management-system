package gov.taxation.dto;

import lombok.Data;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class ReportDTO {

    @NotNull
    private Date reportDate;

    @NotNull
    private BigDecimal rate;

    @NotNull
    private Long status;

    private String comment;

    private Date createdAt;
}