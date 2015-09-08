package com.spt.trainning;
import com.spt.trainning.domain.Account;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Account.class)
@Controller
@RequestMapping("/accounts")
@RooWebScaffold(path = "accounts", formBackingObject = Account.class)
public class AccountController {
}
