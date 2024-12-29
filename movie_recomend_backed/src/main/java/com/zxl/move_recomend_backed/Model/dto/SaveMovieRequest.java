package com.zxl.move_recomend_backed.Model.dto;

import com.zxl.move_recomend_backed.Model.pojo.MovieUser;
import lombok.Data;

import java.io.Serializable;

/**
 * 保存收藏请求
 */
@Data
public class SaveMovieRequest implements Serializable {
    private MovieUser user;
    private Integer movieid;
}
