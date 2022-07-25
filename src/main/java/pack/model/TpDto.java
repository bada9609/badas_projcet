package pack.model;

import org.springframework.stereotype.Component;

@Component
public class TpDto {
	private String tp_num, tp_date; //환자용
	private String td_check; //의사용
	
	private String tp_title, tp_pn, d_class, d_name, p_name, p_birth, tp_medicine, tp_tem, tp_content;
	
	private String tp_dn;
	
	private String td_title, td_inter, td_medicine, td_content;
	
	private int gnum, onum;

	public String getTp_num() {
		return tp_num;
	}

	public void setTp_num(String tp_num) {
		this.tp_num = tp_num;
	}

	public String getTp_date() {
		return tp_date;
	}

	public void setTp_date(String tp_date) {
		this.tp_date = tp_date;
	}

	public String getTd_check() {
		return td_check;
	}

	public void setTd_check(String td_check) {
		this.td_check = td_check;
	}

	public String getTp_title() {
		return tp_title;
	}

	public void setTp_title(String tp_title) {
		this.tp_title = tp_title;
	}

	public String getTp_pn() {
		return tp_pn;
	}

	public void setTp_pn(String tp_pn) {
		this.tp_pn = tp_pn;
	}

	public String getD_class() {
		return d_class;
	}

	public void setD_class(String d_class) {
		this.d_class = d_class;
	}

	public String getD_name() {
		return d_name;
	}

	public void setD_name(String d_name) {
		this.d_name = d_name;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_birth() {
		return p_birth;
	}

	public void setP_birth(String p_birth) {
		this.p_birth = p_birth;
	}

	public String getTp_medicine() {
		return tp_medicine;
	}

	public void setTp_medicine(String tp_medicine) {
		this.tp_medicine = tp_medicine;
	}

	public String getTp_tem() {
		return tp_tem;
	}

	public void setTp_tem(String tp_tem) {
		this.tp_tem = tp_tem;
	}

	public String getTp_content() {
		return tp_content;
	}

	public void setTp_content(String tp_content) {
		this.tp_content = tp_content;
	}

	public String getTp_dn() {
		return tp_dn;
	}

	public void setTp_dn(String tp_dn) {
		this.tp_dn = tp_dn;
	}

	public String getTd_title() {
		return td_title;
	}

	public void setTd_title(String td_title) {
		this.td_title = td_title;
	}

	public String getTd_inter() {
		return td_inter;
	}

	public void setTd_inter(String td_inter) {
		this.td_inter = td_inter;
	}

	public String getTd_medicine() {
		return td_medicine;
	}

	public void setTd_medicine(String td_medicine) {
		this.td_medicine = td_medicine;
	}

	public String getTd_content() {
		return td_content;
	}

	public void setTd_content(String td_content) {
		this.td_content = td_content;
	}

	public int getGnum() {
		return gnum;
	}

	public void setGnum(int gnum) {
		this.gnum = gnum;
	}

	public int getOnum() {
		return onum;
	}

	public void setOnum(int onum) {
		this.onum = onum;
	}
	

	
	

}
