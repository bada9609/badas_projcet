package pack.appoint;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.doctor.DoctorDto;


@Repository
public class AppointDao extends SqlSessionDaoSupport implements AppointInter{
	@Autowired
	public AppointDao(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	//버튼 눌러서 해당 값 불러오는놈 -- 12일 저녁 수정
	@Override
	public AppointDto selectPnum(String ap_num) {
		return getSqlSession().selectOne("selectApPart", ap_num);
	}
	
	//업데이트 할때 쓰는거 -- 12일 저녁 수정
	@Override
	public boolean upData(AppointBean apbean) {
		try {
			getSqlSession().update("updateAppointSetD", apbean);
			return true;
		} catch (Exception e) {
			System.out.println("updateAppointSetD : " + e);
			return false;
		}
	}
	
	//리스트 출력
	@Override
	public ArrayList<AppointDto> getList() {
		return (ArrayList)getSqlSession().selectList("selectApList");
	}
	
	//리스트 출력 환자
	@Override
	public ArrayList<AppointDto> appointMyList(String p_id) {
		return (ArrayList)getSqlSession().selectList("appointMy", p_id);
	}
	
	//리스트 출력 의사
	@Override
	public ArrayList<AppointDto> appointDMyList(String d_id) {
		return (ArrayList)getSqlSession().selectList("appointDMy", d_id);
	}
	
	@Override
	public ArrayList<AppointDto> getPList(String d_number) {
		// TODO Auto-generated method stub
		return (ArrayList)getSqlSession().selectList("selectappointPList", d_number);
	}

	public List<DoctorDto> DoctorList(String c_class){ //과목에 맞는 의사찾기
		List<DoctorDto> list = getSqlSession().selectList("selectDoctorName", c_class);
		return list;
	}
	
	@Override //리스트 검색용
	public ArrayList<AppointDto> getSearch(AppointBean apbean) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public boolean insData(AppointBean apbean) { // 예약 내역 입력
		int ins = getSqlSession().insert("insertAp" ,apbean);
		
		//환자정보 그대로 가져오기
		apbean.setAp_pname("환자");
		
		
		if(ins > 0) {
			return true;
		}else {
			System.out.println("insData err : ");
			return false;
		}
	}

}
