package bean;

import lombok.Data;

/**
 * @author littlestar
 */
@Data
public class User {
    /**
     * 用户id
     */
    private int id;
    /**
     * 用户名
     */
    private String name;
    /**
     * 密码
     */
    private String password;
    /**
     * 用户组
     * superAdmin: 超级管理员
     * admin: 管理员
     * user: 普通用户
     */
    private String group;
    /**
     * 收货人姓名
     */
    private String receiver;
    /**
     * 收货人电话
     */
    private String mobile;
    /**
     * 收货人地址
     */
    private String address;
    /**
     * 用户状态
     * 0代表正常
     * 1代表冻结
     */
    private int status;
}
