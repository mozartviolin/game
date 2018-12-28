package spring.model.qabbs;

import java.util.Map;

import spring.model.stdinter.DAOSTDInter;

public interface IQabbsDAO extends DAOSTDInter {
	public void upAnsnum(Map map);
	public QabbsDTO replyRead(int qano);
	public boolean passCheck(Map map);
	public boolean checkRefnum(int qano);
	public void upViewcount(int qano);
	public void mViewcount(int qano);
	public boolean replyCreate(QabbsDTO qabbsDTO);
}
