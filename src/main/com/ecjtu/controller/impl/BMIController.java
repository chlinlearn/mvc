package ecjtu.controller.impl;

import ecjtu.entity.BMI;
import ecjtu.entity.LoginUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("bmi")
public class BMIController {
    private double bmi;
    private String str;

    @RequestMapping("/input")
    public String bmi(){
        return "bmi";
    }
    @RequestMapping("/health")
    @ResponseBody
    public ModelAndView health(@RequestParam("weight") Double w, @RequestParam("height") Double h){
        System.out.println("weight:"+w+","+"height:"+h);
        Map<String,Object> map = new HashMap<String,Object>();
        bmi = w/h/h;
        if(bmi<19){
            str = "偏瘦";
        }
        else if(bmi>25){
            str = "偏胖";
        }else {
            str = "正常";
        }
        map.put("bmi",bmi);
        map.put("str",str);
        ModelAndView mv=new ModelAndView("health",map);
        return mv;

    }
}
