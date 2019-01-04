package ecjtu.controller.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import ecjtu.entity.Student;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/student")
public class StudentControllerImpl {
    private static Map<String,Object> map = new HashMap<String,Object>();
    private static List<Student> list = new ArrayList<Student>();
//    public void StudentController(){
//        System.out.println("StduentController");
//        setData();//设置初始数据列表，并保存list集合中
//        map.put("total",list.size());
//        map.put("rows",list);//list集合封装进map集合中
//    }
    @RequestMapping("/open")
    public String openStudent(){
        return "student/student";
    }

    @RequestMapping("/addStudent")
    public String add(){
        return "student/addStudent";
    }


    public void setData(){
        Student student1 =
                new Student("001","张三","18","男","ecjtu");
        Student student2 =
                new Student("002","李四","18","女","ecjtu");
        list.add(student1);
        list.add(student2);
    }
    public Map<String, Object> getData(Student student){

        if(student!=null)
            list.add(student);
        Student student1 =
                new Student("001","张三","18","男","ecjtu");
        Student student2 =
                new Student("002","李四","18","女","ecjtu");
        list.add(student1);
        list.add(student2);
        map.put("total",list.size());
        map.put("rows",list);
        return map;
    }

    @RequestMapping("find")
    @ResponseBody//用在方法前面
    public JSONObject studentData(){
        //1.将数据转换成字符串
        String jsonstr = JSON.toJSONString(map);
        //2.将字符串转换成JSONObject
        JSONObject jo = JSONObject.parseObject(jsonstr);
        System.out.println(jo);
        return jo;
    }

    @RequestMapping(value = "/add")
    @ResponseBody
    public Object addStudent(@RequestBody Student student){
        getData(student);
        System.out.println("tianjia");
        return student;
    }

}
