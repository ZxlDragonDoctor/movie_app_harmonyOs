package com.zxl.move_recomend_backed.controller;



import com.zxl.move_recomend_backed.Model.vo.MovieVo;
import com.zxl.move_recomend_backed.common.BaseResponse;
import com.zxl.move_recomend_backed.common.ResultUtils;
import com.zxl.move_recomend_backed.exception.ErrorCode;
import com.zxl.move_recomend_backed.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/movie")
public class MovieController {
    @Autowired
    private MovieService movieService;
    //电影信息
    @GetMapping("/listMovie")
    public BaseResponse<List<MovieVo>> listMovie(){
        List<MovieVo> movieVoList = movieService.queryListMove();
        return ResultUtils.success(movieVoList);
    }
    //根据Id删除电影信息
    @DeleteMapping("/delete/{movieid}")
    public BaseResponse<Long> deleteMovie(@PathVariable("movieid") Integer movieid){
        Long res = movieService.removeMovieById(movieid);
        return ResultUtils.success(res);
    }
}
