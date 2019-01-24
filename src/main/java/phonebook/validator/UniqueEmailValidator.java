package phonebook.validator;

import org.springframework.beans.factory.annotation.Autowired;
import phonebook.service.ContactService;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UniqueEmailValidator implements ConstraintValidator<UniqueEmail, String> {

    @Autowired
    private ContactService contactService;

    @Override
    public boolean isValid(String email, ConstraintValidatorContext context) {
        try {

        return email!=null && !contactService.isEmailAlreadyInUse(email);
        }catch (NullPointerException ex){
            return true;
        }
    }


}
