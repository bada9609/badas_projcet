package pack.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AMainController {

   @RequestMapping("amain")
   public String amain() {
      return "amain";
   }

}