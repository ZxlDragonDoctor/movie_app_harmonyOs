package com.zxl.move_recomend_backed.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zxl.move_recomend_backed.Model.vo.MovieVo;
import com.zxl.move_recomend_backed.service.MovieService;
import com.zxl.move_recomend_backed.Model.pojo.Movie;
import com.zxl.move_recomend_backed.mapper.MovieMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
* @author 朱小龙
* @description 针对表【movie】的数据库操作Service实现
* @createDate 2024-12-25 11:10:11
*/
@Service
public class MovieServiceImpl extends ServiceImpl<MovieMapper, Movie>
    implements MovieService {
    @Override
    public List<MovieVo> queryListMove() {
        List<Movie> movies = this.baseMapper.selectList(null);
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

    @Override
    @Transactional
    public Long removeMovieById(Integer movieid) {
        long i = this.baseMapper.deleteById(movieid);
        return  (Long) i;
    }
}




