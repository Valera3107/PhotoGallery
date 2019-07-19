package com.ua.photoGallery.security;

import java.util.Collections;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ua.photoGallery.dao.UserRepository;
import com.ua.photoGallery.domain.User;

@Service("UserDetailService")
public class UserDetailService implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		Optional<User> optionalUser = userRepository.findByEmail(email);

		if (optionalUser.isPresent()) {
			return new UserDetail(optionalUser.get(),
					Collections.singletonList(optionalUser.get().getRole().toString()));
		}

		throw new UsernameNotFoundException("User with such email have not found! (" + email + ")");
	}

}
