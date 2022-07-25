package pack.appoint;

import java.util.ArrayList;


public interface AppointInter {
	//리스트
	ArrayList<AppointDto> getList();
	
	//환자용 리스트
	ArrayList<AppointDto> appointMyList(String p_id);
	
	//의사용 리스트
	ArrayList<AppointDto> appointDMyList(String d_id);
	
	//수정화면 넘길때 -- 12일 저녁 수정
	AppointDto selectPnum(String ap_num);
	
	/*
	int currentNum();
	int totalCnt();
	boolean updateReadcnt(String tp_num);
	*/

	// 검색시 사용할것들
	ArrayList<AppointDto> getPList(String d_number);
	ArrayList<AppointDto> getSearch(AppointBean apbean);
	
	
	// insert
	boolean insData(AppointBean apbean);
	
	// update -- 12일 저녁 수정
	boolean upData(AppointBean apbean);
}
