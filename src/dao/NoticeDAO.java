package dao;

import bean.Notice;
import util.DateUtil;
import util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author littlestar
 */
public class NoticeDAO {
    /**
     * 获取所有公告
     */
    public List<Notice> list() {
        List<Notice> beans = new ArrayList<>();
        String sql = "select * from notice where deleteAt is null";
        try (Connection c = DbUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Notice bean = new Notice();
                bean.setId(rs.getInt("id"));
                bean.setUser(new UserDAO().get(rs.getInt("uid")));
                bean.setTitle(rs.getString("title"));
                bean.setContent(rs.getString("content"));
                bean.setCreateDate(rs.getTimestamp("createDate"));
                bean.setStatus(rs.getInt("status"));
                beans.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return beans;
    }

    public int getTotal() {
        int total = 0;
        String sql = "select count(*) from notice where deleteAt is null";
        try (Connection c = DbUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    public void delete(int id) {
        String sql = "update notice set deleteAt = now() where id = ?";
        try (Connection c = DbUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void add(Notice notice) {
        String sql = "insert into notice (uid, title, content, createDate, status) values(?, ?, ?,?, 1)";
        try (Connection c = DbUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, notice.getUser().getId());
            ps.setString(2, notice.getTitle());
            ps.setString(3, notice.getContent());
            ps.setTimestamp(4, DateUtil.d2t(notice.getCreateDate()));
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
