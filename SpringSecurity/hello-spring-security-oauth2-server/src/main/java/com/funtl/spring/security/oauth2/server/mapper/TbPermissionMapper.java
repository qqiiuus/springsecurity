package com.funtl.spring.security.oauth2.server.mapper;

import com.funtl.spring.security.oauth2.server.entity.TbPermission;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.MyMapper;

import java.util.List;

/**
 * @author zhaozijia
 */
public interface TbPermissionMapper extends MyMapper<TbPermission> {
    /**
     * @param id
     * @return
     */
    List<TbPermission> selectByUserId(@Param("id") Long id);
}
