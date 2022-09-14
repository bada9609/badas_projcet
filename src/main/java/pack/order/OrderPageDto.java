package pack.order;

public class OrderPageDto {
	private String order_customer_id, order_customer_name, 
	order_regdate, order_dr_name, payment_type, order_customer_email,
	order_customer_addr,order_customer_addr2, 
	order_customer_addr_detail, product_size, product_color, product_value, product_name, product_id;
	
	private int order_id, order_total_pay, order_state, 
				product_quantity, payment_type1, payment_type2, payment_type3;


	public int getPayment_type1() {
		return payment_type1;
	}


	public void setPayment_type1(int payment_type1) {
		this.payment_type1 = payment_type1;
	}


	public int getPayment_type2() {
		return payment_type2;
	}


	public void setPayment_type2(int payment_type2) {
		this.payment_type2 = payment_type2;
	}


	public int getPayment_type3() {
		return payment_type3;
	}


	public void setPayment_type3(int payment_type3) {
		this.payment_type3 = payment_type3;
	}


	public String getOrder_customer_id() {
		return order_customer_id;
	}


	public String getProduct_color() {
		return product_color;
	}


	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}


	public void setOrder_customer_id(String order_customer_id) {
		this.order_customer_id = order_customer_id;
	}


	public String getOrder_customer_name() {
		return order_customer_name;
	}


	public void setOrder_customer_name(String order_customer_name) {
		this.order_customer_name = order_customer_name;
	}


	public String getOrder_regdate() {
		return order_regdate;
	}


	public void setOrder_regdate(String order_regdate) {
		this.order_regdate = order_regdate;
	}


	public String getOrder_dr_name() {
		return order_dr_name;
	}


	public void setOrder_dr_name(String order_dr_name) {
		this.order_dr_name = order_dr_name;
	}


	public String getPayment_type() {
		return payment_type;
	}


	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}


	public String getOrder_customer_email() {
		return order_customer_email;
	}


	public void setOrder_customer_email(String order_customer_email) {
		this.order_customer_email = order_customer_email;
	}


	public String getOrder_customer_addr() {
		return order_customer_addr;
	}


	public void setOrder_customer_addr(String order_customer_addr) {
		this.order_customer_addr = order_customer_addr;
	}


	public String getOrder_customer_addr2() {
		return order_customer_addr2;
	}


	public void setOrder_customer_addr2(String order_customer_addr2) {
		this.order_customer_addr2 = order_customer_addr2;
	}


	public String getOrder_customer_addr_detail() {
		return order_customer_addr_detail;
	}


	public void setOrder_customer_addr_detail(String order_customer_addr_detail) {
		this.order_customer_addr_detail = order_customer_addr_detail;
	}


	public String getProduct_size() {
		return product_size;
	}


	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}


	public String getProduct_value() {
		return product_value;
	}


	public void setProduct_value(String product_value) {
		this.product_value = product_value;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public int getOrder_id() {
		return order_id;
	}


	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}


	public int getOrder_total_pay() {
		return order_total_pay;
	}


	public void setOrder_total_pay(int order_total_pay) {
		this.order_total_pay = order_total_pay;
	}


	public int getOrder_state() {
		return order_state;
	}


	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}


	public String getProduct_id() {
		return product_id;
	}


	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}


	public int getProduct_quantity() {
		return product_quantity;
	}


	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}
	
}
