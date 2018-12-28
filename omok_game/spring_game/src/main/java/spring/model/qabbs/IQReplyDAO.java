package spring.model.qabbs;

import spring.model.stdinter.DAOSTDInter;

public interface IQReplyDAO extends DAOSTDInter {
	public int qrtotal(int qano);
	public boolean bdelete(int qano);
}
