package pack.doctor;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BuserDao extends SqlSessionDaoSupport{
	@Autowired
	public BuserDao(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	public List<BuserDto> buserList(){
		List<BuserDto> buserlist= getSqlSession().selectList("selectClass");
		System.out.println(buserlist.size());
		return buserlist;
	}

}
