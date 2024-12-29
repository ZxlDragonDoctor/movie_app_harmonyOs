package com.zxl.move_recomend_backed.Model.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * @TableName favorite_movie
 */
@TableName(value ="favorite_movie")
@Data
public class FavoriteMovie implements Serializable {
    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 电影id
     */
    private Integer movieId;

    /**
     * 添加收藏时间
     */
    private Date addedAt;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}