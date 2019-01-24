package phonebook.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import phonebook.model.Contact;

public interface ContactRepository extends JpaRepository<Contact,Long> {

    boolean existsContactByEmail(String email);

}
