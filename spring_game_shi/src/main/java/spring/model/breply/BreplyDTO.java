package spring.model.breply;

public class BreplyDTO {

	 private int breplyno     ;
     private String content   ;
     private String breplydate;
     private String nicname   ;
     private int bbsno        ;
     
     
	public int getBreplyno() {
		return breplyno;
	}
	public void setBreplyno(int breplyno) {
		this.breplyno = breplyno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBreplydate() {
		return breplydate;
	}
	public void setBreplydate(String breplydate) {
		this.breplydate = breplydate;
	}
	public String getNicname() {
		return nicname;
	}
	public void setNicname(String nicname) {
		this.nicname = nicname;
	}
	public int getBbsno() {
		return bbsno;
	}
	public void setBbsno(int bbsno) {
		this.bbsno = bbsno;
	}
     
}
