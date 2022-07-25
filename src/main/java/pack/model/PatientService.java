package pack.model;

import java.io.InterruptedIOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession;

import pack.model.PatientDto;

public interface PatientService {
	public void patientinsert(PatientDto pdto);

}
