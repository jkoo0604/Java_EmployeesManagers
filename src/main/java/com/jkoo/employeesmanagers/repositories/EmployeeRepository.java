package com.jkoo.employeesmanagers.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jkoo.employeesmanagers.models.Employee;

@Repository
public interface EmployeeRepository extends CrudRepository<Employee, Long>{
	List<Employee> findAll();
	
	//@Query("select e.firstName, e.lastName, m.firstName as manager_fname, m.lastName as manager_lname from Employee e left join e.manager m")
	@Query(value="select e.first_name, e.last_name, m.first_name as manager_fname, m.last_name as manager_lname from Employees e left join Employees m on e.manager_id = m.id", nativeQuery=true)
	List<Object[]> getEmployeeManager();
	
	//Query("select m.firstName, m.lastName from Employee e join e.manager m")
	@Query(value="select m.first_name, m.last_name from Employees e, Employees m where e.manager_id = m.id group by m.first_name, m.last_name", nativeQuery=true)
	List<Object[]> getManagerNames();
	
	@Query("select m from Employee e join e.manager m group by m")
	List<Employee> getManagers();
	
	List<Employee> findByEmployeesNotNull();
	
	List<Employee> findByIdNot(Long id);
}
