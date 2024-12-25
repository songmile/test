package cqie.edu.NotebookSystem.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cqie.edu.NotebookSystem.comm.PageQo;
import cqie.edu.NotebookSystem.domain.User;
import cqie.edu.NotebookSystem.domain.qo.UserQo;
import cqie.edu.NotebookSystem.domain.vo.UserVo;
import cqie.edu.NotebookSystem.mapper.UserMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    //分页查询符合条件的实体
    public PageInfo<UserVo> paged(PageQo<UserQo> pageQo) {
        PageHelper.startPage(pageQo.getPageIndex(), pageQo.getPageSize());
        List<User> mos = userMapper.list(pageQo.getFilters());
        if (mos == null) return null;
        PageInfo<User> moPageInfo = new PageInfo<>(mos);
        PageInfo<UserVo> voPageInfo = new PageInfo<>();
        BeanUtils.copyProperties(moPageInfo, voPageInfo);
        List<UserVo> vos = new ArrayList<>();
        for (User mo : mos) {
            UserVo vo = new UserVo();
            BeanUtils.copyProperties(mo, vo);
            //映射-状态
            vo.setStatusName(vo.getStatus().equals(0) ? "正常" : "禁用");
            vos.add(vo);
        }
        voPageInfo.setList(vos);
        return voPageInfo;
    }

    // 新增实体
    public int insert(User user) {
        return userMapper.insert(user);
    }

    // 修改实体
    public int update(User user) {
        return userMapper.update(user);
    }

    // 根据主键删除实体
    public int deleteById(int id) {
        return userMapper.deleteById(id);
    }

    // 根据主键获取实体
    public UserVo getById(int id) {
        User mo = userMapper.getById(id);
        if(mo == null){
            return null;
        }
        UserVo vo = new UserVo();
        BeanUtils.copyProperties(mo, vo);
        //映射-状态
        vo.setStatusName(mo.getStatus().equals(0) ? "正常" : "禁用");
        return vo;
    }

    // 指定账号的实体是否已经存在
    public boolean existAccount(String account, Integer id) {
        User mo = userMapper.getByAccount(account, id);
        return mo != null;
    }

    // 登录验证
    public User checkLogin(String account, String password) {
        return userMapper.checkLogin(account, password);
    }
}
