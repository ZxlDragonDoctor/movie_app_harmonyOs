package com.zxl.move_recomend_backed.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zxl.move_recomend_backed.Model.dto.PinlunRequest;
import com.zxl.move_recomend_backed.Model.pojo.MovieUser;
import com.zxl.move_recomend_backed.Model.vo.MovieReviewVo;
import com.zxl.move_recomend_backed.mapper.MovieUserMapper;
import com.zxl.move_recomend_backed.service.MovieReviewService;
import com.zxl.move_recomend_backed.Model.pojo.MovieReview;
import com.zxl.move_recomend_backed.mapper.MovieReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
* @author 朱小龙
* @description 针对表【movie_review】的数据库操作Service实现
* @createDate 2024-12-25 11:10:11
*/
@Service
public class MovieReviewServiceImpl extends ServiceImpl<MovieReviewMapper, MovieReview>
    implements MovieReviewService {
    @Autowired
    MovieUserMapper movieUserMapper;

    @Override
    public List<MovieReviewVo> queryListMovieReview(Integer moveid) {
        QueryWrapper<MovieReview> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("movie_id",moveid);
        List<MovieReview> list = this.baseMapper.selectList(queryWrapper);
        return getListMoveReviewVo(list);

    }
    @Override
    public List<MovieReviewVo> getListMoveReviewVo(List<MovieReview> movieReviews){
        if(movieReviews==null){
            return null;
        }
        List<MovieReviewVo> movieReviewVos = new ArrayList<>();
        for(MovieReview movieReview:movieReviews){
            MovieReviewVo movieReviewVo = new MovieReviewVo();
            BeanUtil.copyProperties(movieReview,movieReviewVo);
            movieReviewVos.add(movieReviewVo);
        }
        return movieReviewVos;
    }

    @Transactional
    @Override
    public long insertMovieReview(PinlunRequest request) {
        QueryWrapper<MovieUser> movieUserQueryWrapper = new QueryWrapper<>();
        movieUserQueryWrapper.eq("username",request.getUsername());
        MovieUser movieUser = movieUserMapper.selectOne(movieUserQueryWrapper);
        Integer userId = movieUser.getId();
        MovieReview movieReview = new MovieReview();
        movieReview.setUserId(userId);
        movieReview.setMovieId(request.getMovieid());
        movieReview.setContent(request.getContent());
        return this.baseMapper.insert(movieReview);
    }
}




