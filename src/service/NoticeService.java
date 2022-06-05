package service;

import bean.Notice;
import dao.NoticeDAO;

import java.util.List;

/**
 * @author littlestar
 */
public class NoticeService {
    private final NoticeDAO noticeDAO = new NoticeDAO();

    /**
     * 获取所有公告
     */
    public List<Notice> list() {
        return noticeDAO.list();
    }

    public int getTotal() {
        return noticeDAO.getTotal();
    }

    public void delete(int id) {
        noticeDAO.delete(id);
    }

    public void add(Notice notice) {
        noticeDAO.add(notice);
    }
}
