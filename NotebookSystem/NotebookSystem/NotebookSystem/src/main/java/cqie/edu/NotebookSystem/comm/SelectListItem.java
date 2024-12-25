package cqie.edu.NotebookSystem.comm;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 类描述：备选项
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SelectListItem {
    private String text;
    private String value;
}
