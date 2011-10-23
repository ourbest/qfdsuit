package com.pt.base.auth;

import com.pt.base.vo.UserInfo;
import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.Arrays;


/**
 * @author yonghui.chen
 * @version 1.0
 * @date 2009-12-17
 */
public class UserDetailServiceImpl implements UserDetailsService {
    private Logger log = Logger.getLogger(UserDetailServiceImpl.class);

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
        UserInfo user = new UserInfo();
        if (username.equals("yuanli")) {
            user.setUsername("yuanli");
            user.setPassword("c4ca4238a0b923820dcc509a6f75849b");
            user.setRealname("原力");
            user.setUserid("001");
            user.setUserrole("1");
            user.setTitle("总设计师");
        }else if (username.equals("admin")) {
            user.setUsername("admin");
            user.setPassword("c4ca4238a0b923820dcc509a6f75849b");
            user.setRealname("原力");
            user.setUserid("001");
            user.setUserrole("9");
            user.setTitle("系统管理员");
        } else if (username.equals("arch")) {
            user.setUsername("arch");
            user.setPassword("c4ca4238a0b923820dcc509a6f75849b");
            user.setRealname("赵文军");
            user.setUserid("001");
            user.setUserrole("8");
            user.setTitle("总设计师");
        } else if (username.equals("eng")) {
            user.setUsername("eng");
            user.setPassword("c4ca4238a0b923820dcc509a6f75849b");
            user.setRealname("黄玉");
            user.setUserid("001");
            user.setUserrole("7");
            user.setTitle("设计师");
        } else if (username.equals("lead")) {
            user.setUsername("lead");
            user.setPassword("c4ca4238a0b923820dcc509a6f75849b");
            user.setRealname("陈莹");
            user.setUserid("001");
            user.setUserrole("6");
            user.setTitle("总指挥");
        } else if (username.equals("des")) {
            user.setUsername("des");
            user.setPassword("c4ca4238a0b923820dcc509a6f75849b");
            user.setRealname("唐陆涛");
            user.setUserid("001");
            user.setUserrole("5");
            user.setTitle("设计师");
        }
        log.debug(user);
        if (user != null) {
            GrantedAuthority authority = new GrantedAuthorityImpl("ROLE_ADMIN");
            UserDetail details = new UserDetail(username, user.getPassword(), true, true, true,
                    true, Arrays.asList(authority));
            details.setRealname(user.getRealname());
            details.setRole(user.getUserrole());
            details.setTitle(user.getTitle());
            details.setUserid(user.getUserid());
            details.setRegion(user.getRegion());
            return details;
        }
        return null;
    }
}
