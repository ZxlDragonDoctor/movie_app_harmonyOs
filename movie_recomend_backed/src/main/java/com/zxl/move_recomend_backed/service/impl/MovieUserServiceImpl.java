package com.zxl.move_recomend_backed.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zxl.move_recomend_backed.Model.vo.LoginUserVo;
import com.zxl.move_recomend_backed.exception.BusinessException;
import com.zxl.move_recomend_backed.exception.ErrorCode;
import com.zxl.move_recomend_backed.service.MovieUserService;
import com.zxl.move_recomend_backed.Model.pojo.MovieUser;
import com.zxl.move_recomend_backed.mapper.MovieUserMapper;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.List;

/**
* @author 朱小龙
* @description 针对表【movie_user】的数据库操作Service实现
* @createDate 2024-12-25 11:10:11
*/
@Service
public class MovieUserServiceImpl extends ServiceImpl<MovieUserMapper, MovieUser>
    implements MovieUserService {

    @Override
    public List<MovieUser> queryListUser() {
        return this.baseMapper.selectList(null);
    }

    @Override
    public long userRegister(String username, String userPassword, String checkPassword) {
        System.out.println(username+","+userPassword);
        // 1. 校验
        if (StrUtil.hasBlank(username, userPassword, checkPassword)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }
        if (username.length() < 4) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户账号过短");
        }
        if (userPassword.length() < 8 || checkPassword.length() < 8) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户密码过短");
        }
        if (!userPassword.equals(checkPassword)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "两次输入的密码不一致");
        }
        // 2. 检查是否重复
        QueryWrapper<MovieUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", username);
        long count = this.baseMapper.selectCount(queryWrapper);
        if (count > 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "账号重复");
        }
        // 3. 加密
        String encryptPassword = getEncryptPassword(userPassword);
        // 4. 插入数据
        MovieUser user = new MovieUser();
        user.setUsername(username);
        user.setPassword(encryptPassword);
        boolean saveResult = this.save(user); //默认主键回显
        if (!saveResult) {
            throw new BusinessException(ErrorCode.SYSTEM_ERROR, "注册失败，数据库错误");
        }
        return user.getId();
    }
    @Override
    public String getEncryptPassword(String userPassword) {
        // 混淆密码
        final String SALT = "zxl";
        return DigestUtils.md5DigestAsHex((SALT + userPassword).getBytes());
    }

    @Override
    public LoginUserVo userLogin(String username, String userPassword) {
        // 1. 校验
        if (StrUtil.hasBlank(username, userPassword)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }
        if (username.length() < 4) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户账号过短");
        }
        if (userPassword.length() < 8 ) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户密码过短");
        }
        //2.根据用户名查询数据库返回user
        QueryWrapper<MovieUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",username);
        MovieUser movieUser = this.baseMapper.selectOne(queryWrapper);
        //3.判断用户名和密码是否相同
        String encryptPassword = getEncryptPassword(userPassword);
        if(movieUser==null || !movieUser.getPassword().equals(encryptPassword)){
            throw new BusinessException(ErrorCode.PARAMS_ERROR,"用户名或者密码有误");
        }
        //4.返归视图对象
        return getLoginUserVo(movieUser);

    }
    @Override
    public LoginUserVo getLoginUserVo(MovieUser user){
        if(user == null){
            return null;
        }
        LoginUserVo loginUserVo = new LoginUserVo();
        BeanUtil.copyProperties(user,loginUserVo);
        return loginUserVo;
    }

}




