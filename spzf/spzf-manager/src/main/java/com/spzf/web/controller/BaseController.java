package com.spzf.web.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BaseController {
	// 成功
	public final int SUCCESS = 100;
	// 失败
	public final int FAIL = 101;

	/**test123
	 * @Comment: 获取文件的扩展名
	 * @author 
	 * @Create Date 2013-5-29
	 * @param imgFile
	 * @return
	 */
	public static String getExt(MultipartFile imgFile) {
		return imgFile.getOriginalFilename()
				.substring(imgFile.getOriginalFilename().lastIndexOf('.') + 1)
				.toLowerCase();
	}

	/**
	 * @Comment: 获取文件的扩展名
	 * @author 
	 * @Create Date 2013-5-29
	 * @param imgFile
	 * @return
	 */
	public static String getExt(String fileName) {
		return fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();
	}

	/**
	 * 验证上传文件类型是否属于图片格式
	 * 
	 * @return
	 */
	public static boolean validateImageFileType(MultipartFile imgFile) {
		if (imgFile != null && imgFile.getSize() > 0) {
			List<String> arrowType = Arrays.asList("image/bmp", "image/png",
					"image/gif", "image/jpg", "image/jpeg", "image/pjpeg");
			List<String> arrowExtension = Arrays.asList("gif", "jpg", "bmp",
					"png", "xls");
			String ext = getExt(imgFile);
			return arrowType.contains(imgFile.getContentType().toLowerCase())
					&& arrowExtension.contains(ext);
		}
		return true;
	}
}