package cqie.edu.NotebookSystem.comm;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//api返回值
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RetJson {
    /** 状态码 */
    private int code;
    /** 消息 */
    private String msg;
    /** 数据 */
    private Object data;
}
