package phonebook;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import phonebook.model.Contact;
import phonebook.service.ContactService;

@SpringBootApplication
public class PhonebookApplication implements CommandLineRunner {

    @Autowired
    ContactService contactService;

    public static void main(String[] args) {
        SpringApplication.run(PhonebookApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        Contact contact = new Contact();
        contact.setEmail("qwerty@yandex.ru");
        contact.setAddress("Спб");
        contact.setFirstName("Кирилл");
        contact.setLastName("Кустов");
        contact.setPhoneNumberHome("3547109");
        contact.setPhoneNumberMobile("+79834471287");
        contact.setPhoneNumberWork("+79833371233");
        contactService.saveContact(contact);

        Contact contact1 = new Contact();
        contact1.setEmail("tretre@mail.ru");
        contact1.setAddress("Москва");
        contact1.setFirstName("Артем");
        contact1.setLastName("Бончичев");
        contact1.setPhoneNumberMobile("3228822");
        contactService.saveContact(contact1);

        Contact contact2 = new Contact();
        contact2.setEmail("popop@mail.ru");
        contact2.setAddress("Екб");
        contact2.setFirstName("Денис");
        contact2.setLastName("Петров");
        contact2.setPhoneNumberHome("5432277");
        contact2.setPhoneNumberMobile("+79215577999");
        contactService.saveContact(contact2);

    }

}

