package com.zxl.move_recomend_backed.Model.vo;


import lombok.Data;

import java.io.Serializable;
import java.sql.Date;

@Data
public class MovieReviewVo implements Serializable {
    /**
     * 主键id
     */
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
     * 评论内容
     */
    private String content;

    /**
     * 评论时间
     */
    private Date createdAt;

}