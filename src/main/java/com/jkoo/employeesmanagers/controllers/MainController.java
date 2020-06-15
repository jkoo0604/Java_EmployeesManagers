package com.jkoo.employeesmanagers.controllers;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jkoo.employeesmanagers.models.Employee;
import com.jkoo.employeesmanagers.services.MainService;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;
	
	@RequestMapping("/")
	public String index(Model model) {
		List<Employee> allEmployees = mainService.getAllEmployees();
		//System.out.println(allEmployees);
		List<Employee> allManagersSQL = mainService.getAllManagersSQL();
		//System.out.println(allManagersSQL);
		List<Employee> allManagersCRUD = mainService.getAllManagersCRUD();
		//System.out.println(allManagersCRUD);
		List<Object[]> allManagerNames = mainService.getManagerNamesOnly();
		//System.out.println(allManagerNames);
		List<Object[]> allEMNames = mainService.getEmployeeManagerNames();
		System.out.println(allEMNames);
		System.out.println(allEMNames.get(0)[0]);
		model.addAttribute("employees",allEmployees);
		model.addAttribute("managersSQL",allManagersSQL);
		model.addAttribute("managersCRUD",allManagersCRUD);
		model.addAttribute("managerNames",allManagerNames);
		model.addAttribute("employeesmanager",allEMNames);
		return "index.jsp";
	}
	
	@RequestMapping("/employees")
	public String addEmployeeForm(Model model, @ModelAttribute("employee") Employee employee) {
		List<Employee> allEmployees = mainService.getAllEmployees();
		model.addAttribute("employees", allEmployees);
		return "new.jsp";
	}
	
	@RequestMapping("/employees/{id}/edit")
	public String editEmployeeForm(Model model, @PathVariable("id") Long id) {
		Optional<Employee> checkE = mainService.getOneEmployee(id);
		if (checkE.isPresent()) {
			Employee employee = checkE.get();
			List<Employee> otherEmployees = mainService.getAllExcept(employee.getId());
			model.addAttribute("employee", employee);
			model.addAttribute("employees", otherEmployees);
			return "edit.jsp";
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/employees", method=RequestMethod.POST)
	public String addEmployee(@Valid @ModelAttribute("employee") Employee employee, Model model, BindingResult result) {
		System.out.println(employee.getManager());
		if (result.hasErrors()) {
			List<Employee> allemployees = mainService.getAllEmployees();
			model.addAttribute("employees", allemployees);
			return "new.jsp";
		}
		
		mainService.createEmployee(employee);
		return "redirect:/";
	}
	
	@RequestMapping(value="/employees/{id}", method=RequestMethod.PUT)
	public String updateEmployee(@PathVariable("id") Long eID, Model model, @RequestParam("mID") Long mID) {
		Employee updatedE = mainService.updateManager(eID, mID);
		if (updatedE == null) {
			System.out.println("updated unsuccessful");
		}
		return "redirect:/";
	}
	
}
