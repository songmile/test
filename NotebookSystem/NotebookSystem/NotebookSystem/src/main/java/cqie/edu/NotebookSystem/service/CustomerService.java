package cqie.edu.NotebookSystem.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cqie.edu.NotebookSystem.comm.PageQo;
import cqie.edu.NotebookSystem.domain.Customer;
import cqie.edu.NotebookSystem.domain.qo.CustomerQo;
import cqie.edu.NotebookSystem.domain.vo.CustomerVo;
import cqie.edu.NotebookSystem.mapper.CustomerMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomerService {
    @Autowired
    private CustomerMapper customerMapper;
    @Autowired
    private UserService userService;
    //分页查询符合条件的实体
    public PageInfo<CustomerVo> paged(PageQo<CustomerQo> pageQo) {
        PageHelper.startPage(pageQo.getPageIndex(), pageQo.getPageSize());
        List<Customer> mos = customerMapper.list(pageQo.getFilters());
        if (mos == null) return null;
        PageInfo<Customer> moPageInfo = new PageInfo<>(mos);
        PageInfo<CustomerVo> voPageInfo = new PageInfo<>();
        BeanUtils.copyProperties(moPageInfo, voPageInfo);
        List<CustomerVo> vos = new ArrayList<>();
        for (Customer mo : mos) {
            CustomerVo vo = new CustomerVo();
            BeanUtils.copyProperties(mo, vo);
            if(mo.getUserId()!=null) {
                //映射-绑定用户
                vo.setUser(userService.getById(mo.getUserId()));
            }
            vos.add(vo);
        }
        voPageInfo.setList(vos);
        return voPageInfo;
    }

    // 新增实体
    public int insert(Customer mo) {
        return customerMapper.insert(mo);
    }

    // 修改实体
    public int update(Customer mo) {
        return customerMapper.update(mo);
    }

    // 根据主键删除实体
    public int deleteById(int id) {
        return customerMapper.deleteById(id);
    }


    // 根据主键获取实体
    public CustomerVo getById(int id) {
        Customer mo = customerMapper.getById(id);
        if(mo==null) return null;
        CustomerVo vo = new CustomerVo();
        BeanUtils.copyProperties(mo, vo);
        if(mo.getUserId()!=null) {
            //映射-绑定用户
            vo.setUser(userService.getById(mo.getUserId()));
        }
        return vo;
    }

    // 根据userId获取实体
   public Customer getByUserId(int userId) {
       return customerMapper.getByUserId(userId);
   }

    // 指定名称的实体是否已经存在
    public boolean existName(String name, Integer id) {
        Customer mo = customerMapper.getByName(name, id);
        return mo != null;
    }
}
