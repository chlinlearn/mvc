package ecjtu.dao.impl;

import ecjtu.dao.Student1Dao;
import org.springframework.stereotype.Repository;

@Repository("Student1Dao")
public class Student1DaoImpl extends DaoSupport implements Student1Dao {

    public Student1DaoImpl(){
        setMapperName("mapper.Student1Mapper");
    }

}
