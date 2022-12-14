package service;

import bean.User;
import dao.UserDAO;

import java.util.List;

public class UserService {
    private UserDAO dao = new UserDAO();

    public int getTotal() {
        return dao.getTotal();
    }

    public void add(User bean) {
        dao.add(bean);
    }

    public void update(User bean) {
        dao.update(bean);
    }

    public void updateUser(User bean) {
        dao.updateUser(bean);
    }


    public void updateReceiverInfo(String receiver, String mobile, String address, int uid) {
        dao.updateReceiverInfo(receiver, mobile, address, uid);
    }

    public void delete(int id) {
        dao.delete(id);
    }

    public void freeze(int id) {
        dao.freezeOption(id, "freeze");
    }

    public void unfreeze(int id) {
        dao.freezeOption(id, "unfreeze");
    }

    public User get(int id) {
        return dao.get(id);
    }

    public User get(String name) {
        return dao.get(name);
    }

    public User get(String name, String password) {
        return dao.get(name, password);
    }

    public boolean passwordIsRight(String id, String password) {
        return dao.get(id, password) != null;
    }

    public boolean isExist(String name) {
        return dao.get(name) != null;
    }

    public List<User> list(int start, int count) {
        return dao.list(start, count);
    }

    public List<User> list() {
        return dao.list(0, Short.MAX_VALUE);
    }
}
