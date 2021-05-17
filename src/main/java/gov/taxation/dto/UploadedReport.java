package gov.taxation.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class UploadedReport {

    @JsonFormat(pattern = "dd/MM/yyyy")
    private Date reportDate;

    private BigDecimal rate;

}
