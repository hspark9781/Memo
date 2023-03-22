package com.hsp.memo.common;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {

	public static final String FILE_UPLOAD_PATH = "D:\\web_hsp\\spring_project\\upload\\memo\\image";
	
	// 멤버변수를 public으로 쓸거면 final형태(상수형태)
	// 상수 : 대문자로 변수명 지정(final)
	// 파일 저장 -> 경로 생성
	
	public static String saveFile(int userId, MultipartFile file) {
		
		// 사용자 별로 폴더를 구분
		// 시간을 포함해서 폴더를 구분
		// UNIX TIME : 1970년 1월 1이리 부터 흐른 시간을 (milli second 1/1000)
		// 폴더 이름 : userId_time(3_97854624)
		
		String directoryName = "/" + userId + "_" + System.currentTimeMillis() + "/";
		
		// directory 생성
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		File directory = new File(directoryPath);
		if(!directory.mkdir()) {
//			// 디렉토리 생성 실패
			return  null;
		}
		
		// 파일 저장
		try {
			byte[] bytes = file.getBytes();
			
			String filePath = directoryPath + file.getOriginalFilename();
			Path path = Paths.get(filePath);
			
			Files.write(path, bytes);
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
			return null;
		}
		
		// 클라이언트에서 저장된 파일을 접근할수 있는 경로를 리턴
		// 경로 규칙 /images/2_1231452513/test.png
		// http://localhost:8080/images/2_1231452513/test.png
		
		return "/images" + directoryName + file.getOriginalFilename();
		
	}
	
	
}
