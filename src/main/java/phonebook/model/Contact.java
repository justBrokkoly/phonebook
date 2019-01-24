package phonebook.model;

import org.hibernate.validator.constraints.Length;
import phonebook.validator.UniqueEmail;
import javax.persistence.*;
import javax.validation.constraints.*;


@Entity
public class Contact {

    private static final String REGEXP="^((8|\\+7)[\\- ]?)?(\\(?\\d{3}\\)?[\\- ]?)?[\\d\\- ]{7,10}$";

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private  Long id;

    @NotBlank(message = "Поле обязательно к заполнению")
    @Size(min=2,max=30,message = "В поле доступны имена от 2 до 30 символов")
    @Column(name = "first_name", nullable = false)
    private String firstName;

    @NotBlank(message = "Поле обязательно к заполнению")
    @Size(min=2,max=30,message = "В поле доступны имена от 2 до 30 символов")
    @Column(name = "last_name", nullable = false, length = 40)
    private String lastName;

    @UniqueEmail
    @Email(message = "Неверный формат")
    @Length(max = 100)
    private String email;

    @NotBlank
    @Size(max = 100)
    private String address;


    @Pattern(regexp = REGEXP,message ="неверный формат" )
    @Column(name = "phone_numberMobile")
    @NotBlank(message = "Поле обязательно к заполнению")
    private String phoneNumberMobile;

    @Pattern(regexp = REGEXP,message ="неверный формат")
    @Column(name = "phone_numberWork")
    private String phoneNumberWork;

    @Length(max = 8)
    @Pattern(regexp = REGEXP,message ="неверный формат")
    @Column(name = "phone_numberHome")
    private String phoneNumberHome;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumberMobile() {
        return phoneNumberMobile;
    }

    public void setPhoneNumberMobile(String phoneNumberMobile) {
        this.phoneNumberMobile = phoneNumberMobile;
    }

    public String getPhoneNumberWork() {
        return phoneNumberWork;
    }

    public void setPhoneNumberWork(String phoneNumberWork) {
        this.phoneNumberWork = phoneNumberWork;
    }

    public String getPhoneNumberHome() {
        return phoneNumberHome;
    }

    public void setPhoneNumberHome(String phoneNumberHome) {
        this.phoneNumberHome = phoneNumberHome;
    }


}
