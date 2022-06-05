package bean;

import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * @author littlestar
 */
@Data
public class Notice {
    private int id;
    private User user;
    private String title;
    private String content;
    private Date createDate;
    private int status;
}
