package dcmls.dl;
import java.sql.*;

import java.util.ArrayList;
import dcmls.dto.*;
public class UserDL 
{
	private static ArrayList<UserDTO> users;
	//add new user into the table
	public static int addUser(UserDTO user)
	{ 
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			con=DBHelper.getConnection();
			query="insert into DCMLS_USER(USERID,USERNAME,PHONENUMBER,DATEOFBIRTH,GENDER,TYPE,EMAILID,ADDRESS,STATUS,CREATEDBY,UPDATEDBY)VALUES(?,?,?,?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(query);
			ps.setString(1,user.getUserID());
			ps.setString(2,user.getUserName());
			ps.setString(3,user.getPhoneNumber());
			ps.setString(4, user.getDob());
			ps.setString(5,user.getGender());
			ps.setString(6, user.getType());
			ps.setString(7,user.getEmailID());
			ps.setString(8,user.getAddress());
			ps.setInt(9,0);
			ps.setDate(10,getCurrentDate());
			ps.setDate(11, getCurrentDate());
			
			
			result =ps.executeUpdate();
			
		}catch(Exception e)
		{
			result=-1;
			System.out.println("**error** userdl:adduser"+e.getMessage());
		}
		return result;
	}
	//method to get the current date
	private static java.sql.Date getCurrentDate()
	{
	    java.util.Date today = new java.util.Date();
	    return new java.sql.Date(today.getTime());
	}
	//method to get all the new users who are not the aproved users
	public static ArrayList<UserDTO> getUsers()
	{
		ArrayList<UserDTO> users=null;
		Connection con=null;
		Statement statement=null;
		ResultSet resultSet=null;
		UserDTO user=null;
		try
		{
			users=new ArrayList<UserDTO>();
			String sql="select * FROM DCMLS_USER where TYPE!='ADMIN' and STATUS='0'";
			con=DBHelper.getConnection();
			statement=con.createStatement();
			resultSet=statement.executeQuery(sql);
			while(resultSet.next())
			{
				user=new UserDTO();
				user.setUserID(resultSet.getString("UserID"));
				user.setUserName(resultSet.getString("UserName"));
				user.setPhoneNumber(resultSet.getString("PhoneNumber"));
				user.setEmailID(resultSet.getString("EmailID"));
				user.setAddress(resultSet.getString("Address"));
				user.setType(resultSet.getString("type"));
				users.add(user);
			}
			resultSet.close();
			statement.close();
			con.close();
			
		}
		catch(Exception e)
		{
			System.out.println("**error** userDL:getuser"+e.getMessage());
		}
		return users;
	}
	//method to get the rejected users
	public static ArrayList<UserDTO> rejectedusers()
	{
		ArrayList<UserDTO> users=null;
		Connection con=null;
		Statement statement=null;
		ResultSet resultSet=null;
		UserDTO user=null;
		try
		{
			users=new ArrayList<UserDTO>();
			String sql="select * FROM DCMLS_USER where TYPE!='ADMIN' and STATUS='2'";
			con=DBHelper.getConnection();
			statement=con.createStatement();
			resultSet=statement.executeQuery(sql);
			while(resultSet.next())
			{
				user=new UserDTO();
				user.setUserID(resultSet.getString("UserID"));
				user.setUserName(resultSet.getString("UserName"));
				user.setPhoneNumber(resultSet.getString("PhoneNumber"));
				user.setEmailID(resultSet.getString("EmailID"));
				user.setAddress(resultSet.getString("Address"));
				user.setType(resultSet.getString("type"));
				users.add(user);
			}
			resultSet.close();
			statement.close();
			con.close();
			
		}
		catch(Exception e)
		{
			System.out.println("**error** userDL:getuser"+e.getMessage());
		}
		return users;
	}
	//method to get the approved users
	public static ArrayList<UserDTO> approvedusers()
	{
		ArrayList<UserDTO> users=null;
		Connection con=null;
		Statement statement=null;
		ResultSet resultSet=null;
		UserDTO user=null;
		try
		{
			users=new ArrayList<UserDTO>();
			String sql="select * FROM DCMLS_USER where TYPE!='ADMIN' and STATUS='1'";
			con=DBHelper.getConnection();
			statement=con.createStatement();
			resultSet=statement.executeQuery(sql);
			while(resultSet.next())
			{
				user=new UserDTO();
				user.setUserID(resultSet.getString("UserID"));
				user.setUserName(resultSet.getString("UserName"));
				user.setPhoneNumber(resultSet.getString("PhoneNumber"));
				user.setEmailID(resultSet.getString("EmailID"));
				user.setAddress(resultSet.getString("Address"));
				user.setType(resultSet.getString("type"));
				users.add(user);
			}
			resultSet.close();
			statement.close();
			con.close();
			
		}
		catch(Exception e)
		{
			System.out.println("**error** userDL:getuser"+e.getMessage());
		}
		return users;
	}
	// method to get a specific user
	public static UserDTO getUser(String UserID)
	{
		
		Connection con=null;
		Statement statement=null;
		ResultSet resultSet=null;
		UserDTO user=null;
		try
		{
			String sql="select * FROM DCMLS_USER WHERE USERID='"+UserID+"'";
			con=DBHelper.getConnection();
			statement=con.createStatement();
			resultSet=statement.executeQuery(sql);
			if(resultSet.next())
			{
				user=new UserDTO();
				user.setUserID(resultSet.getString("UserID"));
				user.setUserName(resultSet.getString("UserName"));
				user.setPhoneNumber(resultSet.getString("PhoneNumber"));
				user.setEmailID(resultSet.getString("EmailID"));
				user.setAddress(resultSet.getString("Address"));
				users.add(user);
			}
			
		}catch(Exception e)
		{
			System.out.println("**error** userdl:getuserdetails"+e.getMessage());
		}
		return user;
		
	}
	// method to update the user details
	public static int updateuser(UserDTO user)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			con=DBHelper.getConnection();
			query="update DCMLS_USER set USERNAME=?,PHONENUMBER=?,EMAILID=?,ADDRESS=?,UPDATEDBY=? where USERID=?";
			ps=con.prepareStatement(query);
			ps.setString(1,user.getUserName());
			ps.setString(2,user.getPhoneNumber());
			ps.setString(3, user.getEmailID());
			ps.setString(4, user.getAddress());
			ps.setDate(5,getCurrentDate());
			ps.setString(6, user.getUserID());
			result =ps.executeUpdate();
			
		}catch(Exception e)
		{
			System.out.println("**error** UserDL:updateuser"+e.getMessage());
		}
		return result;
	}
	public ArrayList<UserDTO> getUser()
	{
		ArrayList<UserDTO> user=null;
		try
		{
			
		}
		catch(Exception e)
		{
			System.out.println("**error** userdl:addusert"+e.getMessage());
		}
		return user;
	}
	//method to get the id of the specific user
	public static String forgotpassword(String phone)
	{
		String id=null;
		Connection con=null;
		Statement statement=null;
		ResultSet resultSet=null;
		try
		{
			String sql="select USERID FROM DCMLS_USER WHERE PHONENUMBER='"+phone+"'";
			con=DBHelper.getConnection();
			statement=con.createStatement();
			resultSet=statement.executeQuery(sql);
			while(resultSet.next())
			{
				id=resultSet.getString(1);
			}
			resultSet.close();
			statement.close();
			con.close();
			
		}
		catch(Exception e)
		{
			System.out.println("**error** UserDL:getuserid"+e.getMessage());
		}
		return id;
	}
	//select the particular approved user
	public static UserDTO approveuser(String UserID)
	{
		ArrayList<UserDTO> userdetails=null;
		Connection con=null;
		Statement statement=null;
		ResultSet resultSet=null;
		UserDTO user=null;
		try
		{
			userdetails=new ArrayList<UserDTO>();
			String sql="select * FROM DCMLS_USER where USERID='"+UserID+"'";
			con=DBHelper.getConnection();
			statement=con.createStatement();
			resultSet=statement.executeQuery(sql);
			while(resultSet.next())
			{
				user=new UserDTO();
				user.setUserID(resultSet.getString("UserID"));
				user.setUserName(resultSet.getString("UserName"));
				user.setPhoneNumber(resultSet.getString("PhoneNumber"));
				user.setEmailID(resultSet.getString("EmailID"));
				user.setAddress(resultSet.getString("Address"));
				user.setType(resultSet.getString("type"));
				userdetails.add(user);
			}
			resultSet.close();
			statement.close();
			con.close();
			
		}
		catch(Exception e)
		{
			System.out.println("**error** userDL:getuser"+e.getMessage());
		}
		return user;
	}
	//update the status to 1 or 2 according to the admins descsiion
	public static int updatestatus(UserDTO user)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			con=DBHelper.getConnection();
			query="update DCMLS_USER set STATUS=? where USERID=?";
			ps=con.prepareStatement(query);
			ps.setInt(1,user.getStatus());
			ps.setString(2,user.getUserID());
			result =ps.executeUpdate();
			
		}catch(Exception e)
		{
			System.out.println("**error** userdl:update the status of approved user"+e.getMessage());
		}
		return result;
	}

	
	
	

}
