package com.ua.photoGallery.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ua.photoGallery.config.WebSecurityConfig;
import com.ua.photoGallery.dao.UserRepository;
import com.ua.photoGallery.domain.Role;
import com.ua.photoGallery.domain.User;

@Service
public class UserService {
	
	Logger logger = LoggerFactory.getLogger(UserService.class);

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	public void save(User user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		user.setConfirmPassword(passwordEncoder.encode(user.getConfirmPassword()));
		user.setRole(Role.ROLE_USER);
		logger.info("Save user to db " + user);
		userRepository.save(user);
	}

	public void update(User user) {
		logger.info("Update user info " + user);
		userRepository.save(user);
	}
	
	public List<User> getAllUsers() {
		return userRepository.findAll();
	}
	
	public User getByEmail(String email) {
		return userRepository.findByEmail(email).isPresent() ? userRepository.findByEmail(email).get() : null;
	}
}
