package dcmls.bl;

import java.util.ArrayList;

import dcmls.dl.LoginDL;
import dcmls.dl.UserDL;
import dcmls.dto.Login;
import dcmls.dto.UserDTO;

public class LoginBL {
	
	public static int addLogin(Login login)
	{
		int result=0;
		try
		{
			
			result=LoginDL.addLogin(login);
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**error** logindl:cannot add data to the bl"+e.getMessage());
		}
		return result;
	}
	public static Login  getUser(String UserID)
	{
		Login login=null;
		try
		{
			login=LoginDL.getUser(UserID);
		}
		catch(Exception e)
		{
			System.out.println("**error** LoginDL:getuser"+e.getMessage());
		}
		return login;
	}
	public static int updateuser(Login login)
	{
		int result=0;
		
		try
		{
			result =LoginDL.updateuser(login);
			
		}catch(Exception e)
		{
			System.out.println("**error** Loginbl:updateLogin"+e.getMessage());
		}
		return result;
	}
	public static Login validateLogin(Login login1)
	{

		Login login2=null;
		try
		{
		 login2=LoginDL.validateLogin(login1);
			
		}catch(Exception e)
		{
			System.out.println("**error** LoginBl:Login"+e.getMessage());
		}
		return login2;
	}
	public static Login forgotpassword(String userid)
	{
		Login login=null;
		try
		{
			login=LoginDL.forgotpassword(userid);
		}
		catch(Exception e)
		{
			System.out.println("**error** loginbl:takedetails"+e.getMessage());
		}
		return login;
	}
	public static int forgotpasswordupdate(Login login)
	{
		int result=0;
		
		try
		{
			result =LoginDL.forgotpasswordupdate(login);
			
		}catch(Exception e)
		{
			System.out.println("**error** loginbl:forgotpasswordupdate"+e.getMessage());
		}
		return result;
	}
	public static int updatestatus(Login login)
	{
		int result=0;
		
		try
		{
			result =LoginDL.updatestatus(login);
			
		}catch(Exception e)
		{
			System.out.println("**error** Mobbl:updateMob"+e.getMessage());
		}
		return result;
	}
	public static Login approveuser(String userid)
	{
		Login login=null;
		try
		{
			login=LoginDL.approveuser(userid);
		}
		catch(Exception e)
		{
			System.out.println("**error** UserBL:retrive approved user details"+e.getMessage());
		}
		return login;
	}
	public static void userloginTime(String userid)
	{
		LoginDL.userloginTime(userid);
	}
	public static void userlogoutTime(String userid)
	{
		LoginDL.userlogoutTime(userid);
	}
	public static ArrayList<Login> getLogins()
	{
		ArrayList<Login> logins=null;
		try
		{
			logins=LoginDL.getlogins();
		}
		catch (Exception e)
		{
			System.out.println("**error** userBL:getusers"+e.getMessage());
		}
		return logins;
	}
}
