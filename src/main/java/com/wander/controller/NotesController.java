package com.wander.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wander.bean.Notes;
import com.wander.service.NotesService;

@Controller
@RequestMapping("/note")
public class NotesController {

	@Autowired
	NotesService notesService;
	
	@RequestMapping("/linkNote")
	public String linkNote(Model model){
		List<Notes> noteList = notesService.showAllNotes();
		if(noteList.isEmpty()){
			model.addAttribute("noteList","Note list is empty..!!, kindly Add new Note");
			return "note-input";
		}
		model.addAttribute("noteList",noteList);
		return "title-input";
	}
	

	@RequestMapping("/showHome")
	public String showHome(){
		return "home-page";
	}

	@RequestMapping("/showAllNotes")
	public String showAllNotes(Model model){
		List<Notes> noteList = notesService.showAllNotes();
		model.addAttribute("noteList",noteList);
		return "show-notes";
	}

	@RequestMapping("/addNote")
	public String addNote(){
		
		return "note-input";
	}
	@RequestMapping("/addNoteValues")
	public String addNotesVlues(@ModelAttribute("note") Notes note){
		notesService.addNoteValues(note);
		return "home-page";
	}
	@RequestMapping("/update")
	public String update(@ModelAttribute("note") Notes note, Model model){
		
		String str = notesService.updateTitle(note);
		model.addAttribute("str", str);
		return "home-page";
	}
	@RequestMapping("/deleteNote/{title}")
	public String deleteNote(@PathVariable("title") String title,Model model){
		String str = notesService.deleteTitle(title);
		model.addAttribute("str", str);
		return "home-page";
		
	}
	@RequestMapping("/updateNote/{title}")
	public String updateNote(@PathVariable("title") String title,Model model){
		Notes note = notesService.getNote(title);
		List<Notes> noteList = notesService.showAllNotes();
		if(noteList.isEmpty()){
			model.addAttribute("noteList","Note list is empty..!!, kindly Add new Note");
			return "note-input";
		}
		model.addAttribute("noteList",noteList);
		model.addAttribute("note", note);
		model.addAttribute("val", "update");
		return "title-input";
		
	}
}


