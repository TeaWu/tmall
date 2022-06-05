package bean;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * @author littlestar
 */
@Data
public class Order {
    private int id;
    private User user;
    private String orderCode;
    private String address;
    private String receiver;
    private String mobile;
    private Date createDate;
    private Date payDate;
    private BigDecimal sum;
    private Date deliverDate;
    private Date confirmDate;
    private String status;
    private List<OrderItem> orderItems;
    private BigDecimal totalPrice;
    private int totalNumber;
}
