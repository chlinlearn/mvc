package ecjtu.controller.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import ecjtu.entity.Student;
import ecjtu.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
@RequestMapping("easyui")
public class EasyUIController {
    @RequestMapping("index")
    public String index(){
        return "easyUiTableData";
    }
    //模拟从数据库查找数据
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

/**
 * @RequestBody : 接受前台json数据,把json数据封装Javabean
 * @ResponseBody ：把后台的pojo转换json数据返回给前台，没数据返回会报错
 * */

    @RequestMapping("find")
    @ResponseBody//用在方法前面
    public JSONObject easyUiData(){
        //1.将数据转换成字符串
        String jsonstr = JSON.toJSONString(getData());
        //2.将字符串转换成JSONObject
        JSONObject jo = JSONObject.parseObject(jsonstr);
        return jo;
    }

}
