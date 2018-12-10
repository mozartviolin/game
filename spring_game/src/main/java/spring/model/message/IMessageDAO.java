package spring.model.message;

import spring.model.stdinter.DAOSTDInter;

public interface IMessageDAO extends DAOSTDInter {

	void upviewcnt(int mno);

	int count(int mno);

}
