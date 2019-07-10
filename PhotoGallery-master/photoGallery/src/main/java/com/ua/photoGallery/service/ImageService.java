package com.ua.photoGallery.service;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.ua.photoGallery.dao.ImageRepository;
import com.ua.photoGallery.domain.Image;

@Service
public class ImageService {

	Logger logger = LoggerFactory.getLogger(ImageService.class);
	
	@Autowired
	private ImageRepository imageRepository;

	public Image storeFile(MultipartFile file, String author, String name, String marker) throws IOException {
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		Image image = null;

		if (!fileName.contains("..")) {
			image = new Image(marker, file.getBytes(), author, name, file.getOriginalFilename(), file.getContentType(),
					Base64.getEncoder().encodeToString(file.getBytes()));
		}

		logger.info("Save image to db " + image);
		return imageRepository.save(image);
	}

	public Image getFile(String id) {
		logger.info("Get image from db " + id);
		return imageRepository.findById(Integer.parseInt(id.replaceAll("\\s", ""))).get();
	}

	public List<Image> getAllImages(){
		return imageRepository.findAll();
	}
}
