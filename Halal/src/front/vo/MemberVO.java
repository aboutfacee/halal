package front.vo;

public class MemberVO extends ObjectVO{
	//lead member 테이블
	private String email;
	private String pwd;
	private String mem_name;
	private String country_code;
	private String phone;
	private String social_name;
	private String social_id;
	private String id_save; //아이디 저장
	//로그인 체크
	private Integer id_cnt;
	private String returnUrl;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getCountry_code() {
		return country_code;
	}
	public void setCountry_code(String country_code) {
		this.country_code = country_code;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSocial_name() {
		return social_name;
	}
	public void setSocial_name(String social_name) {
		this.social_name = social_name;
	}
	public String getSocial_id() {
		return social_id;
	}
	public void setSocial_id(String social_id) {
		this.social_id = social_id;
	}
	public String getId_save() {
		return id_save;
	}
	public void setId_save(String id_save) {
		this.id_save = id_save;
	}
	public Integer getId_cnt() {
		return id_cnt;
	}
	public void setId_cnt(Integer id_cnt) {
		this.id_cnt = id_cnt;
	}
	public String getReturnUrl() {
		return returnUrl;
	}
	public void setReturnUrl(String returnUrl) {
		this.returnUrl = returnUrl;
	}


}
