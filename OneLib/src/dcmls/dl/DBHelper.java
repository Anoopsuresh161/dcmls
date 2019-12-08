package dcmls.dl;
import java.sql.*;
public class DBHelper {
	public static Connection getConnection()
	{
		Connection con=null;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ANOOPTESTDB","anoop");
			
			
		}
		catch(Exception e)
		{
			System.out.println("***error***"+e.getMessage());
		}
		return con;
		
	}
	public static void closeConnection()
	{
		
	}

}