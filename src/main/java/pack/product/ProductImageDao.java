package pack.product;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductImageDao extends SqlSessionDaoSupport implements ProductImageInter{
	
	@Autowired
	public ProductImageDao(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	@Override
	public boolean insMainProduct(ProductImageDto iadto) {
		int insMainProduct = getSqlSession().insert("insertProductImage", iadto);
		if(insMainProduct > 0) {
			return true;
		}else {
			return false;
		}
		
	}
	
	@Override
	public boolean updateProduct(ProductImageDto iadto) {
		try {
			getSqlSession().update("updateProductImage", iadto);
			return true;
		} catch (Exception e) {
			System.out.println("updateProductImageSetD : " + e);
			return false;
		}
	}
	
	@Override
	public boolean delete(String product_id) {
		int re = getSqlSession().delete("deleteImage", product_id);
		if (re > 0)
			return true;
		else
			return false;
	}

}
