package ecjtu.dao.impl;

import ecjtu.dao.EmployeeDao;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

@Repository("EmployeeDao")
public class EmployeeDaoImpl extends DaoSupport implements EmployeeDao {
    public EmployeeDaoImpl(){
        setMapperName("mapper.EmployeeMapper");
    }
}
