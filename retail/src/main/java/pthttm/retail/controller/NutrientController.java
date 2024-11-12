package pthttm.retail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pthttm.retail.model.Nutrient;
import pthttm.retail.model.ProductNutrient;
import pthttm.retail.service.NutrientService;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class NutrientController {
    @Autowired
    private NutrientService nutrientService;
    @GetMapping("/nutrient")
    public String getNutrientPage(Model model,
                                  @RequestParam Map<String, String> params) {
        List<Nutrient> nutrients = nutrientService.findAllNutrients();
        model.addAttribute("nutrients", nutrients);
        return "danhmuc/nutrient";
    }
}
