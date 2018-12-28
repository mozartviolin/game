package spring.model.qabbs;

public class QabbsDTO {
	private int 		 qano          ;
	private String 	     nicname       ;
	private String 	     category      ;
	private String 	     subject       ;
	private String 	     content       ;
	private String 	     passwd        ;
	private int	     	grpno          ;
	private int	     	indent         ;
	private int	     	refnum         ;
	private int	     	ansnum         ;
	private String 	     qadate        ;
	private int	     	viewcount      ;
	
	public int getQano() {
		return qano;
	}
	public void setQano(int qano) {
		this.qano = qano;
	}
	public String getNicname() {
		return nicname;
	}
	public void setNicname(String nicname) {
		this.nicname = nicname;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public int getGrpno() {
		return grpno;
	}
	public void setGrpno(int grpno) {
		this.grpno = grpno;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public int getRefnum() {
		return refnum;
	}
	public void setRefnum(int refnum) {
		this.refnum = refnum;
	}
	public int getAnsnum() {
		return ansnum;
	}
	public void setAnsnum(int ansnum) {
		this.ansnum = ansnum;
	}
	public String getQadate() {
		return qadate;
	}
	public void setQadate(String qadate) {
		this.qadate = qadate;
	}
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
}
