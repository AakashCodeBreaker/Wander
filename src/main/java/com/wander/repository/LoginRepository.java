package com.wander.repository;

import org.springframework.data.repository.CrudRepository;

import com.wander.bean.Login;
import com.wander.bean.Notes;

public interface LoginRepository extends CrudRepository<Login, String> {

}
