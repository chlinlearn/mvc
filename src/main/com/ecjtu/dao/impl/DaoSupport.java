package ecjtu.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;
import java.util.Map;

public class DaoSupport {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
//    映射器的名字
    private String mapperName;

    public SqlSessionTemplate getSqlSessionTemplate() {
        return sqlSessionTemplate;
    }

    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public String getMapperName() {
        return mapperName;
    }

    public void setMapperName(String mapperName) {
        this.mapperName = mapperName;
    }

    public void save(Object obj){

        sqlSessionTemplate.insert(mapperName+".save",obj);
    }
    //查找符合条件的所有结果集
    public List<?> findByAll(Map<String,Object> map){
        return sqlSessionTemplate.selectList(mapperName+".findByALL",map);
    }

    public List<?> findByCondition(Map<String,Object> map){
        return sqlSessionTemplate.selectList(mapperName+".findByCondition",map);
    }

    public void delete(int id){
        sqlSessionTemplate.delete(mapperName+".delete",id);
    }

    public void update(Object obj){
        sqlSessionTemplate.update(mapperName+".update",obj);
    }

}
