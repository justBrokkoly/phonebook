package phonebook.service;

import phonebook.model.Contact;
import java.util.List;

public interface ContactService {

    List<Contact> getAllContacts();
    Contact getContactById(Long id);
    void deleteContact(Long id);
    void saveContact(Contact contact);
    boolean isEmailAlreadyInUse(String email);






}
