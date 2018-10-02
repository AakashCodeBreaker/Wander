package com.wander.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wander.bean.Notes;
import com.wander.repository.NotesRepository;
@Service
public class NotesService {

	@Autowired
	NotesRepository notesRepo;
	
	public void addNoteValues(Notes note) {
		notesRepo.save(note);
		
		
	}

	public List<Notes> showAllNotes() {
		List<Notes> myList = new ArrayList<>();
		notesRepo.findAll().forEach(myList::add);
		return myList;
		
	}

	public String deleteTitle(String title) {
		if(notesRepo.findById(title).isPresent()){
		notesRepo.deleteById(title);
		return "Success.. Note got deleted";
		}
		return "Alert!! Title not found";
		
	}

	public String updateTitle(Notes note) {
		if(notesRepo.findById(note.getTitle()).isPresent()){
			notesRepo.deleteById(note.getTitle());
			notesRepo.save(note);
			return "Success.. Note got updated";
		}
		return "Alert!! Title not found";
		
	}

	public Notes getNote(String title) {
		List<Notes> notes = new ArrayList<>();
		notesRepo.findAll().forEach(notes::add);
		for(Notes note : notes){
			if(note.getTitle().equals(title)){
				return note;
			}
		}
		return null;
	}

}
