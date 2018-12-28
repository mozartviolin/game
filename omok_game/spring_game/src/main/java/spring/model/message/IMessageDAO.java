package spring.model.message;

import java.util.List;
import java.util.Map;

import spring.model.stdinter.DAOSTDInter;

public interface IMessageDAO extends DAOSTDInter {

	public List fromlist(Map map) throws Exception;
	int total(Object pk) throws Exception;
	void upviewcnt(int mno);
	int count(int mno);
	boolean nicCheck(String meto) throws Exception;

}
