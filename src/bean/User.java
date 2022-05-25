package bean;

import lombok.Data;

/**
 * @author littlestar
 */
@Data
public class User {
    private int id;
    private String name;
    private String password;
    private String group;
    private int state;
}
