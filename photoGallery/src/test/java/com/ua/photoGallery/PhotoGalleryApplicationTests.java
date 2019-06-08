package com.ua.photoGallery;

import static org.hamcrest.collection.IsCollectionWithSize.hasSize;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.ua.photoGallery.dao.ImageRepository;
import com.ua.photoGallery.dao.UserRepository;
import com.ua.photoGallery.domain.Image;
import com.ua.photoGallery.domain.User;
import com.ua.photoGallery.service.UserService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class PhotoGalleryApplicationTests {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private ImageRepository imageRepository;

	@Autowired
	private UserService userService;

	@Before
	public void cleanBD() {
		userRepository.deleteAll();
		imageRepository.deleteAll();
	}

	@Test
	public void saveUser() {
		User user = new User();
		user.setName("Paul");

		userRepository.save(user);

		assertThat(userRepository.findAll(), hasSize(1));
	}

	@Test
	public void saveImage() {
		Image img = new Image();
		img.setName("Photo");

		imageRepository.save(img);

		assertThat(imageRepository.findAll(), hasSize(1));
	}

	@Test
	public void updateUser() {
		User user = new User();
		user.setName("Paul");
		user.setEmail("test@gmail.com");

		User userUpdate = userRepository.save(user);

		userUpdate.setName("Frank");

		userService.update(userUpdate);

		assertThat(userRepository.findAll(), hasSize(1));
		assertTrue(userRepository.findByEmail("test@gmail.com").get().getName().equals("Frank"));
	}

	@Test
	public void addToFavoriteImage() {
		User user = new User();
		user.setName("Paul");
		user.setEmail("test@gmail.com");

		User userFromBD = userRepository.save(user);

		Image img = new Image();
		img.setName("Photo");

		Image imgFromBD = imageRepository.save(img);

		userFromBD.getImages().add(imgFromBD);

		userService.update(userFromBD);

		assertThat(userRepository.findByEmail("test@gmail.com").get().getImages(), hasSize(1));
	}

	@Test
	public void deleteUserFromDB() {
		User user = new User();
		user.setName("Paul");
		user.setEmail("test@gmail.com");

		User userFromBD = userRepository.save(user);

		assertThat(userRepository.findAll(), hasSize(1));

		userRepository.delete(userFromBD);

		assertThat(userRepository.findAll(), hasSize(0));
	}

	@Test
	public void deleteImageFromBD() {
		Image img = new Image();
		img.setName("Photo");

		Image imgFromDB = imageRepository.save(img);

		assertThat(imageRepository.findAll(), hasSize(1));

		imageRepository.delete(imgFromDB);

		assertThat(imageRepository.findAll(), hasSize(0));
	}

	@After
	public void cleanDBAfterTest() {
		userRepository.deleteAll();
		imageRepository.deleteAll();
	}
}
