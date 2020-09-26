package za.piroddi.serviceA.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import za.piroddi.serviceA.Dao.User;

import java.util.HashMap;
import java.util.Map;


@Controller
public class Greeting {




    @GetMapping("/greeting")
    public String main(Model model) {

        User Kelvin =User.builder()
                .firstName("Kelvin")
                .lastName("Piroddi")
                .email("kpiroddi@gmail.com")
                .build();

        Map<String, User> test = new HashMap<>();
        test.put("1",Kelvin);


        model.addAttribute("name", Kelvin.getFirstName());
        model.addAttribute("users", test);

        return "greeting";
    }


}
