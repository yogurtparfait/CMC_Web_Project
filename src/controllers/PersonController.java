package controllers;
import java.util.List;

import entities.*;
import interfaces.*;
/**
 * @author Megan Noah Jordan Yang
 *
 */
public class PersonController {
	
	private Person thisPerson;
	private DBController database;
	public PersonController(){}
	/**
	 * @param p person using program currently
	 */
	public PersonController(Person p){
		this.thisPerson = p;
		this.database=new DBController();
	}
	
	/**
	 * Logs on by getting correct user and generating and returning UI and controller
	 * @param username Username of person to log in
	 * @param password person's password
	 * @param steal whether they want to steal the session or not
	 * @return PersonUI that is either and adminui or userui depending on which type of user just logged in
	 */
	public PersonUI logOn(String username, String password, boolean steal){
			//Steal does nothing.
			
		Person foundPerson = database.findByUserName(username);
		if(!(foundPerson==null)){								//person exists
			if(password.equals(foundPerson.getPassword())){ 	//password correct
				if(foundPerson.getIsActive()){					//is active
					if(database.logInPerson(foundPerson)){ 		//going to be steal
						if(foundPerson.getIsAdmin()){			//admin
							return new AdminUI((Admin)foundPerson);
						}
						else 									//user 
						{ 
							return new UserUI((User)foundPerson);
						}
					}
					else
					{											//going to be could not steal
						throw new IllegalArgumentException("Session in use");
					}
				}
				else
				{ 												//not active
					throw new IllegalArgumentException("Person is deactivated");
				}
			}
			else {												//bad password
				throw new IllegalArgumentException("Password incorrect");
			}
		}															
		else
		{														//person does not exist
			throw new IllegalArgumentException("Username incorrect");
		}
	}
	 
	/**
	 * logs a person out
	 * @return true on success
	 */
	public boolean logOut(){
		if(this.thisPerson==null) return false;
			else return database.logOut(this.thisPerson);
	}
	
	
	/**
	 * sets the person the controller is working as
	 * @param p Person to be assigned to this controller
	 */
	public void assignPerson(Person p){
		this.thisPerson = p;
	}
	/**
	 * checks if person is active or deactivated
	 * @param p Person to be checked
	 * @return a for active d for deactivated
	 */
	/*public char getActiveState(Person p)					//need to eliminate this does not belong here
	{
		return database.getActiveState(p);
	}*/
	/**
	 * Gets database entry with specified name
	 * @param name
	 * @return school with correct name
	 */
	public School getSchoolByName(String name){
		return database.getSchoolByName(name);
	}
}
