package com.dineshonjava.rest;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dineshonjava.model.Employee;
import com.dineshonjava.service.EmployeeService;
import com.sun.jersey.core.spi.factory.ResponseBuilderImpl;

@Component
@Path("/v1/employee")
public class v1_employee {

	@Autowired
	private EmployeeService employeeService;

	@GET
	@Produces(MediaType.TEXT_HTML)
	public Response returnDefaultText() {
		String message = "<P>Employee Rest API - ReadMe</P> <br> ";
		message += "1) <b>Emloyee List:</b> http://localhost:8080/sdnext/api/v1/employee/list <br>";
		message += "2) <b>Add Employee:</b> http://localhost:8080/sdnext/api/v1/employee/add <br>";
		
		ResponseBuilder rb = new ResponseBuilderImpl();
		rb.entity(message);
		rb.type(MediaType.TEXT_HTML);
		return rb.build();
	}

	@Path("/list")
	@GET
	@Produces(MediaType.TEXT_HTML)
	public Response returnAllEmployees() {
		List<Employee> employees = employeeService.listEmployeess();
		JSONArray jsobObjArr = new JSONArray();
		try {

			for (Employee employee : employees) {
				JSONObject jsobObj = new JSONObject();
				jsobObj.put("EmpId", employee.getEmpId());
				jsobObj.put("EmpName", employee.getEmpName());
				jsobObj.put("EmpAge", employee.getEmpAge());
				jsobObj.put("EmpSalary", employee.getSalary());
				jsobObj.put("EmpAddress", employee.getEmpAddress());
				jsobObjArr.put(jsobObj);
			}
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ResponseBuilder rb = new ResponseBuilderImpl();
		rb.entity(jsobObjArr.toString());
		rb.type(MediaType.TEXT_HTML);
		return rb.build();
	}

	@POST
	@Path("/add")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_HTML)
	public Response AddEmployee(@FormParam("EmpName") String empName,
			@FormParam("EmpAge") int empAge,
			@FormParam("EmpAddress") String empAddress,
			@FormParam("EmpSalary") long empSalary) {
		System.out.println("Employee Name is: " + empName);
		System.out.println("Employee Age is: " + empAge);
		System.out.println("Employee Address is: " + empAddress);
		System.out.println("Employee Salary is: " + empSalary);

		JSONObject jsonObj = new JSONObject();
		String returnString = "";

		try {

			Employee employee = new Employee();
			employee.setEmpName(empName);
			employee.setEmpAge(empAge);
			employee.setSalary(empSalary);
			employee.setEmpAddress(empAddress);

			int http_code = 200;
			employeeService.addEmployee(employee);

			if (http_code == 200) {
				jsonObj.put("HTTP_CODE", "200");
				jsonObj.put("MSG", "Item has been entered successfully");
				returnString = "Employee Added.";
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			return Response.status(500).entity("Unable to enter Item.").build();
		}

		return Response.ok(returnString).build();
	}
}
