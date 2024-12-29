package com.zxl.move_recomend_backed.service;

import com.zxl.move_recomend_backed.Model.pojo.Movie;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zxl.move_recomend_backed.Model.pojo.MovieUser;
import com.zxl.move_recomend_backed.Model.vo.MovieVo;

import java.util.List;

/**
* @author 朱小龙
* @description 针对表【movie】的数据库操作Service
* @createDate 2024-12-25 11:10:11
*/
public interface MovieService extends IService<Movie> {

    /**
     * 返回电影信息
     * @return
     */
    List<MovieVo> queryListMove();

    /**
     * 获取返回视图集合
     * @param movies
     * @return
     */

    List<MovieVo> getListMoveVo(List<Movie> movies);

    Long removeMovieById(Integer movieid);
}
