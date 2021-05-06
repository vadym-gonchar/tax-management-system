package gov.taxation.enumerated;

public enum ReportStatusEnum {

    PENDING("pending"),
    APPROVED("approved"),
    REJECTED("rejected");

    private final String name;


    ReportStatusEnum(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }
}