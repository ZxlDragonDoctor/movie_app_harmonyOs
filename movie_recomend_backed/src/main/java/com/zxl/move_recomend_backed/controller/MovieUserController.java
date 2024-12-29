package com.zxl.move_recomend_backed.controller;

import com.zxl.move_recomend_backed.Model.dto.MovieUserLoginRequest;
import com.zxl.move_recomend_backed.Model.dto.MovieUserRegisterRequest;
import com.zxl.move_recomend_backed.Model.pojo.MovieUser;
import com.zxl.move_recomend_backed.Model.vo.LoginUserVo;
import com.zxl.move_recomend_backed.common.BaseResponse;
import com.zxl.move_recomend_backed.common.ResultUtils;
import com.zxl.move_recomend_backed.exception.ErrorCode;
import com.zxl.move_recomend_backed.exception.ThrowUtils;
import com.zxl.move_recomend_backed.service.MovieUserService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@RestController
@RequestMapping("/movieUser")
public class MovieUserController {
    @Autowired
    private MovieUserService movieUserService;
    //获取所有用户
    @GetMapping("/listMovieUser")
    public BaseResponse<List<MovieUser>> ListMovieUser() {
        List<MovieUser> list = movieUserService.queryListUser();
        return ResultUtils.success(list);
    }
    //注册
    @PostMapping("register")
    public BaseResponse<Long> register(@RequestBody MovieUserRegisterRequest request){
        ThrowUtils.throwIf(request == null, ErrorCode.PARAMS_ERROR);
        String username = request.getUsername();
        String userPassword = request.getPassword();
        String checkPassword = request.getCheckPassword();
        long result = movieUserService.userRegister(username, userPassword, checkPassword);
        return ResultUtils.success(result);
    }
    //登录

    /**
     * httpSession保存当前用户信息
     * @param request
     * @param session
     * @return
     */
    @PostMapping("login")
    public BaseResponse<LoginUserVo> login(@RequestBody MovieUserLoginRequest request, HttpSession session){
        ThrowUtils.throwIf(request == null, ErrorCode.PARAMS_ERROR);
        String username = request.getUsername();
        String userPassword = request.getPassword();
        LoginUserVo loginUserVo = movieUserService.userLogin(username,userPassword);
        return ResultUtils.success(loginUserVo);
    }


}
