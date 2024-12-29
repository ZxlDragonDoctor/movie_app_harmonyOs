package com.zxl.move_recomend_backed.Model.pojo;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName movie
 */
@TableName(value ="movie")
@Data
public class Movie implements Serializable {
    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Integer movieid;

    /**
     * 电影标题
     */
    private String title;

    /**
     * 电影类型
     */
    private String genre;

    /**
     * 导演
     */
    private String director;

    /**
     * 上映日期
     */
    private String releaseDate;

    /**
     * 0未删除 1已删除
     */
    @TableLogic
    private Integer deleted;

    /**
     * 电影海报或宣传图链接
     */
    private String poster;

    /**
     * 电影简介
     */
    private String profile;

    /**
     * 电影链接
     */
    private String link;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}