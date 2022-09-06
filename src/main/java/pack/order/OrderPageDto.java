package pack.order;

public class OrderPageDto {
	private String size_value, color_value, product_name;
	private int product_quantity, product_id, total_price;
	

	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
	public String getSize_value() {
		return size_value;
	}
	public void setSize_value(String size_value) {
		this.size_value = size_value;
	}
	public String getColor_value() {
		return color_value;
	}
	public void setColor_value(String color_value) {
		this.color_value = color_value;
	}
	public int getProduct_quantity() {
		return product_quantity;
	}
	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	
	

}
