package phonebook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import phonebook.CommandContact;
import phonebook.model.Contact;
import phonebook.service.ContactService;
import javax.validation.Valid;
import java.util.List;

@Controller
public class PhonebookController {

    private ContactService contactService;

    public PhonebookController(ContactService contactService) {
        this.contactService = contactService;
    }

    @GetMapping("/contactsList")
    public String allContacts(Model model){
        List<Contact> contacts = contactService.getAllContacts();
        model.addAttribute("contacts",contacts);
        return "listOfContacts";
    }


    @GetMapping("/contact/edit/{id}")
    public String contactOne(@PathVariable Long id, Model model){
        model.addAttribute("contact",contactService.getContactById(id));
        return "form";
    }

    @GetMapping("/form")
    public String addNewContact(Model model){
        Contact contact = new Contact();
        model.addAttribute("contact",contact);
        return "form";
    }

    @PostMapping("/add")
    public  String addContact(@Valid @ModelAttribute Contact contact, BindingResult result){

        if(result.hasErrors()){
            return "form";
        }
        contactService.saveContact(contact);
        return "redirect:/contactsList";
    }

    @GetMapping( "/contact/delete/{id}")
    public  String delete(@PathVariable Long id){

        contactService.deleteContact(id);
        return  "redirect:/contactsList";
    }

    @GetMapping("/contact/edit/{id}/changeEmail")
    public String changeEmail(Model model,@PathVariable("id") Long id){

        Contact contact = contactService.getContactById(id);
        CommandContact commandContact = new CommandContact();
        commandContact.setId(contact.getId());
        commandContact.setEmail(contact.getEmail());
        model.addAttribute("contactCommand",commandContact);
        return "formEmail";
    }



    @PostMapping("/saveEmail")
    public String changeEmail( @Valid @ModelAttribute("contactCommand") CommandContact commandContact,BindingResult result,
                                                                               Model model){
        String newEmail =commandContact.getEmail();
        Long id = commandContact.getId();
        Contact contact =contactService.getContactById(id);
        if(newEmail.equals(contact.getEmail())){
            String message = "нельзя поменять на тотже email";
            model.addAttribute("message",message);
            return "formEmail";
        }

        if(result.hasErrors()){
            return "formEmail";
        }
        contact.setEmail(commandContact.getEmail());
        contactService.saveContact(contact);
        return "redirect:/contact/edit/"+id;
    }
}
