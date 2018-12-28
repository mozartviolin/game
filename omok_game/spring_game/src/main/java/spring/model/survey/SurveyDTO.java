package spring.model.survey;

import java.util.List;

import spring.model.answer.AnswerDTO;

public class SurveyDTO {
	private int sno;
    private String subject;
    private List<AnswerDTO> answerDTOList;
    private AnswerDTO answerDTO;
    
    public SurveyDTO() {
   	 super();
    }
    public SurveyDTO(int sno, String subject, List<AnswerDTO> answerDTOList) {
   	 super();
   	 this.sno = sno;
   	 this.subject = subject;
   	 this.answerDTOList = answerDTOList;
    }
	     
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public List<AnswerDTO> getAnswerDTOList() {
		return answerDTOList;
	}
	public void setAnswerDTOList(List<AnswerDTO> answerDTOList) {
		this.answerDTOList = answerDTOList;
	}
	public AnswerDTO getAnswerDTO() {
		return answerDTO;
	}
	public void setAnswerDTO(AnswerDTO answerDTO) {
		this.answerDTO = answerDTO;
	}     
}
