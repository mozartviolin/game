package spring.model.breply;

import java.util.Map;

import spring.model.stdinter.DAOSTDInter;

public interface IBreplyDAO extends DAOSTDInter {

	public boolean bdelete(int bbsno);
	public int total(int bbsno);		
		
}
