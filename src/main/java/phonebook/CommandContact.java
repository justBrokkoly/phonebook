package phonebook;

import phonebook.validator.UniqueEmail;

import javax.validation.constraints.Email;

public class CommandContact {

    private Long id;

    @UniqueEmail
    @Email
    private String email;

    public CommandContact() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
