package com.ua.photoGallery.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ua.photoGallery.domain.Image;

@Repository
public interface ImageRepository extends JpaRepository<Image, Integer>{

}
