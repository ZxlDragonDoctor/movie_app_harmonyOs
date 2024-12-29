package com.zxl.move_recomend_backed.service;

import com.zxl.move_recomend_backed.Model.pojo.MovieUser;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zxl.move_recomend_backed.Model.vo.LoginUserVo;
import com.zxl.move_recomend_backed.Model.vo.MovieVo;

import java.util.List;

/**
* @author 朱小龙
* @description 针对表【movie_user】的数据库操作Service
* @createDate 2024-12-25 11:10:11
*/
public interface MovieUserService extends IService<MovieUser> {

    List<MovieUser> queryListUser();

    long userRegister(String username, String userPassword, String checkPassword);

    /**
     *MD5数据加密
     * @param userPassword
     * @return
     */

    String getEncryptPassword(String userPassword);

    LoginUserVo userLogin(String username, String userPassword);

    LoginUserVo getLoginUserVo(MovieUser user);


}
