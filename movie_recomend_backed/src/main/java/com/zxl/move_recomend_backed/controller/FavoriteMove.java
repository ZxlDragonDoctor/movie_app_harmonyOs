package com.zxl.move_recomend_backed.controller;


import com.zxl.move_recomend_backed.Model.dto.MovieUserLoginRequest;
import com.zxl.move_recomend_backed.Model.dto.SaveMovieRequest;
import com.zxl.move_recomend_backed.Model.vo.MovieVo;
import com.zxl.move_recomend_backed.common.BaseResponse;
import com.zxl.move_recomend_backed.common.ResultUtils;
import com.zxl.move_recomend_backed.exception.ErrorCode;
import com.zxl.move_recomend_backed.exception.ThrowUtils;
import com.zxl.move_recomend_backed.service.FavoriteMovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("favorite")
public class FavoriteMove {
    @Autowired
    private final FavoriteMovieService favoriteMovieService;

    public FavoriteMove(FavoriteMovieService favoriteMovieService) {
        this.favoriteMovieService = favoriteMovieService;
    }

    //添加到我的收藏(收藏)
    @PostMapping ("/save")
    public BaseResponse<Long> addFav(@RequestBody SaveMovieRequest request){
        System.out.println("user:"+request.getUser());
        System.out.println("MovieId"+request.getMovieid());
        long res = favoriteMovieService.storeMovie(request.getUser(),request.getMovieid());
        return ResultUtils.success(res);
    }
    //取消我的收藏
    @PostMapping("remove")
    public BaseResponse<Long> delFav(@RequestBody SaveMovieRequest request){
        System.out.println("user:"+request.getUser());
        System.out.println("MovieId"+request.getMovieid());
        long res = favoriteMovieService.removeFavMovie(request.getUser(),request.getMovieid());
        return ResultUtils.success(res);
    }
    @PostMapping("justy")
    //判断当前时候收藏
    public BaseResponse justyAll(@RequestBody SaveMovieRequest request){
        System.out.println("user:"+request.getUser());
        System.out.println("MovieId"+request.getMovieid());
        long res = favoriteMovieService.justyFlush(request.getUser(),request.getMovieid());
        return res>0?ResultUtils.success(res):ResultUtils.error(ErrorCode.PARAMS_ERROR);
    }
    //查询我的收藏栏
    @PostMapping("/selectFav")
    public BaseResponse<List<MovieVo>> selectAll(@RequestBody MovieUserLoginRequest request){
        ThrowUtils.throwIf(request==null,ErrorCode.PARAMS_ERROR);
        List<MovieVo> movieVoList = favoriteMovieService.queryAllFav(request);
        System.out.println("movielist===============");
        System.out.println(movieVoList);
        return ResultUtils.success(movieVoList);
    }
}
