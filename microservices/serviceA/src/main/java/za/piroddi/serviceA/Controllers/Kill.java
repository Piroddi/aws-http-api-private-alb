package za.piroddi.serviceA.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.net.InetAddress;
import java.net.UnknownHostException;

import java.util.HashMap;
import java.util.Map;

@Controller
public class Kill {

    @GetMapping("/kill")
    public String main() {

        System.exit(0);

        return "kill";
    }

}
