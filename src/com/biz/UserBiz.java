package com.biz;

import java.sql.Connection;
import static common.JDBCTemplate.*;
import com.dao.UserDaoImpl;
import com.vo.UserVo;



public class UserBiz {

	public int checkLoginUser(String userID, String userPassword) {
		Connection conn=getConnection();
		int res=new UserDaoImpl(conn).checkLoginUser(userID, userPassword);
		Close(conn);
		return res;
	}
	public int joinUser(UserVo vo) {
		Connection conn=getConnection();
		int res=new UserDaoImpl(conn).joinUser(vo);
		Close(conn);
		return res;
	}
}
