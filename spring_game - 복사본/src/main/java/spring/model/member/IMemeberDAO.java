package spring.model.member;

import java.util.List;
import java.util.Map;

import spring.model.stdinter.DAOSTDInter;

public interface IMemeberDAO extends DAOSTDInter {

	public boolean dupliID(String id);
	public boolean dupliNic(String nicname);
	public boolean loginCheck(Map map);
	public String searchID(Map map);
	public String searchPW(Map map);
	public Map getGradeAnicname(String id);
}