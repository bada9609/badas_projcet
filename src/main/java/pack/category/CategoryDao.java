package pack.category;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CategoryDao extends SqlSessionDaoSupport implements CategoryInter {
	
	@Autowired
	public CategoryDao(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	// 카테고리 전체 뽑아내기
	@Override
	public List<CategoryDto> categoryList() {
		List<CategoryDto> list = getSqlSession().selectList("selectCategory");
		System.out.println(list.size());
		return list;
	}
	
	// 카테고리 (대분류) 선택 시 나타나게 하기
	@Override
	public List<CategoryDto> categorySelectList(String mp_code){
		List<CategoryDto> Selectlist = getSqlSession().selectList("selectCategoryType", mp_code);
		return Selectlist;
	}
	// 카테고리 중복 체크
	@Override
	public List<CategoryDto> categoryCheck(String category_type) {
		List<CategoryDto> categoryidCheck = getSqlSession().selectList("categoryCheck", category_type);
		return categoryidCheck;
	}
	
	// 카테고리 등록
	@Override
	public boolean insCategory(CategoryDto cadto) {
		int insCategory = getSqlSession().insert("insertCategory", cadto);
		if(insCategory > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	//카테고리 수정 불러오기
	@Override
	public CategoryDto searchCategory(String category_id) {
		return getSqlSession().selectOne("categorydata", category_id);
	}
	
	//카테고리 수정 데이터 넘기기
	@Override
	public boolean updateCategory(CategoryDto cadto) {
		try {
			getSqlSession().update("updateCategory", cadto);
			return true;
		} catch (Exception e) {
			System.out.println("updateCategorySetD : " + e);
			return false;
		}
	}
	
	@Override
	public List<CategoryDto> productSelectList(String mp_code) {
		List<CategoryDto> categorylist = getSqlSession().selectList("categorySelectList", mp_code);
		return categorylist;
	}
	
	
	
}
