package com.spt.trainning;
import com.spt.trainning.domain.Score;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Score.class)
@Controller
@RequestMapping("/scores")
@RooWebScaffold(path = "scores", formBackingObject = Score.class)
public class ScoreController {
}
