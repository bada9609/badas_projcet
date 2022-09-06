package pack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class ShopAdminMainController {

   @RequestMapping("amain")
   public String amain() {
      return "/admin/amain";
   }

}