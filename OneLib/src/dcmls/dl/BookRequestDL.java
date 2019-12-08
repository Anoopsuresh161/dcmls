package dcmls.dl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dcmls.dto.BookDTO;
import dcmls.dto.BookRequestDTO;

public class BookRequestDL {
	
	public static int addRequest(BookRequestDTO bookrequest)
	{ 
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;	
	try
		{
			con=DBHelper.getConnection();
			query="insert into DCMLS_NEWBOOKREQUEST(REQUESTID,BOOKNAME,AUTHOR,PUBLISHER,USERID,CREATEDBY,UPDATEDBY)VALUES(?,?,?,?,?,?,?)";
			ps=con.prepareStatement(query);
			ps.setInt(1,requestId());
			ps.setString(2,bookrequest.getBookname());
			ps.setString(3,bookrequest.getAuthor());
			ps.setString(4,bookrequest.getPublisher());
			ps.setString(5,bookrequest.getUserid());
			ps.setDate(6, getCurrentDate());
			ps.setDate(7, getCurrentDate());
			
			result =ps.executeUpdate();
			
		}catch(Exception e)
		{
			result=-1;
			System.out.println("**error** logindl:adduser"+e.getMessage());
		}
		return result;
	}
	//to auto increment the user's loginid
	private static int requestId()
	{
		Connection con=null;
		Statement statement=null;
		int requestid=0;
		try
		{
			con=DBHelper.getConnection();
			statement = con.createStatement();
			ResultSet rs=statement.executeQuery("SELECT REQUESTID FROM DCMLS_NEWBOOKREQUEST ORDER BY REQUESTID DESC");
			if(rs.next()){
			requestid=rs.getInt("REQUESTID")+1;
			}	
		}catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		return requestid;
	}
	// to get the current date
		private static java.sql.Date getCurrentDate()
		{
		    java.util.Date today = new java.util.Date();
		    return new java.sql.Date(today.getTime());
		}
		
		public static ArrayList<BookRequestDTO> getRequests(String userid)
		{
			ArrayList<BookRequestDTO> requests=null;
			Connection con;
			Statement statement=null;
			ResultSet resultSet=null;
			BookRequestDTO request=null;
			
			
			try
			{
				requests=new ArrayList<BookRequestDTO>();
				String sql="SELECT * FROM DCMLS_NEWBOOKREQUEST WHERE USERID='"+userid+"'";
				con=DBHelper.getConnection();
				statement=con.createStatement();
				resultSet=statement.executeQuery(sql);
				
				while(resultSet.next())
				{
					request=new BookRequestDTO();

					request.setBookname(resultSet.getString("BOOKNAME"));
					request.setAuthor(resultSet.getString("AUTHOR"));
					request.setPublisher(resultSet.getString("PUBLISHER"));
					requests.add(request);
				}
				resultSet.close();
				statement.close();
				con.close();
				
				
			}
			catch(Exception e)
			{
				System.out.println("**ERROR** BookDL:getselectedbooks"+e.getMessage());
			}
			
			
			return requests;
		}
		public static ArrayList<BookRequestDTO> viewRequests()
		{
			ArrayList<BookRequestDTO> requests=null;
			Connection con;
			Statement statement=null;
			ResultSet resultSet=null;
			BookRequestDTO viewrequest=null;
			
			
			try
			{
				requests=new ArrayList<BookRequestDTO>();
				String sql="SELECT * FROM DCMLS_NEWBOOKREQUEST";
				con=DBHelper.getConnection();
				statement=con.createStatement();
				resultSet=statement.executeQuery(sql);
				
				while(resultSet.next())
				{
					viewrequest=new BookRequestDTO();

					viewrequest.setBookname(resultSet.getString("BOOKNAME"));
					viewrequest.setAuthor(resultSet.getString("AUTHOR"));
					viewrequest.setPublisher(resultSet.getString("PUBLISHER"));
					requests.add(viewrequest);
				}
				resultSet.close();
				statement.close();
				con.close();
				
				
			}
			catch(Exception e)
			{
				System.out.println("**ERROR** BookDL:getselectedbooks"+e.getMessage());
			}
			
			
			return requests;
		}


}
