package com.zxl.move_recomend_backed.service;

import com.zxl.move_recomend_backed.Model.dto.PinlunRequest;
import com.zxl.move_recomend_backed.Model.pojo.MovieReview;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zxl.move_recomend_backed.Model.vo.MovieReviewVo;

import java.util.List;

/**
* @author 朱小龙
* @description 针对表【movie_review】的数据库操作Service
* @createDate 2024-12-25 11:10:11
*/
public interface MovieReviewService extends IService<MovieReview> {

    List<MovieReviewVo> queryListMovieReview(Integer moveid);


    List<MovieReviewVo> getListMoveReviewVo(List<MovieReview> movieReviews);

    long insertMovieReview(PinlunRequest request);
}
