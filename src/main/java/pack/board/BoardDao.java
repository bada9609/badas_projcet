package pack.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import pack.fileUpload.fileUtils;

@Repository
public class BoardDao extends SqlSessionDaoSupport implements BoardInter {
	
	
	public BoardDao(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	//인서트
	@Override
	public boolean insBoard(BoardBean bbean) {
		int ins = getSqlSession().insert("insertBoard", bbean);
		if(ins > 0) {
			return true;
		}else {
			return false;
		}
	}
	
}
