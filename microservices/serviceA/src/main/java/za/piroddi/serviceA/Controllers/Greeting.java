package za.piroddi.serviceA.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import za.piroddi.serviceA.Dao.User;

import java.net.InetAddress;
import java.net.UnknownHostException;

import java.util.HashMap;
import java.util.Map;

@Controller
public class Greeting {

    @GetMapping("/greeting")
    public String main(Model model) {

        InetAddress ip;
        try {
            ip = InetAddress.getLocalHost();
            System.out.println("Your current IP address : " + ip);
            model.addAttribute("ip", ip);
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }

        return "greeting";
    }

}
