package dcmls.dl;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import dcmls.dto.Login;
import dcmls.dto.UserDTO;

public class LoginDL
{
	private static ArrayList<Login> logins;
	//add the user details into the login table when a registration is done
	public static int addLogin(Login login)
	{ 
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;	
	try
		{
			con=DBHelper.getConnection();
			query="insert into DCMLS_LOGIN(LOGINID,USERNAME,PASSWORD,TYPE,USERID,STATUS,CREATEDBY,UPDATEDBY)VALUES(?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(query);
			ps.setInt(1,userId());
			ps.setString(2,login.getUsername());
			ps.setString(3,login.getPassword());
			ps.setString(4,login.getType());
			ps.setString(5,login.getUserid());
			ps.setInt(6, 0);
			ps.setDate(7, getCurrentDate());
			ps.setDate(8, getCurrentDate());
			
			result =ps.executeUpdate();
			
		}catch(Exception e)
		{
			result=-1;
			System.out.println("**error** logindl:adduser"+e.getMessage());
		}
		return result;
	}
	//to auto increment the user's loginid
	private static int userId()
	{
		Connection con=null;
		Statement statement=null;
		int userid=0;
		try
		{
			con=DBHelper.getConnection();
			statement = con.createStatement();
			ResultSet rs=statement.executeQuery("SELECT LOGINID FROM DCMLS_LOGIN ORDER BY LOGINID DESC");
			if(rs.next()){
			userid=rs.getInt("LOGINID")+1;
			}	
		}catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		return userid;
	}
	// to get the current date
	private static java.sql.Date getCurrentDate()
	{
	    java.util.Date today = new java.util.Date();
	    return new java.sql.Date(today.getTime());
	}
	public static String getdateTime()
	{
		  Date objDate = new Date(); // Current System Date and time is assigned to objDate
		 // System.out.println(objDate);
		  String strDateFormat = "hh:mm:ss a dd-MMM-yyyy"; //Date format is Specified
		  SimpleDateFormat objSDF = new SimpleDateFormat(strDateFormat); //Date format string is passed as an argument to the Date format object
		  //System.out.println(objSDF.format(objDate)); //Date formatting is applied to the current date
		  String strDate = objSDF.format(objDate); 
		  //System.out.println(strDate);
		  return strDate;
	}
	
	//method to find the user is a valid user
	public static Login validateLogin(Login login1)
	{
		Connection con=null;
		ResultSet resultSet=null;
		Login login2=null;
		try
		{
			String sql="select * from DCMLS_LOGIN where USERNAME=? AND PASSWORD=? AND STATUS=1";
			con=DBHelper.getConnection();
			PreparedStatement ps=null;
			ps =  con.prepareStatement(sql);
			
			  ps.setString(1,login1.getUsername());
			  ps.setString(2,login1.getPassword());
			  ps.executeQuery();
			resultSet=ps.executeQuery();
			if(resultSet.next())
			{
				login2=new Login();
				login2.setUserid(resultSet.getString("USERID"));
				login2.setUsername(resultSet.getString("USERNAME"));
				login2.setPassword(resultSet.getString("PASSWORD"));
				login2.setType(resultSet.getString("TYPE"));
			
			}
			
		}catch(Exception e)
		{
			System.out.println("**error** LoginDl:Login"+e.getMessage());
		}
		return login2;
		
	}
	//method to fetch the username and password ofa register user
	public static Login forgotpassword(String userid)
	{
		ArrayList<Login> log=null;
		Connection con=null;
		Statement statement=null;
		ResultSet resultSet=null;
		Login login=null;
		try
		{
			
			String sql="select USERNAME,PASSWORD FROM DCMLS_LOGIN WHERE USERID ='"+userid+"'";
			con=DBHelper.getConnection();
			statement=con.createStatement();
			resultSet=statement.executeQuery(sql);
			if(resultSet.next())
			{
				login=new Login();
				login.setUsername(resultSet.getString("USERNAME"));
				login.setPassword(resultSet.getString("PASSWORD"));
				log.add(login);
			}
					
		}catch(Exception e)
		{
			System.out.println("**error** loginDL:get the details"+e.getMessage());
		}
		
		return login;
		
	}
	//method to update the users password
	public static int forgotpasswordupdate(Login login)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			con=DBHelper.getConnection();
			query="update DCMLS_LOGIN set USERNAME=?,PASSWORD=? where USERID=?";
			ps=con.prepareStatement(query);
			ps.setString(1,login.getUsername());
			ps.setString(2,login.getPassword());
			ps.setString(3,login.getUserid());
			result =ps.executeUpdate();
			
		}catch(Exception e)
		{
			System.out.println("**error** logindl:forgotpasswordupdate"+e.getMessage());
		}
		return result;
	}
	public ArrayList<Login> getUser()
	{
		ArrayList<Login> login=null;
		try
		{
			
		}
		catch(Exception e)
		{
			System.out.println("**error** logindl:adduser"+e.getMessage());
		}
		return login;
	}
	//method to update the status of the user when admin approve or reject
	public static int updatestatus(Login login)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			con=DBHelper.getConnection();
			query="update DCMLS_LOGIN set STATUS=? where USERID=?";
			ps=con.prepareStatement(query);
			ps.setInt(1,login.getStatus());
			ps.setString(2,login.getUserid());
			result =ps.executeUpdate();
			
		}catch(Exception e)
		{
			System.out.println("**error** logindl:update the status of approved user"+e.getMessage());
		}
		return result;
	}
	public static Login getUser(String UserID)
	{
		
		Connection con=null;
		Statement statement=null;
		ResultSet resultSet=null;
		Login login=null;
		try
		{
			String sql="select * FROM DCMLS_LOGIN WHERE USERID='"+UserID+"'";
			con=DBHelper.getConnection();
			statement=con.createStatement();
			resultSet=statement.executeQuery(sql);
			if(resultSet.next())
			{
				login=new Login();
				login.setUserid(resultSet.getString("USERID"));
				login.setUsername(resultSet.getString("USERNAME"));
				login.setPassword(resultSet.getString("PASSWORD"));
				login.setType(resultSet.getString("TYPE"));
				logins.add(login);
			}
			
		}catch(Exception e)
		{
			System.out.println("**error** userdl:getuserdetails"+e.getMessage());
		}
		return login;
		
	}
	// method to update the user details
	public static int updateuser(Login login)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			System.out.println(login.getUserid());
			con=DBHelper.getConnection();
			query="update DCMLS_LOGIN set USERNAME=?,PASSWORD=?,UPDATEDBY=? where USERID=?";
			ps=con.prepareStatement(query);
			ps.setString(1, login.getUsername());
			ps.setString(2, login.getPassword());
			ps.setDate(3,getCurrentDate());
			ps.setString(4,login.getUserid());
			result =ps.executeUpdate();
			
		}catch(Exception e)
		{
			System.out.println("**error** LoginDL:updateuserlogin"+e.getMessage());
		}
		return result;
	}
	public static Login approveuser(String UserID)
	{
		ArrayList<Login> logins=null;
		Connection con=null;
		Statement statement=null;
		ResultSet resultSet=null;
		Login login=null;
		try
		{
			logins=new ArrayList<Login>();
			String sql="select * FROM DCMLS_LOGIN where USERID='"+UserID+"'";
			con=DBHelper.getConnection();
			statement=con.createStatement();
			resultSet=statement.executeQuery(sql);
			while(resultSet.next())
			{
				login=new Login();
				login.setUserid(resultSet.getString("USERID"));
				login.setUsername(resultSet.getString("USERNAME"));
				login.setPassword(resultSet.getString("PASSWORD"));
				logins.add(login);
			}
			resultSet.close();
			statement.close();
			con.close();
			
		}
		catch(Exception e)
		{
			System.out.println("**error** userDL:getuser"+e.getMessage());
		}
		return login;
	}
	public static void userloginTime(String userid)
	{
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			con=DBHelper.getConnection();
			query="update DCMLS_LOGIN set INTIME=? where USERID=?";
			ps=con.prepareStatement(query);
			ps.setString(1,getdateTime());
			ps.setString(2,userid);
			ps.executeUpdate();
			
		}catch(Exception e)
		{
			System.out.println("**error** logindl:forgotpasswordupdate"+e.getMessage());
		}
	}
	public static void userlogoutTime(String userid)
	{
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			con=DBHelper.getConnection();
			query="update DCMLS_LOGIN set OUTTIME=? where USERID=?";
			ps=con.prepareStatement(query);
			ps.setString(1,getdateTime());
			ps.setString(2,userid);
			ps.executeUpdate();
			
		}catch(Exception e)
		{
			System.out.println("**error** logindl:forgotpasswordupdate"+e.getMessage());
		}
	}
	
	public static ArrayList<Login> getlogins()
	{
		ArrayList<Login> logins=null;
		Connection con=null;
		Statement statement=null;
		ResultSet resultSet=null;
		Login login=null;
		try
		{
			logins=new ArrayList<Login>();
			String sql="select * FROM DCMLS_LOGIN where TYPE!='ADMIN' AND STATUS='1'";
			con=DBHelper.getConnection();
			statement=con.createStatement();
			resultSet=statement.executeQuery(sql);
			while(resultSet.next())
			{
				login=new Login();
				login.setUsername(resultSet.getString("USERNAME"));
				login.setIntime(resultSet.getString("INTIME"));
				login.setOuttime(resultSet.getString("OUTTIME"));
				logins.add(login);
			}
			resultSet.close();
			statement.close();
			con.close();
			
		}
		catch(Exception e)
		{
			System.out.println("**error** userDL:getuser"+e.getMessage());
		}
		return logins;
	}

}
