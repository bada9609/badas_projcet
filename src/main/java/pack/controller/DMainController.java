package pack.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DMainController {

   @RequestMapping("dmain")
   public String dmain() {
      return "dmain";
   }

}