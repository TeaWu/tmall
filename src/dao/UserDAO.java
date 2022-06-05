package dao;

import bean.User;
import util.DateUtil;
import util.DbUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author littlestar
 */
public class UserDAO {
    public int getTotal() {
        int total = 0;
        try (Connection c = DbUtil.getConnection();
             Statement s = c.createStatement()) {
            String sql = "select count(*) from user where deleteAt is null";
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    public void add(User bean) {
        String sql = "insert into user (`name`,`password`) values (?,?)";
        try (Connection c = DbUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, bean.getName());
            ps.setString(2, bean.getPassword());
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
                bean.setId(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(User bean) {
        String sql = "update user set name = ? , password = ? where deleteAt is null and id = ?";
        try (Connection c = DbUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, bean.getName());
            ps.setString(2, bean.getPassword());
            ps.setInt(3, bean.getId());
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateReceiverInfo(String receiver, String mobile, String address, int id) {
        String sql = "update user set receiver=?,mobile=?,address=? where deleteAt is null and id = ?";
        try (Connection c = DbUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, receiver);
            ps.setString(2, mobile);
            ps.setString(3, address);
            ps.setInt(4, id);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "update user set deleteAt = ? where deleteAt is null and id = ?";
        try (Connection c = DbUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setTimestamp(1, DateUtil.nowTimestamp());
            ps.setInt(2, id);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> list(int start, int count) {
        List<User> beans = new ArrayList<>();
        String sql = "select * from user where deleteAt is null limit ?,?";
        try (Connection c = DbUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, start);
            ps.setInt(2, count);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User bean = new User();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setGroup(rs.getString("group_"));
                bean.setPassword(rs.getString("password"));
                bean.setStatus(rs.getInt("status"));
                bean.setReceiver(rs.getString("receiver"));
                bean.setMobile(rs.getString("mobile"));
                bean.setAddress(rs.getString("address"));
                beans.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return beans;
    }


    public User get(int id) {
        User bean = null;
        String sql = "select * from user where deleteAt is null and id=?";
        try (Connection c = DbUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                bean = new User();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setGroup(rs.getString("group_"));
                bean.setPassword(rs.getString("password"));
                bean.setStatus(rs.getInt("status"));
                bean.setReceiver(rs.getString("receiver"));
                bean.setMobile(rs.getString("mobile"));
                bean.setAddress(rs.getString("address"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bean;
    }

    public User get(String name) {
        User bean = null;
        String sql = "select * from user where deleteAt is null and name=?";
        try (Connection c = DbUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                bean = new User();
                bean.setId(rs.getInt("id"));
                bean.setGroup(rs.getString("group_"));
                bean.setName(rs.getString("name"));
                bean.setPassword(rs.getString("password"));
                bean.setStatus(rs.getInt("status"));
                bean.setReceiver(rs.getString("receiver"));
                bean.setMobile(rs.getString("mobile"));
                bean.setAddress(rs.getString("address"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bean;
    }

    public User get(String name, String password) {
        User bean = null;
        String sql = "select * from user where deleteAt is null and name=? and password=?";
        try (Connection c = DbUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                bean = new User();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setPassword(rs.getString("password"));
                bean.setGroup(rs.getString("group_"));
                bean.setStatus(rs.getInt("status"));
                bean.setReceiver(rs.getString("receiver"));
                bean.setMobile(rs.getString("mobile"));
                bean.setAddress(rs.getString("address"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bean;
    }


    public void freezeOption(int id, String flag) {
        String sql = "update user set status = ? where deleteAt is null and id = ?";
        try (Connection c = DbUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, "freeze".equals(flag) ? 0 :1);
            ps.setInt(2, id);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUser(User bean) {
        String sql = "update user set name = ? , receiver = ? , mobile = ? , address = ? where deleteAt is null and id = ?";
        try (Connection c = DbUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, bean.getName());
            ps.setString(2, bean.getReceiver());
            ps.setString(3, bean.getMobile());
            ps.setString(4, bean.getAddress());
            ps.setInt(5, bean.getId());
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
