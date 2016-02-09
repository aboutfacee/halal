package front.vo;

public class MemberVO extends ObjectVO{
	//lead member 테이블
	private String email;
	private String pwd;
	private String mem_nm;
	private String country_cd;
	private String mobile;
	private String social_nm;
	private String social_id;
	private String mem_auth;
	private String id_save; //아이디 저장
	//로그인 체크
	private Integer id_cnt;
	
	
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
	public String getMem_nm() {
		return mem_nm;
	}
	public void setMem_nm(String mem_nm) {
		this.mem_nm = mem_nm;
	}
	public String getCountry_cd() {
		return country_cd;
	}
	public void setCountry_cd(String country_cd) {
		this.country_cd = country_cd;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getSocial_nm() {
		return social_nm;
	}
	public void setSocial_nm(String social_nm) {
		this.social_nm = social_nm;
	}
	public String getSocial_id() {
		return social_id;
	}
	public void setSocial_id(String social_id) {
		this.social_id = social_id;
	}
	public String getMem_auth() {
		return mem_auth;
	}
	public void setMem_auth(String mem_auth) {
		this.mem_auth = mem_auth;
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


}
