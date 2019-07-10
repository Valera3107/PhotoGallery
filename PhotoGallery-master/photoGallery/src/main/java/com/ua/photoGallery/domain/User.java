package com.ua.photoGallery.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.Email;

@Entity
@Table(name = "user")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column
	private String name;

	@Column
	@Email
	private String email;

	@Enumerated(EnumType.STRING)
	private Role role;

	@ManyToMany
	@JoinTable(name = "user_image", joinColumns = { @JoinColumn(name = "fk_user") }, inverseJoinColumns = {
			@JoinColumn(name = "fk_image") })
	private List<Image> images = new ArrayList<Image>();

	@Column
	private String password;

	@Column
	private String confirmPassword;

	public User() {
	}
	
	public User(User user) {
		this.id = user.id;
		this.name = user.name;
		this.email = user.email;
		this.role = user.role;
		this.images = user.images;
		this.password = user.password;
		this.confirmPassword = user.confirmPassword;
	}

	public User(String name, @Email String email, Role role, List<Image> images, String password,
			String confirmPassword) {
		this.name = name;
		this.email = email;
		this.role = role;
		this.images = images;
		this.password = password;
		this.confirmPassword = confirmPassword;
	}

	public User(Integer id, String name, @Email String email, Role role, List<Image> images, String password,
			String confirmPassword) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.role = role;
		this.images = images;
		this.password = password;
		this.confirmPassword = confirmPassword;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((confirmPassword == null) ? 0 : confirmPassword.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((images == null) ? 0 : images.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((role == null) ? 0 : role.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (confirmPassword == null) {
			if (other.confirmPassword != null)
				return false;
		} else if (!confirmPassword.equals(other.confirmPassword))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (images == null) {
			if (other.images != null)
				return false;
		} else if (!images.equals(other.images))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (role != other.role)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", role=" + role + ", images=" + images
				+ ", password=" + password + ", confirmPassword=" + confirmPassword + "]";
	}

}
