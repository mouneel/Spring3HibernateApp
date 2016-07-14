package com.dineshonjava.rest;

import java.util.List;

import javax.ws.rs.GET;
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
		String message = "<P>Employee Rest API - Default Page</P> <br> ";
		message += "1) Emloyee List: http://localhost:8080/sdnext/api/v1/employee/list <br>";
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
	
	@Path("/add")
	@GET
	@Produces(MediaType.TEXT_HTML)
	public Response AddEmployee() {
		return null;
	}
}
