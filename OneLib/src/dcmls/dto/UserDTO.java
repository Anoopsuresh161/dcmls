package dcmls.dto;

public class UserDTO
{
	int status;
	String UserID,UserName,PhoneNumber,EmailID,Address,type,dob,gender;
	
	public String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		UserID = userID;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPhoneNumber() 
	{
		return PhoneNumber;
	}
	public void setPhoneNumber(String phoneNumber)
	{
		this.PhoneNumber = phoneNumber;
	}
	public String getUserName() 
	{
		return UserName;
	}
	public void setUserName(String userName) 
	{
		this.UserName = userName;
	}
	public String getEmailID() 
	{
		return EmailID;
	}
	public void setEmailID(String emailID)
	{
		this.EmailID = emailID;
	}
	public String getAddress()
	{
		return Address;
	}
	public void setAddress(String address) 
	{
		this.Address = address;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	
	
}
