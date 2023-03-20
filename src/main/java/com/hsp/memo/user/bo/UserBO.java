package com.hsp.memo.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hsp.memo.common.EncryptService;
import com.hsp.memo.user.dao.UserDAO;
import com.hsp.memo.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(
			String loginId
			, String password
			, String name
			, String email) {
		
		String encryptPassword = EncryptService.md5(password);

		
		return userDAO.insertUser(loginId, encryptPassword, name, email);
	}
	
	public User getUser(String loginId, String password) {
		
		String encryptPassword = EncryptService.md5(password);
		
		return userDAO.selectUser(loginId, encryptPassword);
	}
	
	
}
