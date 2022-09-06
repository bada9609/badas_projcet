package pack.product;

public class ProductDto {

	private String product_id, product_type, product_category, 
	product_name, product_regdate, product_update, 
	product_useYN, product_imageYN, main_image_filepath, main_image_filename,
	main_image_uuid, sub_image_filepath, sub_image_filename, sub_image_uuid,
	mainDel, subDel, product_maintext, product_subtext, product_size, product_color;
	
	private int product_price;
	
	public String getProduct_maintext() {
		return product_maintext;
	}

	public void setProduct_maintext(String product_maintext) {
		this.product_maintext = product_maintext;
	}

	public String getProduct_subtext() {
		return product_subtext;
	}

	public void setProduct_subtext(String product_subtext) {
		this.product_subtext = product_subtext;
	}

	public String getProduct_size() {
		return product_size;
	}

	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}

	public String getProduct_color() {
		return product_color;
	}

	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}

	public String getMainDel() {
		return mainDel;
	}

	public void setMainDel(String mainDel) {
		this.mainDel = mainDel;
	}

	public String getSubDel() {
		return subDel;
	}

	public void setSubDel(String subDel) {
		this.subDel = subDel;
	}

	public String getMain_image_filepath() {
		return main_image_filepath;
	}

	public void setMain_image_filepath(String main_image_filepath) {
		this.main_image_filepath = main_image_filepath;
	}

	public String getMain_image_filename() {
		return main_image_filename;
	}

	public void setMain_image_filename(String main_image_filename) {
		this.main_image_filename = main_image_filename;
	}

	public String getMain_image_uuid() {
		return main_image_uuid;
	}

	public void setMain_image_uuid(String main_image_uuid) {
		this.main_image_uuid = main_image_uuid;
	}

	public String getSub_image_filepath() {
		return sub_image_filepath;
	}

	public void setSub_image_filepath(String sub_image_filepath) {
		this.sub_image_filepath = sub_image_filepath;
	}

	public String getSub_image_filename() {
		return sub_image_filename;
	}

	public void setSub_image_filename(String sub_image_filename) {
		this.sub_image_filename = sub_image_filename;
	}

	public String getSub_image_uuid() {
		return sub_image_uuid;
	}

	public void setSub_image_uuid(String sub_image_uuid) {
		this.sub_image_uuid = sub_image_uuid;
	}

	public String getProduct_imageYN() {
		return product_imageYN;
	}

	public void setProduct_imageYN(String product_imageYN) {
		this.product_imageYN = product_imageYN;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getProduct_type() {
		return product_type;
	}

	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}

	public String getProduct_category() {
		return product_category;
	}

	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_regdate() {
		return product_regdate;
	}

	public void setProduct_regdate(String product_regdate) {
		this.product_regdate = product_regdate;
	}

	public String getProduct_update() {
		return product_update;
	}

	public void setProduct_update(String product_update) {
		this.product_update = product_update;
	}

	public String getProduct_useYN() {
		return product_useYN;
	}

	public void setProduct_useYN(String product_useYN) {
		this.product_useYN = product_useYN;
	}
	
}
