package spring.model.nreply;

import spring.model.stdinter.DAOSTDInter;

public interface INreplyDAO extends DAOSTDInter {
	int total(Object pk) throws Exception;

}
