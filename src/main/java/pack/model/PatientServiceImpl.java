package pack.model;

import javax.inject.Inject;

public class PatientServiceImpl implements PatientService {
	@Inject
	private PatientDaoInter dao;
	
	@Override
	public void patientinsert(PatientDto pdto) {
		dao.insert(pdto);	
			
		
	}

}
