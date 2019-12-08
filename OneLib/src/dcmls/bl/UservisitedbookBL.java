package dcmls.bl;
import java.util.ArrayList;
import dcmls.dl.UservisitedbookDL;

public class UservisitedbookBL {
		public static void addUservisitedBook(int bookid)
		{
		
			try
			{
				System.out.println(bookid);
				UservisitedbookDL.addUservisitedBook(bookid);
			}
			catch(Exception e)
			{
				System.out.println("**error** addUservisitedBook"+e.getMessage());
			}
		}
	public static void uservisit(int bookid)
	{
		try
		{
			System.out.println(bookid);
			UservisitedbookDL.uservisit(bookid);
		}
		catch(Exception e)
		{
			System.out.println("**error** addUservisitedBook"+e.getMessage());
		}
	}
	public static ArrayList<Integer> getBookvisited()
	{
		ArrayList<Integer> uservisited=null;
		
		
		try
		{
		uservisited=UservisitedbookDL.getBookvisited();
			
			
		}
		catch(Exception e)
		{
			System.out.println("**ERROR** CaseBL:getBookTypes"+e.getMessage());
		}
		
	
		return uservisited;
	}

}
