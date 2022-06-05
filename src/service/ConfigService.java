package service;

import bean.Config;
import dao.ConfigDAO;

import java.util.List;

/**
 * @author Dream-Rain
 */
public class ConfigService {
    private ConfigDAO dao = new ConfigDAO();

    public int getTotal() {
        return dao.getTotal();
    }
    public void update(Config bean) {
        dao.update(bean);
    }
    public Config get(int id){
        return dao.get(id);
    }
    public List<Config> list(){
        return dao.list();
    }
}
