package main.webapp.model;

import java.sql.Date;

public class User {
	private String userName;
    private String password;
    
    private String name;
    private String surname;
    private Date birthdayDate;
    private String sesso;
    private String telephoneNumber;
    private String email;
    
    public String getName() {
 	   return name;
     }
    public void setName(String name) {
        this.name = name;
     }
    
    public String getSurname() {
  	   return surname;
      }
     public void setSurname(String surname) {
         this.surname = surname;
      }
     
     public Date getBirthdayDate() {
    	   return birthdayDate;
        }
       public void setBirthdayDate(Date birthdayDate) {
           this.birthdayDate = birthdayDate;
        }
       
       public String getSesso() {
    	   return sesso;
        }
       public void setSesso(String sesso) {
           this.sesso = sesso;
        }
       
       public String getTelephoneNumber() {
    	   return telephoneNumber;
        }
       public void setTelephoneNumber(String telephoneNumber) {
           this.telephoneNumber = telephoneNumber;
        }
       
       public String getEmail() {
    	   return email;
        }
       public void setEmail(String email) {
           this.email = email;
        }




   public String getUserName() {
	   return userName;
    }
   public void setUserName(String userName) {
       this.userName = userName;
    }
    public String getPassword() {
       return password;
    }
    public void setPassword(String password) {
       this.password = password;
    }

}
