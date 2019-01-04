package ecjtu.controller.impl;

import ecjtu.entity.LoginUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("login")
public class LoginController {

    @RequestMapping("/index1")
    public ModelAndView login(HttpServletRequest request){
        String id = request.getParameter("id");
        String psw = request.getParameter("psw");
        System.out.println("id:"+id+","+"psw"+psw);
        //页面转发数据
//        return "loginInfo";
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("id",id);
        map.put("psw",psw);
        ModelAndView mv=new ModelAndView("loginInfo",map);
        return mv;
    }
    //注解方式
    @RequestMapping("index2")
    public ModelAndView login2(@RequestParam("id") String pid, @RequestParam("psw") String pswd){
        System.out.println("id:"+pid+","+"psw"+pswd);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("id",pid);
        map.put("psw",pswd);
        ModelAndView mv=new ModelAndView("loginInfo",map);
        return mv;
    }

    //页面传值
    @RequestMapping("index3")
    public ModelAndView login3(LoginUser loginUser){
        String id = loginUser.getId();
        String psw = loginUser.getPsw();
        System.out.println("id:"+id+","+"psw"+psw);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("id",id);
        map.put("psw",psw);
        ModelAndView mv=new ModelAndView("loginInfo",map);
        return mv;
    }

}
