package ecjtu.service.impl;
import ecjtu.dao.impl.DaoSupport;
import java.util.List;
import java.util.Map;

public abstract class SuperService {
    public abstract DaoSupport getDao();
    public void save(Object obj){
        getDao().save(obj);
    }
    public List<?> findByAll(Map<String,Object> map){
        return getDao().findByAll(map);
    }
    public void delete(int id){
        getDao().delete(id);
    }

    public void update(Object obj){
        getDao().update(obj);
    }
}
