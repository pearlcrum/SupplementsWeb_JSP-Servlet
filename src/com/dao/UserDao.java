package com.dao;

public interface UserDao {

	String checkLoginUser="SELECT userPassword FROM supplementsUser WHERE userID = ?";
	String joinUser="INSERT INTO supplementsUser (userID, userPassword, userName, userGender, userEmail, userBirth) VALUES (?,?,?,?,?,?)";
}
