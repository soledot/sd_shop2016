package productgroup.svc;

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
import productgroup.dao.ProductgroupDao;
import productgroup.dto.Productgroup;

public class ProductgroupView implements Svc{

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
			String r_prgseq = Cvt.toStr( req.getParameter( "r_prgseq" ) );

			//--- param

			//---* Dao
			ProductgroupDao productgroupDao = new ProductgroupDao( conn );
			wColNameList.add( " and PRG_SEQ = ? " );
			wColValList.add( r_prgseq );
			wColTypeList.add( "int" );
			Productgroup productgroup = productgroupDao.one( sqlMap );
			wColNameList.clear();wColValList.clear();wColTypeList.clear();
			conn.commit();
			//--- Dao

			//---* model
			model.put( "productgroup", productgroup );

			model.put( "returnType", "F" );
			model.put( "returnPage", "/productgroup/productgroupview" );
			//---* model

		}catch(Exception e){
			CommonUtil.errorHandling( model, e, conn );
		}finally{
			DbUtil.close( conn );
		}
	}
}