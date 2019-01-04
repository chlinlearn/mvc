package ecjtu.service.impl;

import ecjtu.dao.impl.DaoSupport;
import ecjtu.dao.impl.EmployeeDaoImpl;
import ecjtu.dao.impl.Student1DaoImpl;
import ecjtu.service.EmployeeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("sEmployee")
public class EmployeeServiceImpl extends SuperService implements EmployeeService {
    @Resource(name="EmployeeDao")
    private EmployeeDaoImpl dao;
    public DaoSupport getDao(){
        return dao;
    }
}
