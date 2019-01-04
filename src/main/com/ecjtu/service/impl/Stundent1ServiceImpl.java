package ecjtu.service.impl;

import ecjtu.dao.impl.DaoSupport;
import ecjtu.service.Student1Service;
import ecjtu.dao.impl.Student1DaoImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("bStudent1")
public class Stundent1ServiceImpl extends SuperService implements Student1Service {
    @Resource(name="Student1Dao")
    private Student1DaoImpl dao;
    public DaoSupport getDao(){
        return dao;
    }

}
