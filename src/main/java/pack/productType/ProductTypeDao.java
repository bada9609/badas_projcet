package pack.productType;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductTypeDao extends SqlSessionDaoSupport implements ProductTypeInter {
	
	@Autowired
	public ProductTypeDao(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	@Override
	public List<ProductTypeDto> ProductTypeList() {
		
		List<ProductTypeDto> Typelist = getSqlSession().selectList("selectCategoryType");
		System.out.println(Typelist.size());
		return Typelist;
	}

}
