// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.spt.trainning;

import com.spt.trainning.ExaminationController;
import com.spt.trainning.domain.Examination;
import com.spt.trainning.domain.Examine;
import com.spt.trainning.domain.Score;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ExaminationController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ExaminationController.create(@Valid Examination examination, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, examination);
            return "examinations/create";
        }
        uiModel.asMap().clear();
        examination.persist();
        return "redirect:/examinations/" + encodeUrlPathSegment(examination.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ExaminationController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Examination());
        return "examinations/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ExaminationController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("examination", Examination.findExamination(id));
        uiModel.addAttribute("itemId", id);
        return "examinations/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ExaminationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("examinations", Examination.findExaminationEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Examination.countExaminations() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("examinations", Examination.findAllExaminations(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "examinations/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ExaminationController.update(@Valid Examination examination, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, examination);
            return "examinations/update";
        }
        uiModel.asMap().clear();
        examination.merge();
        return "redirect:/examinations/" + encodeUrlPathSegment(examination.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ExaminationController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Examination.findExamination(id));
        return "examinations/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ExaminationController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Examination examination = Examination.findExamination(id);
        examination.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/examinations";
    }
    
    void ExaminationController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("examination_createddate_date_format", "dd/MM/yyyy");
        uiModel.addAttribute("examination_updateddate_date_format", "dd/MM/yyyy");
    }
    
    void ExaminationController.populateEditForm(Model uiModel, Examination examination) {
        uiModel.addAttribute("examination", examination);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("examines", Examine.findAllExamines());
        uiModel.addAttribute("scores", Score.findAllScores());
    }
    
    String ExaminationController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}