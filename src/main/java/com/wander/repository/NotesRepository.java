package com.wander.repository;

import org.springframework.data.repository.CrudRepository;

import com.wander.bean.Notes;

public interface NotesRepository extends CrudRepository<Notes, String> {

}
