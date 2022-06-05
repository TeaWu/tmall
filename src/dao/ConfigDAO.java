package dao;

import bean.Config;
import util.DbUtil;
import util.DateUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Dream-Rain
 */
public class ConfigDAO {
    public int getTotal() {
        int total = 0;
        try (Connection c = DbUtil.getConnection();
             Statement s = c.createStatement()) {
            String sql = "select count(*) from config where deleteAt is null";
            ResultSet rs = s.executeQuery(sql);
            if(rs.next()){
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    public void update(Config bean){
        String sql = "update config set value = ? where deleteAt is null and id = ?";
        try(Connection c = DbUtil.getConnection();
            PreparedStatement ps = c.prepareStatement(sql)){
            ps.setString(1,bean.getValue());
            ps.setInt(2,bean.getId());
            ps.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public Config get(int id){
        Config bean = null;
        String sql = "select * from config where deleteAt is null and id=?";
        try(Connection c = DbUtil.getConnection();
            PreparedStatement ps = c.prepareStatement(sql)){
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                bean = new Config();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCname(rs.getString("cname"));
                bean.setValue(rs.getString("value"));
                bean.setRate(rs.getInt("rate"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return bean;
    }

    public List<Config> list(){
        List<Config> beans = new ArrayList<>();
        String sql = "select * from config where deleteAt is null";
        try(Connection c = DbUtil.getConnection();
            PreparedStatement ps = c.prepareStatement(sql)){
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Config bean = new Config();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCname(rs.getString("cname"));
                bean.setValue(rs.getString("value"));
                bean.setRate(rs.getInt("rate"));
                beans.add(bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return beans;
    }
}
