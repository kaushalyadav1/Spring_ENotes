package com.kj.Project.Controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kj.Project.Dao.UserDao;
import com.kj.Project.Entity.Notes;
import com.kj.Project.Entity.User;

@Controller
@RequestMapping("/user/")
public class UserController
{
	@Autowired
	private UserDao userDao;
	
	@RequestMapping("/addnotes")
	public String addnotes()
	{
		return "add_notes";
	}
	
	@RequestMapping("/viewnotes")
	public String viewnotes(HttpSession session , Model m)
	{
		User us = (User) session.getAttribute("userObj");
		List<Notes> notes = userDao.getNotesByUser(us);
		m.addAttribute("list",notes);
		return "view_notes";
	}
	
	@RequestMapping("/editnotes")
	public String editnotes(@RequestParam("id") int id, Model m)
	{
		Notes n = userDao.getNotesById(id);
		m.addAttribute("notes",n);
		return "edit_notes";
	}
	
	@RequestMapping(path = "/updateNotes" , method = RequestMethod.POST)
	public String updateNotes(@ModelAttribute Notes n, HttpSession session)
	{
		User us = (User) session.getAttribute("userObj");
		n.setUser(us);
		n.setDate(LocalDateTime.now().toString());
		userDao.updateNotes(n);
		session.setAttribute("msg","Notes Update Successfully");
		return "redirect:/user/viewnotes";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session)
	{
		session.removeAttribute("userObj");
		session.setAttribute("msg","Logout Successfully");
		return "login";
	}
	
	@RequestMapping(path = "/saveNotes" , method = RequestMethod.POST)
	public String saveNotes(@ModelAttribute Notes n,HttpSession session)
	{
		User us = (User) session.getAttribute("userObj");
		n.setDate(LocalDateTime.now().toString());
		n.setUser(us);
		userDao.saveNotes(n);
		session.setAttribute("msg","Notes Added Successfully");
		
		return "redirect:/user/addnotes";
	}
	
	@RequestMapping("/deleteNotes")
	public String deleteNotes(@RequestParam("id") int id , HttpSession session)
	{
		userDao.deleteNotes(id);
		session.setAttribute("msg","Delete Successfully");
		return "redirect:/user/viewnotes";
	}
}