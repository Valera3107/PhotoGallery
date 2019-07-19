package com.ua.photoGallery.controller;

import java.io.FileNotFoundException;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ua.photoGallery.dao.ImageRepository;
import com.ua.photoGallery.domain.Image;
import com.ua.photoGallery.service.ImageService;

@Controller
public class ImageController {

	@Autowired
	private ImageService imageService;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView welcome() {
		ModelAndView mav = new ModelAndView("mainPage");
		mav.addObject("photos", imageService.getAllImages());
		return mav;
	}

	@RequestMapping(value = "/uploadImage", method = RequestMethod.GET)
	public String uploadImageGet() {
		return "uploadImage";
	}

	@PostMapping(value = "/uploadImage")
	public String uploadImage(@RequestParam MultipartFile image, @RequestParam String name, @RequestParam String marker,
			@RequestParam String author) throws IOException {
		imageService.storeFile(image, author, name, marker);

		return "redirect:/home";
	}

	@GetMapping(value = "/photo")
	public ResponseEntity<Resource> downlaodFile(@RequestParam String id) throws FileNotFoundException {
		Image fileMultipart = imageService.getFile(id);

		return ResponseEntity.ok().contentType(MediaType.parseMediaType(fileMultipart.getFileType()))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileMultipart.getFileName() + "\"")
				.body(new ByteArrayResource(fileMultipart.getData()));
	}
}
