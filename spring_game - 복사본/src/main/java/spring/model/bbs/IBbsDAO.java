package spring.model.bbs;

import java.util.Map;

import spring.model.stdinter.DAOSTDInter;

public interface IBbsDAO extends DAOSTDInter {

	public void upViewcnt(int bbsno);
	public boolean checkPW(Map map);
}
