package phonebook.service;

import org.springframework.stereotype.Service;
import phonebook.model.Contact;
import phonebook.repos.ContactRepository;
import java.util.List;


@Service
public class ContactServiceImpl implements ContactService {

    private ContactRepository contactRepository;
    public ContactServiceImpl(ContactRepository contactRepository) {
        this.contactRepository = contactRepository;
    }

    @Override
    public List<Contact> getAllContacts() {
        return contactRepository.findAll();
    }

    @Override
    public Contact getContactById(Long id) {

        return contactRepository.findById(id).orElseThrow(NullPointerException::new);
    }

    @Override
    public void deleteContact(Long id) {
        contactRepository.deleteById(id);
    }

    @Override
    public void saveContact(Contact contact) {
        contactRepository.save(contact);
    }


    @Override
    public boolean isEmailAlreadyInUse(String email) throws NullPointerException {

        boolean emailInDb=true;
        if(!contactRepository.existsContactByEmail(email) )
            emailInDb=false;

     return emailInDb;
    }

}
