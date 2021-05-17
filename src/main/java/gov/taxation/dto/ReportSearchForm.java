package gov.taxation.dto;

import gov.taxation.entity.ReportStatus;
import gov.taxation.entity.UserType;
import lombok.Data;

@Data
public class ReportSearchForm {

    private String name;

    private UserType type;

    private ReportStatus status;

}
