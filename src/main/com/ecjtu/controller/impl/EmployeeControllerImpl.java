package ecjtu.controller.impl;

import ecjtu.controller.EmployeeController;
import ecjtu.entity.Employee;
import ecjtu.entity.Student;
import ecjtu.service.impl.EmployeeServiceImpl;
import ecjtu.service.impl.SuperService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("employee")
public class EmployeeControllerImpl extends BussinessController implements EmployeeController {

    @Resource(name="sEmployee")
    private EmployeeServiceImpl service;
    public SuperService getService(){
        return service;
    }
    public Employee getModel(){
        return new Employee();
    }
    @RequestMapping("/manage")
    public String manage(){
        return "employee/employeeManage";
    }
    @RequestMapping("/addEmployee")
    public String addEmployee(){
        return "employee/employee";
    }
}
