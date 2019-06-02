package com.ua.photoGallery.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ua.photoGallery.domain.Image;

public interface ImageRepository extends JpaRepository<Image, Integer>{

}
