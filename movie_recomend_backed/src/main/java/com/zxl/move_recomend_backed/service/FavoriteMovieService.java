package com.zxl.move_recomend_backed.service;

import com.zxl.move_recomend_backed.Model.dto.MovieUserLoginRequest;
import com.zxl.move_recomend_backed.Model.pojo.FavoriteMovie;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zxl.move_recomend_backed.Model.pojo.Movie;
import com.zxl.move_recomend_backed.Model.pojo.MovieUser;
import com.zxl.move_recomend_backed.Model.vo.MovieVo;

import java.util.List;

/**
* @author 朱小龙
* @description 针对表【favorite_movie】的数据库操作Service
* @createDate 2024-12-25 11:10:11
*/
public interface FavoriteMovieService extends IService<FavoriteMovie> {

    long storeMovie(MovieUser user, Integer movieId);

    String getEncryptPassword(String userPassword);

    long removeFavMovie(MovieUser user, Integer movieid);

    long justyFlush(MovieUser user, Integer movieid);

    List<MovieVo> queryAllFav(MovieUserLoginRequest request);

    List<MovieVo> getListMoveVo(List<Movie> movies);
}
