package za.piroddi.serviceB.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import za.piroddi.serviceB.Dao.User;

import java.util.HashMap;
import java.util.Map;


@Controller
public class Greeting {

    @GetMapping("/greeting")
    public String main(Model model) {

        return "greeting";
    }


}
