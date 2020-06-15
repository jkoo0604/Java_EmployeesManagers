package com.jkoo.employeesmanagers.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jkoo.employeesmanagers.models.Employee;
import com.jkoo.employeesmanagers.repositories.EmployeeRepository;

@Service
public class MainService {
	@Autowired
	private EmployeeRepository eRepo;
	
	public List<Employee> getAllEmployees() {
		return eRepo.findAll();
	}
	
	public Optional<Employee> getOneEmployee(Long id) {
		return eRepo.findById(id);
	}
	
	public List<Object[]> getEmployeeManagerNames() {
		return eRepo.getEmployeeManager();
	}
	
	public List<Object[]> getManagerNamesOnly() {
		return eRepo.getManagerNames();
	}
	
	public List<Employee> getAllManagersSQL() {
		return eRepo.getManagers();
	}
	
	public List<Employee> getAllManagersCRUD() {
		return eRepo.findByEmployeesNotNull();
	}
	
	public List<Employee> getAllExcept(Long id) {
		return eRepo.findByIdNot(id);
	}
	
	public Employee createEmployee(Employee employee) {
		return eRepo.save(employee);
	}
	
	public Employee updateManager(Long eID, Long mID) {
		Optional<Employee> checkE = eRepo.findById(eID);
		Optional<Employee> checkM = eRepo.findById(mID);
		if (checkE.isPresent() && checkM.isPresent()) {
			Employee employee = checkE.get();
			Employee manager = checkM.get();
			employee.setManager(manager);
			eRepo.save(employee);
			return employee;
		}
		return null;
	}
}
