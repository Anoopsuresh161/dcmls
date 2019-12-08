package dcmls.bl;
import dcmls.dl.*;
import dcmls.dto.*;
import java.util.*;

public class UserBL {
	public static int addUser(UserDTO user)
	{
		int result=0;
		try
		{
			
			result=UserDL.addUser(user);
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**error** userdl:adduser"+e.getMessage());
		}
		return result;
	}
	public static UserDTO  getUser(String UserID)
	{
		UserDTO user=null;
		try
		{
			user=UserDL.getUser(UserID);
		}
		catch(Exception e)
		{
			System.out.println("**error** userDL:getuser"+e.getMessage());
		}
		return user;
	}
	public static int updateuser(UserDTO user)
	{
		int result=0;
		
		try
		{
			result =UserDL.updateuser(user);
			
		}catch(Exception e)
		{
			System.out.println("**error** Userbl:updateUser"+e.getMessage());
		}
		return result;
	}
	public static ArrayList<UserDTO> getUsers()
	{
		ArrayList<UserDTO> users=null;
		try
		{
			users=UserDL.getUsers();
		}
		catch (Exception e)
		{
			System.out.println("**error** userBL:getusers"+e.getMessage());
		}
		return users;
	}
	public static ArrayList<UserDTO> rejectedusers()
	{
		ArrayList<UserDTO> users=null;
		try
		{
			users=UserDL.rejectedusers();
		}
		catch (Exception e)
		{
			System.out.println("**error** userBL:getusers"+e.getMessage());
		}
		return users;
	}
	public static ArrayList<UserDTO> approvedusers()
	{
		ArrayList<UserDTO> users=null;
		try
		{
			users=UserDL.approvedusers();
		}
		catch (Exception e)
		{
			System.out.println("**error** userBL:getusers"+e.getMessage());
		}
		return users;
	}
	public static String forgotpassword(String phone)
	{
		String userid=null;
		userid=UserDL.forgotpassword(phone);
		return userid;
	}
	public static UserDTO approveuser(String userid)
	{
		UserDTO user=null;
		try
		{
			user=UserDL.approveuser(userid);
		}
		catch(Exception e)
		{
			System.out.println("**error** UserBL:retrive approved user details"+e.getMessage());
		}
		return user;
	}
	public static int updatestatus(UserDTO user)
	{
		int result=0;
		
		try
		{
			result =UserDL.updatestatus(user);
			
		}catch(Exception e)
		{
			System.out.println("**error** userbl:error occured to chage status"+e.getMessage());
		}
		return result;
	}
	

	
}
