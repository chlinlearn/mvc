package ecjtu.controller.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import ecjtu.entity.Employee;
import ecjtu.service.impl.SuperService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public abstract class BussinessController {
    public abstract SuperService getService();
    public abstract Employee getModel();

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public Object save(@RequestBody String jsonStr){
        System.out.println("jsonStr:"+jsonStr);
//        字符串转换对象
        Object obj = JSON.parseObject(jsonStr,getModel().getClass());
        getService().save(obj);
        return obj;
    }
    @RequestMapping(value = "findByCondition", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject findByAll(@RequestBody String jsonStr) {
        //json字符串转Map对象
        Map<String, Object> map = JSON.parseObject(jsonStr);
        System.out.println("condition:" + map.get("name"));
        List<?> list = getService().findByAll(map);
        Map<String, Object> mapData = new HashMap<String, Object>();
        mapData.put("total", list.size());
        mapData.put("rows", list);
        //map转json字符串，再转json对象，返回前台
        JSONObject jo = JSONObject.parseObject(JSON.toJSONString(mapData));
        System.out.println("json:" + JSON.toJSONString(jo));
        return jo;
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestBody String jsonStr) {
        if (jsonStr.equals("") || jsonStr.equals(null)) {
            String str = "{'message':'删除失败','code':'0'}";
            return JSONObject.parseObject(str);
        } else {
            Map<String ,Object> map=JSONObject.parseObject(jsonStr);
            int id = Integer.parseInt(map.get("id").toString());
            getService().delete(id);
            String str = "{'message':'删除成功','code':'1'}";
            System.out.println(str);
            return JSONObject.parseObject(str);
        }
    }

    @RequestMapping(value = "update",method = RequestMethod.POST)
    public JSONObject update(@RequestBody String jsonStr) {
        Object obj = JSONObject.parseObject(jsonStr,getModel().getClass());
        getService().update(obj);
        String str = "{'message':'修改成功','code':'1'}";
        return JSONObject.parseObject(str);
    }
}
