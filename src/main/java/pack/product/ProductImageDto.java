package pack.product;

public class ProductImageDto {
	
	private String image_id, product_id, main_image_filepath, main_image_filename,
	main_image_uuid, sub_image_filepath, sub_image_filename, sub_image_uuid, image_regdate;

	public String getMain_image_regdate() {
		return image_regdate;
	}

	public void setMain_image_regdate(String main_image_regdate) {
		this.image_regdate = main_image_regdate;
	}

	public String getImage_id() {
		return image_id;
	}

	public void setImage_id(String image_id) {
		this.image_id = image_id;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
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
	
	

}
