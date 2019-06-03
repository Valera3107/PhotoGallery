package com.ua.photoGallery.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.function.Supplier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ua.photoGallery.dao.ImageRepository;
import com.ua.photoGallery.dao.UserRepository;
import com.ua.photoGallery.domain.Image;
import com.ua.photoGallery.domain.User;
import com.ua.photoGallery.service.ImageService;
import com.ua.photoGallery.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private ImageService imageService;

	@Autowired
	private ImageRepository imageRepository;
	
	private Supplier<User> getUser = () -> {
		String emailUser = SecurityContextHolder.getContext().getAuthentication().getName();
		User user = userRepository.findByEmail(emailUser).get();
		return user;
	};

	@RequestMapping(value = { "/", "/login" }, method = RequestMethod.GET)
	public String login(Model model, String error, String logout) {
		if (error != null) {
			model.addAttribute("error", "Check your data input!");
		}
		if (logout != null) {
			model.addAttribute("message", "You have not been login!");
		}
		return "login";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String registration(Model model) {
		model.addAttribute("modelUser", new User());

		return "registration";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String create(@ModelAttribute("modelUser") User modelUser, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "registration";
		}

		userService.save(modelUser);

		return "redirect:/login";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView welcome() {
		ModelAndView mav = new ModelAndView("mainPage");
		mav.addObject("photos", imageRepository.findAll());
		return mav;
	}

	@RequestMapping(value = "/uploadImage", method = RequestMethod.GET)
	public String uploadImageGet() {
		return "uploadImage";
	}

	@PostMapping(value = "/uploadImage")
	public String uploadImage(@RequestParam MultipartFile image, @RequestParam String name,
			@RequestParam String marker, @RequestParam String author) throws IOException {
		imageService.storeFile(image, author, name, marker);

		return "redirect:/home";
	}

	@RequestMapping(value = "/addToFavorite", method = RequestMethod.GET)
	public ModelAndView addToFavorite(@RequestParam String id) {
		User user = getUser.get();
		Image fileMultipart = imageService.getFile(id);
		if (!user.getImages().contains(fileMultipart)) {
			user.getImages().add(fileMultipart);
			userRepository.save(user);
		}
		return openFavorite();
	}

	@GetMapping(value = "/delete")
	public String deletePhoto(@RequestParam String id) {
		Image fileMultipart = imageService.getFile(id);
		userRepository.findAll().stream().peek(e -> e.getImages().removeIf(p -> p.equals(fileMultipart)));
		imageRepository.delete(fileMultipart);
		return "redirect:/home";
	}
	
	@GetMapping(value = "/deleteFavorite")
	public String deleteFavorite(@RequestParam String id) {
		Image fileMultipart = imageService.getFile(id);
		User user = getUser.get();
		user.getImages().removeIf(p -> p.equals(fileMultipart));
		userService.update(user);
		return "redirect:/favorite";
	}

	@GetMapping(value = "/favorite")
	public ModelAndView openFavorite() {
		User user = getUser.get();
		ModelAndView mav = new ModelAndView("favorite");
		mav.addObject("favorites", user.getImages());
		return mav;
	}

	@GetMapping(value = "/photo")
	public ResponseEntity<Resource> downlaodFile(@RequestParam String id) throws FileNotFoundException {
		Image fileMultipart = imageService.getFile(id);

		return ResponseEntity.ok().contentType(MediaType.parseMediaType(fileMultipart.getFileType()))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileMultipart.getFileName() + "\"")
				.body(new ByteArrayResource(fileMultipart.getData()));
	}
}
