package com.zxl.move_recomend_backed.Model.pojo;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName movie_user
 */
@TableName(value ="movie_user")
@Data
public class MovieUser implements Serializable {
    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 用户名称
     */
    private String username;

    /**
     * 用户密码
     */
    private String password;

    /**
     * 用户头像
     */
    private String avatar;

    /**
     * 用户昵称
     */
    private String nickname;

    @TableLogic
    private Integer deleted;
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}