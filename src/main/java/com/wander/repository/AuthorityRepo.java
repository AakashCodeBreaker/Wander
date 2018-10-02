package com.wander.repository;

import org.springframework.data.repository.CrudRepository;

import com.wander.bean.Authority;

public interface AuthorityRepo extends CrudRepository<Authority	, String> {

}
