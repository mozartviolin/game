package spring.model.answer;

public class AnswerDTO {
	private int subjectno;
    private int choise;
    private String content;
    private int count;
    private int sno;
	

	public int getSubjectno() {
		return subjectno;
	}
	public void setSubjectno(int subjectno) {
		this.subjectno = subjectno;
	}
	public int getChoise() {
		return choise;
	}
	public void setChoise(int choise) {
		this.choise = choise;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	
}
