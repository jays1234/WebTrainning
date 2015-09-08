package com.spt.trainning;
import com.spt.trainning.domain.Examine;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Examine.class)
@Controller
@RequestMapping("/examines")
@RooWebScaffold(path = "examines", formBackingObject = Examine.class)
public class ExamineController {
}
