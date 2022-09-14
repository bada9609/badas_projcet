package pack.model;

import javax.servlet.http.HttpSession;

public class Criteria {
	
	public int page, perPageNum, mp_code, product_type ;
	public String product_category, order_customer_id;

	public String getOrder_customer_id() {
		return order_customer_id;
	}

	public void setOrder_customer_id(String order_customer_id) {
		this.order_customer_id = order_customer_id;
	}

	public String getProduct_category() {
		return product_category;
	}

	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}

	public int getMp_code() {
		return mp_code;
	}

	public void setMp_code(int mp_code) {
		this.mp_code = mp_code;
	}

	public int getProduct_type() {
		return product_type;
	}

	public void setProduct_type(int product_type) {
		this.product_type = product_type;
	}

	public int getPageStart(){
		return (this.page-1)*perPageNum;
	}
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 6;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
		}else{
			this.page = page;
		}
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	
	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if(pageCount != cnt) {
			this.perPageNum = cnt;
		}else{
			this.perPageNum = pageCount;
		}
	}
}
