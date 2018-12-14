package spring.model.notice;

import spring.model.stdinter.DAOSTDInter;

public interface INoticeDAO extends DAOSTDInter {
	int total(Object pk) throws Exception;
	void upviewcnt(int n_no);
	
	

}
