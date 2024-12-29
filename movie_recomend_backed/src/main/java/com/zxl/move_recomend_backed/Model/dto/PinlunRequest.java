package com.zxl.move_recomend_backed.Model.dto;

import com.zxl.move_recomend_backed.Model.pojo.MovieUser;
import lombok.Data;

import java.io.Serializable;

@Data
public class PinlunRequest implements Serializable {
    private String username;
    private Integer movieid;
    private String content;
}
