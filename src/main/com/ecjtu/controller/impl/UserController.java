package ecjtu.controller.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPObject;
import ecjtu.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController {
    @RequestMapping("/open")
    public String openUser(){
        return "user/user";
    }

    public void setData(){
        Map<String,Object> map = new HashMap<String,Object>();
        List<User> list = new ArrayList<User>();
        User user1 = new User("001","张三",12);
        User user2 = new User("002","张三",23);
        User user3 = new User("003","张三",21);
        list.add(user1);
        list.add(user2);
        list.add(user3);
        map.put("total",list.size());
        map.put("rows",list);
    }

    public Map<String,Object> getData(){
        Map<String,Object> map = new HashMap<String,Object>();
        List<User> list = new ArrayList<User>();
        User user1 = new User("001","张三",12);
        User user2 = new User("002","张三",23);
        User user3 = new User("003","张三",21);
        list.add(user1);
        list.add(user2);
        list.add(user3);
        map.put("total",list.size());
        map.put("rows",list);
        return map;
    }
    @RequestMapping("/find")
    @ResponseBody
    public JSONObject findData(){
        //1.将数据转换成字符串
        String jsonstr = JSON.toJSONString(getData());
        //2.将字符串转换成JSONObject
        JSONObject jo = JSONObject.parseObject(jsonstr);
        return jo;
    }
    @RequestMapping("add")
    @ResponseBody
    public ModelAndView addUser(@RequestBody User user){
        getData();
        return null;
    }
}
