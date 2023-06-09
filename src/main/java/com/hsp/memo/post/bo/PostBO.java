package com.hsp.memo.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hsp.memo.common.FileManagerService;
import com.hsp.memo.post.dao.PostDAO;
import com.hsp.memo.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String title, String content, MultipartFile file) {
		// 파일 저장 -> 파일 경로 생성 -> DB에 저장
		String imagePath = FileManagerService.saveFile(userId, file); // file이 없으면 null
		return postDAO.insertPost(userId, title, content, imagePath);
	}
	
	public List<Post> getPostList(int userId) {
		return postDAO.selectPostList(userId);
	}
	
	public Post getPost(int id) {
		return postDAO.selectPost(id);
	}
	
	public int updatePost(int postId, String title, String content) {
		return postDAO.updatePost(postId, title, content);
	}
	
	public int deletePost(int postId) {
		Post post = postDAO.selectPost(postId);
		FileManagerService.removeFile(post.getImagePath());
		
		return postDAO.deletePost(postId);
		
		
	}

}
