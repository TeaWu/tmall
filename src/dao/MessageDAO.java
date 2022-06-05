package dao;

import bean.Message;
import util.DateUtil;
import util.DbUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * @author mingqi
 */
public class MessageDAO {

    public int getTotal() {
        int total = 0;
        try (Connection c = DbUtil.getConnection();
             Statement s = c.createStatement()) {
            String sql = "select count(*) from message where deleteAt is null";
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    public List<Message> list(int start, int count) {
        List<Message> messages = new ArrayList<>();
        try (Connection c = DbUtil.getConnection();
             Statement s = c.createStatement()) {
            String sql = "select * from message where deleteAt is null order by id desc limit " + start + "," + count;
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                Message message = new Message();
                message.setId(rs.getInt("id"));
                message.setUser(new UserDAO().get(rs.getInt("uid")));
                message.setContent(rs.getString("content"));
                message.setCreateDate(rs.getTimestamp("createDate"));
                message.setReplyUser(new UserDAO().get(rs.getInt("replyUid")));
                message.setReplyContent(rs.getString("replyContent"));
                message.setReplyCreateDate(rs.getTimestamp("replyCreateDate"));
                messages.add(message);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return messages;
    }

    public void add(Message message) {
        try (Connection c = DbUtil.getConnection();
             Statement s = c.createStatement()) {
            String sql = "insert into message(uid,content,createDate) values(" +
                    message.getUser().getId() + ",'" +
                    message.getContent() + "','" +
                    DateUtil.d2t(message.getCreateDate()) + "')";
            s.execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void reply(String mid, int uid, String reply) {
        try (Connection c = DbUtil.getConnection();
             Statement s = c.createStatement()) {
            String sql = "update message set replyUid=" + uid + ",replyContent='" + reply + "',replyCreateDate='" + DateUtil.d2t(new java.util.Date()) + "' where id=" + mid;
            s.execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Message> get(int uid) {
        List<Message> messages = new ArrayList<>();
        try (Connection c = DbUtil.getConnection();
             Statement s = c.createStatement()) {
            String sql = "select * from message where uid=" + uid + " and deleteAt is null order by id desc";
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                Message message = new Message();
                message.setId(rs.getInt("id"));
                message.setUser(new UserDAO().get(rs.getInt("uid")));
                message.setContent(rs.getString("content"));
                message.setCreateDate(rs.getTimestamp("createDate"));
                message.setReplyUser(new UserDAO().get(rs.getInt("replyUid")));
                message.setReplyContent(rs.getString("replyContent"));
                message.setReplyCreateDate(rs.getTimestamp("replyCreateDate"));
                messages.add(message);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return messages;
    }

    public void delete(String mid) {
        try (Connection c = DbUtil.getConnection();
             Statement s = c.createStatement()) {
            String sql = "update message set deleteAt='" + DateUtil.d2t(new java.util.Date()) + "' where id=" + mid;
            s.execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
