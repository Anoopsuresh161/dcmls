package dcmls.dl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class UservisitedbookDL {
	public static void addUservisitedBook(int bookid)
	{
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			con=DBHelper.getConnection();
			query="INSERT INTO DCMLS_USERVISITEDBOOK(VISITID,BOOKID,COUNT,CREATEDBY,UPDATEDBY)VALUES(?,?,?,?,?)";
			
			ps=con.prepareStatement(query);
			
			ps.setInt(1,visitid());
			ps.setInt(2,bookid);
			ps.setInt(3,0);
			ps.setDate(4, getCurrentDate());
			ps.setDate(5, getCurrentDate());
			
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("**ERROR** addUservisitedBook"+e.getMessage());
		}
	}
	
	public static void uservisit(int bookid)
	{
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			con=DBHelper.getConnection(); 
			query = "UPDATE DCMLS_USERVISITEDBOOK SET COUNT=?,UPDATEDBY=? WHERE BOOKID=?";
			ps=con.prepareStatement(query);
			ps.setInt(1,getCount(bookid));
			ps.setDate(2, getCurrentDate());
			ps.setInt(3,bookid);
			ps.executeUpdate();
			ps.close();
			con.close();
			
		}
		catch(Exception e)
		{
			System.out.println("**ERROR** BookDL:updateBook"+e.getMessage());
		}
		
	}
	private static int visitid()
	{
		Connection con=null;
		Statement statement=null;
		int visitid=0;
		try
		{
			con=DBHelper.getConnection();
			statement = con.createStatement();
			ResultSet rs=statement.executeQuery("SELECT VISITID FROM DCMLS_USERVISITEDBOOK ORDER BY VISITID DESC");
			if(rs.next()){
			visitid=rs.getInt("VISITID")+1;
			}	
		}catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		return visitid;
	}
	// to get the current date
		private static java.sql.Date getCurrentDate()
		{
		    java.util.Date today = new java.util.Date();
		    return new java.sql.Date(today.getTime());
		}
		private static int getCount(int bookid)
		{
			Connection con=null;
			Statement statement=null;
			int visitid=0;
			try
			{
				con=DBHelper.getConnection();
				statement = con.createStatement();
				ResultSet rs=statement.executeQuery("SELECT COUNT FROM DCMLS_USERVISITEDBOOK WHERE BOOKID="+bookid);
				if(rs.next()){
				visitid=rs.getInt("COUNT")+1;
				}	
			}catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
			
			return visitid;
		}
		
		public static ArrayList<Integer> getBookvisited()
		{
			ArrayList<Integer> bookvisited=null;
			int bookid;
			Connection con;
			Statement statement=null;
			ResultSet resultSet=null;
			
			
			try
			{
				bookvisited=new ArrayList<Integer>();
				String sql="SELECT BOOKID FROM DCMLS_USERVISITEDBOOK WHERE COUNT>5";
				con=DBHelper.getConnection();
				statement=con.createStatement();
				resultSet=statement.executeQuery(sql);
				
				while(resultSet.next())
				{
					
					bookid = resultSet.getInt("BOOKID");
					
					bookvisited.add(bookid);
				}
				resultSet.close();
				statement.close();
				con.close();
				
				
			}
			catch(Exception e)
			{
				System.out.println("**ERROR** BookDL:getBooks"+e.getMessage());
			}
			
			
			return bookvisited;
		}


}
