package dcmls.bl;
import java.util.ArrayList;





import dcmls.dl.BookDL;
import dcmls.dto.BookDTO;
public class BookBL 
{
	public static int addBook(BookDTO book)
	{
		int result=0;
	
		try
		{
			result=BookDL.addBook(book);
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**error** bookdl:addbook"+e.getMessage());
		}
		return result;
	}
	public static BookDTO getBook (int BookID)
	{
		BookDTO book=null;
		try
		{
			book=BookDL.getBook(BookID);
		}
		catch(Exception e)
		{
			System.out.println("**error** BookDL:getbook"+e.getMessage());
		}
		return book;
	}
	public static ArrayList<BookDTO> getBooks()
	{
		ArrayList<BookDTO> books=null;
		
		
		try
		{
		books=BookDL.getBooks();
			
			
		}
		catch(Exception e)
		{
			System.out.println("**ERROR** CaseBL:getBooks"+e.getMessage());
		}
		
	
		return books;
	}
	public static ArrayList<BookDTO> getTypes()
	{
		ArrayList<BookDTO> types=null;
		
		
		try
		{
		types=BookDL.getTypes();
			
			
		}
		catch(Exception e)
		{
			System.out.println("**ERROR** CaseBL:getBookTypes"+e.getMessage());
		}
		
	
		return types;
	}
	public static ArrayList<BookDTO> getSelectbooks(String booktype)
	{
		ArrayList<BookDTO> types=null;
		
		
		try
		{
		types=BookDL.getSelectbooks(booktype);
			
			
		}
		catch(Exception e)
		{
			System.out.println("**ERROR** CaseBL:getBookTypes"+e.getMessage());
		}
		
	
		return types;
	}
	public static ArrayList<BookDTO> getmostviewed(int bookid)
	{
		ArrayList<BookDTO> bookids=null;
		
		
		try
		{
		bookids=BookDL.getmostviewed(bookid);
			
			
		}
		catch(Exception e)
		{
			System.out.println("**ERROR** CaseBL:getBookTypes"+e.getMessage());
		}
		
	
		return bookids;
	}
	public static int deleteBook(int BookID)
	{
		int result=0;
		

	try
	{   
		result = BookDL.deleteBook(BookID);
		

	}
	catch(Exception e)
	{
		
		System.out.println("**error**"+":deleteBook"+e.getMessage());
	}
	return result;
	}
	public static int updateBook(BookDTO book)
	{
		int result=0;
		

	try
	{
		
		result = BookDL.updateBook(book);
	}
	catch(Exception e)
	{
		
		System.out.println("**error**"+"bbokbl:updateBook"+e.getMessage());
	}
	return result;
	}

}
