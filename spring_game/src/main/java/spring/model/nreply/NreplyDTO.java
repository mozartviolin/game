package spring.model.nreply;

public class NreplyDTO {
	
	public int getNreplyno() {
		return nreplyno;
	}
	public void setNreplyno(int nreplyno) {
		this.nreplyno = nreplyno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getNreplydate() {
		return nreplydate;
	}
	public void setNreplydate(String nreplydate) {
		this.nreplydate = nreplydate;
	}
	public String getNicname() {
		return nicname;
	}
	public void setNicname(String nicname) {
		this.nicname = nicname;
	}
	private int nreplyno;
	private String content;
	private int n_no;
	private String nreplydate;
	private String nicname;
}
