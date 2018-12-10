package spring.model.message;

public class MessageDTO {
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMefrom() {
		return mefrom;
	}
	public void setMefrom(String mefrom) {
		this.mefrom = mefrom;
	}
	public String getMeto() {
		return meto;
	}
	public void setMeto(String meto) {
		this.meto = meto;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	public String getNicname() {
		return nicname;
	}
	public void setNicname(String nicname) {
		this.nicname = nicname;
	}

	private int mno;
	private String nicname;
	private String mefrom;
	private String meto;
	private String subject;
	private String content;
	private String mdate;
	private int viewcnt;

}
