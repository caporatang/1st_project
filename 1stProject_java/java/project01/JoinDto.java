package project01;

public class JoinDto {
	// public String id: //모든 패키지에서 접근 가능!
	// 멤버 변수. 선언의 위치는 생존범위를 결정. 클래스 전역에서 사용가능.
	// =전역변수(글로벌변수). 자동초기화됨. 참조형이어서 null로 초기화
	private String id; // private: 해당 클래스 안에서만 접근가능.
	private String pw; // 직접 접근 불가. 메서드통해서만..
	private String name;
	private String email;
	private String tel;
	private String address;
	private String birthday;
	private String gender;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
}
	
	//값을 넣을 때는 set변수명(), setId()
	//값을 꺼낼 때는 get변수명(), getId()
	//getters setters

