package chap7;
// ��(Bean) Ŭ����
// ��� ������ ���������ڴ� private.
// ��� �޼����� ���������ڴ� public. setter, getter�� �̷����.
public class Book {
	private String writer;  //�������. ������Ƽ �ƴ�.
	private String title;
	private String content;
	
	//getter, setter
	//set property : setXxx : xxx(�ҹ���) ������Ƽ.
	//get property : getXxx : xxx ������Ƽ.
	//							-> �޼����� �̸����� �������� ��. ��������� ������Ƽ�� �����ϸ� �� ��. ���� �̸��� �ٸ� ���� �� �� ����.
	//							   setProperty �׼��±׿��� property="*" �̸� ������Ƽ�� �̸��� �ݵ�� �Ķ���Ϳ� ���ƾ� ��.
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
