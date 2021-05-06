package gov.taxation.dto;

import gov.taxation.validation.FieldMatch;
import gov.taxation.validation.ValidEmail;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@FieldMatch.List({@FieldMatch(first = "password", second = "matchingPassword", message = "{error.mismatch}")})
@Getter
@Setter
public class UserDTO {

    @NotNull
    private String userName;

    @NotNull
    @Size(min = 6)
    private String password;

    @NotNull
    @Size(min = 6)
    private String matchingPassword;

    @NotNull
    private String firstName;

    @NotNull
    private String lastName;

    @ValidEmail
    @NotNull
    private String email;

    @NotNull
    private Long type;
}