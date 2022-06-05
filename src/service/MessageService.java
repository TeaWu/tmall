package service;

import bean.Category;
import bean.Message;
import dao.MessageDAO;

import java.util.List;

/**
 * @author littlestar
 */
public class MessageService {
    private final MessageDAO messageDao = new MessageDAO();
    public int getTotal() {
        return messageDao.getTotal();
    }

    public List<Message> list(int start, int count) {
        return messageDao.list(start, count);
    }

    public List<Message> get(int id) {
        return messageDao.get(id);
    }
    public void leave(Message message) {
        messageDao.add(message);
    }

    public void reply(String mid, int uid, String reply) {
        messageDao.reply(mid, uid, reply);
    }

    public void delete(String mid) {
        messageDao.delete(mid);
    }
}
