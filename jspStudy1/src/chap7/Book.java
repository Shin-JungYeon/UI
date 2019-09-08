package chap7;
// 빈(Bean) 클래스
// 멤버 변수의 접근제어자는 private.
// 멤버 메서드의 접근제어자는 public. setter, getter로 이루어짐.
public class Book {
	private String writer;  //멤버변수. 프로퍼티 아님.
	private String title;
	private String content;
	
	//getter, setter
	//set property : setXxx : xxx(소문자) 프로퍼티.
	//get property : getXxx : xxx 프로퍼티.
	//							-> 메서드의 이름에서 가져오는 것. 멤버변수를 프로퍼티로 착각하면 안 돼. 변수 이름은 다른 것이 올 수 있음.
	//							   setProperty 액션태그에서 property="*" 이면 프로퍼티의 이름은 반드시 파라미터와 같아야 함.
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
