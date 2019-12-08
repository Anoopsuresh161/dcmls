package dcmls.dl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dcmls.bl.UservisitedbookBL;

//import org.apache.tomcat.jni.File;
//import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;


import dcmls.dl.DBHelper;
import dcmls.dto.BookDTO;
public class BookDL 
{
	public static int addBook(BookDTO book)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		//String url1="E:";
		//String url2="ANOOP SURESH";
		//String url3="olddcmls";
		String url4="pdfs";
		try
		{
			con=DBHelper.getConnection();
			query="INSERT INTO DCMLS_BOOK(BOOKID,BOOKNAME,BOOKTYPE,AUTHOR,PUBLISHER,PDF,CREATEDBY,UPDATEDBY)VALUES(?,?,?,?,?,?,?,?)";
			int id=bookId();
			ps=con.prepareStatement(query);
			ps.setInt(1,id);
			ps.setString(2,book.getBookName());
			ps.setString(3,book.getBookType());
			ps.setString(4,book.getAuthor());
			ps.setString(5,book.getPublisher());
			//ps.setString(6,url1+"\\"+url2+"\\"+url3+"\\"+url4+"\\"+book.getPdf());
			ps.setString(6,url4+"/"+book.getPdf());
			ps.setDate(7, getCurrentDate());
			ps.setDate(8, getCurrentDate());
			result=ps.executeUpdate();
			UservisitedbookBL.addUservisitedBook(id);
			
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**ERROR** BookDL:addBook"+e.getMessage());
		}
		
		
		return result;
	}
	private static int bookId()
	{
		Connection con=null;
		Statement statement=null;
		int bookid=0;
		try
		{
			con=DBHelper.getConnection();
			statement = con.createStatement();
			ResultSet rs=statement.executeQuery("SELECT BOOKID FROM DCMLS_BOOK ORDER BY BOOKID DESC");
			if(rs.next()){
			bookid=rs.getInt("BOOKID")+1;
			}	
		}catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		return bookid;
	}
	// to get the current date
		private static java.sql.Date getCurrentDate()
		{
		    java.util.Date today = new java.util.Date();
		    return new java.sql.Date(today.getTime());
		}
	public static int updateBook(BookDTO book)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		String url4="pdfs";
		try
		{
			con=DBHelper.getConnection(); 
			query = "UPDATE DCMLS_BOOK SET BOOKNAME=?,BOOKTYPE=?,AUTHOR=?,PUBLISHER=?,PDF=?,UPDATEDBY=? WHERE BOOKID=?";
			ps=con.prepareStatement(query);
			ps.setString(1,book.getBookName());
			ps.setString(2,book.getBookType());
			ps.setString(3,book.getAuthor());
			ps.setString(4,book.getPublisher());
			ps.setString(5,url4+"/"+book.getPdf());
			ps.setDate(6, getCurrentDate());
			ps.setInt(7,book.getBookID());
			result=ps.executeUpdate();
			ps.close();
			 con.close();
			
		}
		catch(Exception e)
		{
			System.out.println("**ERROR** BookDL:updateBook"+e.getMessage());
		}
		
		
		return result;
	}
	public static int deleteBook(int BookID)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		
		
		try
		{ 
			con=DBHelper.getConnection();    
			query = "DELETE FROM DCMLS_BOOK WHERE BOOKID=?";
			ps=con.prepareStatement(query);
			ps.setInt(1,BookID);
			result= ps.executeUpdate();
			ps.close();
			con.close();
			
		}
		catch(Exception e)
		{
			System.out.println("**ERROR** BookDL:deleteBook"+e.getMessage());
		}
		
		
		return result;
	}
	public static BookDTO getBook(int BookID)
	{
		Connection con;
		Statement statement=null;
		ResultSet resultSet=null;
		BookDTO book=null;
		
		
		try
		{
			String sql="SELECT * FROM DCMLS_BOOK WHERE BOOKID="+BookID;
			con=DBHelper.getConnection();
			statement=con.createStatement();
			resultSet=statement.executeQuery(sql);
			while(resultSet.next())
			{
				book=new BookDTO();
				book.setBookID(resultSet.getInt("BookID"));
				book.setBookName(resultSet.getString("BookName"));
				book.setBookType(resultSet.getString("BookType"));
				book.setAuthor(resultSet.getString("Author"));
				book.setPublisher(resultSet.getString("Publisher"));
				book.setPdf(resultSet.getString("Pdf"));
		
				
			}
			resultSet.close();
			statement.close();
			con.close();
			
			
		}
		catch(Exception e)
		{
			System.out.println("**ERROR** BookDL:getBook"+e.getMessage());
		}
		
		
		return book;
	}
	public static ArrayList<BookDTO> getBooks()
	{
		ArrayList<BookDTO> books=null;
		Connection con;
		Statement statement=null;
		ResultSet resultSet=null;
		BookDTO book=null;
		
		
		try
		{
			books=new ArrayList<BookDTO>();
			String sql="SELECT * FROM DCMLS_BOOK";
			con=DBHelper.getConnection();
			statement=con.createStatement();
			resultSet=statement.executeQuery(sql);
			
			while(resultSet.next())
			{
				book=new BookDTO();
				book.setBookID(resultSet.getInt("BookID"));
				book.setBookName(resultSet.getString("BookName"));
				book.setBookType(resultSet.getString("BookType"));
				book.setAuthor(resultSet.getString("Author"));
				book.setPublisher(resultSet.getString("Publisher"));
				book.setPdf(resultSet.getString("Pdf"));
				books.add(book);
			}
			resultSet.close();
			statement.close();
			con.close();
			
			
		}
		catch(Exception e)
		{
			System.out.println("**ERROR** BookDL:getBooks"+e.getMessage());
		}
		
		
		return books;
	}
	public static ArrayList<BookDTO> getTypes()
	{
		ArrayList<BookDTO> types=null;
		Connection con;
		Statement statement=null;
		ResultSet resultSet=null;
		BookDTO type=null;
		
		
		try
		{
			types=new ArrayList<BookDTO>();
			String sql="SELECT DISTINCT BOOKTYPE FROM DCMLS_BOOK";
			con=DBHelper.getConnection();
			statement=con.createStatement();
			resultSet=statement.executeQuery(sql);
			
			while(resultSet.next())
			{
				type=new BookDTO();

				type.setBookType(resultSet.getString("BookType"));
				types.add(type);
			}
			resultSet.close();
			statement.close();
			con.close();
			
			
		}
		catch(Exception e)
		{
			System.out.println("**ERROR** BookDL:getBooks"+e.getMessage());
		}
		
		
		return types;
	}
	public static ArrayList<BookDTO> getSelectbooks(String booktype)
	{
		ArrayList<BookDTO> types=null;
		Connection con;
		Statement statement=null;
		ResultSet resultSet=null;
		BookDTO type=null;
		
		
		try
		{
			types=new ArrayList<BookDTO>();
			String sql="SELECT * FROM DCMLS_BOOK WHERE BOOKTYPE='"+booktype+"'";
			con=DBHelper.getConnection();
			statement=con.createStatement();
			resultSet=statement.executeQuery(sql);
			
			while(resultSet.next())
			{
				type=new BookDTO();

				type.setBookID(resultSet.getInt("BookID"));
				type.setBookName(resultSet.getString("BookName"));
				type.setBookType(resultSet.getString("BookType"));
				type.setAuthor(resultSet.getString("Author"));
				type.setPublisher(resultSet.getString("Publisher"));
				type.setPdf(resultSet.getString("Pdf"));
				types.add(type);
			}
			resultSet.close();
			statement.close();
			con.close();
			
			
		}
		catch(Exception e)
		{
			System.out.println("**ERROR** BookDL:getselectedbooks"+e.getMessage());
		}
		
		
		return types;
	}
	public static ArrayList<BookDTO> getmostviewed(int bookid)
	{
		ArrayList<BookDTO> bookdetails=null;
		Connection con;
		Statement statement=null;
		ResultSet resultSet=null;
		BookDTO bookdetail=null;
		
		
		try
		{
			bookdetails=new ArrayList<BookDTO>();
			String sql="SELECT * FROM DCMLS_BOOK WHERE BOOKID="+bookid;
			con=DBHelper.getConnection();
			statement=con.createStatement();
			resultSet=statement.executeQuery(sql);
			
			while(resultSet.next())
			{
				bookdetail=new BookDTO();

				bookdetail.setBookID(resultSet.getInt("BookID"));
				bookdetail.setBookName(resultSet.getString("BookName"));
				bookdetail.setBookType(resultSet.getString("BookType"));
				bookdetail.setAuthor(resultSet.getString("Author"));
				bookdetail.setPublisher(resultSet.getString("Publisher"));
				bookdetail.setPdf(resultSet.getString("Pdf"));
				bookdetails.add(bookdetail);
			}
			resultSet.close();
			statement.close();
			con.close();
			
			
		}
		catch(Exception e)
		{
			System.out.println("**ERROR** BookDL:getselectedbooks"+e.getMessage());
		}
		
		
		return bookdetails;
	}


}
