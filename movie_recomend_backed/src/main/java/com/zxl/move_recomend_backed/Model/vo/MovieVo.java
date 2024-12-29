package com.zxl.move_recomend_backed.Model.vo;




import java.io.Serializable;


import lombok.Data;

@Data
public class MovieVo implements Serializable {
    /**
     * id
     */
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

}