package com.zxl.move_recomend_backed.Model.dto;


import lombok.Data;

import java.io.Serializable;

@Data
public class MovieUserLoginRequest implements Serializable {
    /**
     * 用户名称
     */
    private String username;

    /**
     * 用户密码
     */
    private String password;

}