package com.spt.trainning;
import com.spt.trainning.domain.Examination;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Examination.class)
@Controller
@RequestMapping("/examinations")
@RooWebScaffold(path = "examinations", formBackingObject = Examination.class)
public class ExaminationController {
}
