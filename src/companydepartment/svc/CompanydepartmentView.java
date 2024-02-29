package companydepartment.svc;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import system.db.svc.DbConn;
import system.db.util.DbUtil;
import system.db.svc.impl.MysqlDbConnImpl;
import system.itf.Svc;
import system.util.CommonUtil;
import system.util.Cvt;
import system.util.Pageing;
import companydepartment.dao.CompanydepartmentDao;
import companydepartment.dto.Companydepartment;

public class CompanydepartmentView implements Svc{

	Connection conn;

	@Override
	public void handling( HttpServletRequest req, HttpServletResponse res, Map<String, Object> model ){

		try{

			//---* DB
			DbConn dbConn = new MysqlDbConnImpl();
			conn = dbConn.getConnection();
			conn.setAutoCommit(false);
			//--- DB

			//---* sql variable
			String whereStr = "";
			String orderStr = "";
			Map<String, Object> sqlMap = new HashMap<String, Object>();
			List<String> wColNameList = new ArrayList<String>();
			List<String> wColValList = new ArrayList<String>();
			List<String> wColTypeList = new ArrayList<String>();
			sqlMap.put( "wColNameList", wColNameList );
			sqlMap.put( "wColValList", wColValList );
			sqlMap.put( "wColTypeList", wColTypeList );
			//--- sql variable

			//---* session
			HttpSession session = req.getSession();
			String ss_mbid = Cvt.toStr( session.getAttribute( "ss_mbid" ) );
			//--- session

			//---* param
			String r_cpdseq = Cvt.toStr( req.getParameter( "r_cpdseq" ) );

			//--- param

			//---* Dao
			CompanydepartmentDao companydepartmentDao = new CompanydepartmentDao( conn );
			wColNameList.add( " and CPD_SEQ = ? " );
			wColValList.add( r_cpdseq );
			wColTypeList.add( "int" );
			Companydepartment companydepartment = companydepartmentDao.one( sqlMap );
			conn.commit();
			//--- Dao

			//---* model
			model.put( "companydepartment", companydepartment );

			model.put( "returnType", "F" );
			model.put( "returnPage", "/companydepartment/companydepartmentview" );
			//---* model

		}catch(Exception e){
			CommonUtil.errorHandling( model, e, conn );
		}finally{
			DbUtil.close( conn );
		}
	}
}