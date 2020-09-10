package com.funtl.spring.security.oauth2.server.service;

import com.funtl.spring.security.oauth2.server.entity.TbUser;

public interface TbUserService {
    /**
     * @param username
     * @return
     */
    TbUser getByUsername(String username);
}
