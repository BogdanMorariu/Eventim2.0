package events.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import events.model.Category;
import events.service.ManageService;

@Controller
@RequestMapping("/categories")
public class CategoryController {

	@Autowired
	private ManageService manageService;

	@RequestMapping("/createCategory")
	public ModelAndView createCategory(@Valid Category category, BindingResult result, Model uiModel) {
		if (result.hasErrors()) {
			return new ModelAndView("createCategory", uiModel.asMap());
		}
		try {
			manageService.saveCategory(category);
			return new ModelAndView("createdSuccessfully");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return new ModelAndView("createCategory", uiModel.asMap());
		}
	}

	@RequestMapping("/updateCategory")
	public ModelAndView updateCategory(@Valid Category category, BindingResult result, Model uiModel) {
		if (result.hasErrors()) {
			return new ModelAndView("updateCategory", uiModel.asMap());
		}
		try {
			manageService.saveCategory(category);
			return new ModelAndView("updatedSuccessfully");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return new ModelAndView("updateCategory", uiModel.asMap());
		}
	}

	@RequestMapping("/deleteCategory")
	public ModelAndView deleteCategory(@Valid Category category, BindingResult result, Model uiModel) {
		if (result.hasErrors()) {
			return new ModelAndView("deleteCategory", uiModel.asMap());
		}
		try {
			manageService.deleteCategoryById(category.getId());
			return new ModelAndView("deletedSuccessfully");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return new ModelAndView("deleteCategory", uiModel.asMap());
		}
	}
}
