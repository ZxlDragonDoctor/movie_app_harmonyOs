package com.zxl.move_recomend_backed.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zxl.move_recomend_backed.Model.dto.MovieUserLoginRequest;
import com.zxl.move_recomend_backed.Model.pojo.Movie;
import com.zxl.move_recomend_backed.Model.pojo.MovieUser;
import com.zxl.move_recomend_backed.Model.vo.MovieVo;
import com.zxl.move_recomend_backed.exception.BusinessException;
import com.zxl.move_recomend_backed.exception.ErrorCode;
import com.zxl.move_recomend_backed.mapper.MovieMapper;
import com.zxl.move_recomend_backed.mapper.MovieUserMapper;
import com.zxl.move_recomend_backed.service.FavoriteMovieService;
import com.zxl.move_recomend_backed.Model.pojo.FavoriteMovie;
import com.zxl.move_recomend_backed.mapper.FavoriteMovieMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.ArrayList;
import java.util.List;

/**
* @author 朱小龙
* @description 针对表【favorite_movie】的数据库操作Service实现
* @createDate 2024-12-25 11:10:11
*/
@Service
public class FavoriteMovieServiceImpl extends ServiceImpl<FavoriteMovieMapper, FavoriteMovie>
    implements FavoriteMovieService {
    @Autowired
    MovieUserMapper movieUserMapper; //用户查询用户ID;
    @Autowired
    MovieMapper movieMapper;//用户查询电影信息

    @Transactional
    @Override
    public long storeMovie(MovieUser user, Integer movieid) {
        QueryWrapper<MovieUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",user.getUsername());
        String encryptPassword = getEncryptPassword(user.getPassword());
        queryWrapper.eq("password",encryptPassword);
        MovieUser movieUser = movieUserMapper.selectOne(queryWrapper);

        Integer userId = movieUser.getId();
        FavoriteMovie favoriteMovie = new FavoriteMovie();
        favoriteMovie.setUserId(userId);
        favoriteMovie.setMovieId(movieid);
        System.out.println("插入的favoritMovie的信息"+favoriteMovie);
        return  this.baseMapper.insert(favoriteMovie);
    }
    @Override
    public String getEncryptPassword(String userPassword) {
        // 混淆密码
        final String SALT = "zxl";
        return DigestUtils.md5DigestAsHex((SALT + userPassword).getBytes());
    }

    @Override
    public long removeFavMovie(MovieUser user, Integer movieid) {
        QueryWrapper<MovieUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",user.getUsername());
        String encryptPassword = getEncryptPassword(user.getPassword());
        queryWrapper.eq("password",encryptPassword);
        MovieUser movieUser = movieUserMapper.selectOne(queryWrapper);

        Integer userId = movieUser.getId();

        QueryWrapper<FavoriteMovie> favQueryWrapper = new QueryWrapper<>();
        favQueryWrapper.eq("user_id",userId);
        favQueryWrapper.eq("movie_id",movieid);
        return this.baseMapper.delete(favQueryWrapper);
    }

    @Override
    public long justyFlush(MovieUser user, Integer movieid) {
        QueryWrapper<MovieUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",user.getUsername());
        String encryptPassword = getEncryptPassword(user.getPassword());
        queryWrapper.eq("password",encryptPassword);
        MovieUser movieUser = movieUserMapper.selectOne(queryWrapper);

        Integer userId = movieUser.getId();

        QueryWrapper<FavoriteMovie> favQueryWrapper = new QueryWrapper<>();
        favQueryWrapper.eq("user_id",userId);
        favQueryWrapper.eq("movie_id",movieid);
        FavoriteMovie favoriteMovie = this.baseMapper.selectOne(favQueryWrapper);
        if(favoriteMovie==null){
            return 0;
        }
        return 1;
    }

    @Override
    public List<MovieVo> queryAllFav(MovieUserLoginRequest request) {
        QueryWrapper<MovieUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",request.getUsername());
        MovieUser movieUser = movieUserMapper.selectOne(queryWrapper);
        Integer userId = movieUser.getId(); //获取用户id
        QueryWrapper<FavoriteMovie> favMovieQueryWrapper = new QueryWrapper<>();
        favMovieQueryWrapper.eq("user_id",userId);
        List<FavoriteMovie> favoriteMovies = this.baseMapper.selectList(favMovieQueryWrapper);

        if(favoriteMovies==null){
            throw new BusinessException(ErrorCode.PARAMS_ERROR,"当前用户没有收藏任何电影");
        }
        //获取当前用户收藏的电影信息
        List<Integer> movieids = new ArrayList<>();
        for(FavoriteMovie favoriteMovie:favoriteMovies){
            movieids.add(favoriteMovie.getMovieId());
        }
        List<Movie> movies = movieMapper.selectBatchIds(movieids);
        return getListMoveVo(movies);
    }
    @Override
    public List<MovieVo> getListMoveVo(List<Movie> movies){
        if(movies==null){
            return null;
        }
        List<MovieVo> movieVoList = new ArrayList<>();
        for(Movie movie:movies){
            MovieVo movieVo = new MovieVo();
            BeanUtil.copyProperties(movie,movieVo);
            movieVoList.add(movieVo);
        }
        return movieVoList;
    }
}




