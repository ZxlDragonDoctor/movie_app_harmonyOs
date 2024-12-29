package com.zxl.move_recomend_backed.controller;


import com.zxl.move_recomend_backed.Model.dto.PinlunRequest;
import com.zxl.move_recomend_backed.Model.vo.MovieReviewVo;
import com.zxl.move_recomend_backed.common.BaseResponse;
import com.zxl.move_recomend_backed.common.ResultUtils;
import com.zxl.move_recomend_backed.exception.ErrorCode;
import com.zxl.move_recomend_backed.service.MovieReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/review")
public class MovieReviewController {
    @Autowired
    private MovieReviewService movieReviewService;
    //返回当前电影所有评论信息，根据电影id值
    @GetMapping("/get/{movieid}")
    public BaseResponse<List<MovieReviewVo>> listMovieReview(@PathVariable("movieid") Integer moveid){
        List<MovieReviewVo> list = movieReviewService.queryListMovieReview(moveid);
        return ResultUtils.success(list);
    }
    //保存评论
    @PostMapping("/saveReview")
    public BaseResponse saveReview(@RequestBody PinlunRequest request){
        long i = movieReviewService.insertMovieReview(request);
        return i>0?ResultUtils.success(null):ResultUtils.error(ErrorCode.SYSTEM_ERROR);
    }
}
