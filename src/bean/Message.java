package bean;

import lombok.Data;

import java.util.Date;

/**
 * @author littlestar
 */
@Data
public class Message {
    private int id;
    private User user;
    private String content;
    private Date createDate;
    private User replyUser;
    private String replyContent;
    private Date replyCreateDate;
}
