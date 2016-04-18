package interfaces;

import java.util.List;

import entities.*;
import controllers.*;
/**
 * @author Megan Jordan Noah Yang
 *
 */
public class UserUI extends PersonUI{

	public UserController controller;
	
	/**
	 * @param u user to create UI for
	 */
	public UserUI(User u) {
		this.controller = new UserController(u);
		
	}
	
	/**
	 * @return schools saved by user
	 */ 
	public List<School> getSavedSchools(){
		return this.controller.getSavedSchools();
	}
	
	//Returns all info as string with emphases at the end
	/**
	 * @param s school to get info of
	 * @return list of strings of schools info
	 */
	public List<String> displaySchoolInfo(School s){
		return this.controller.displaySchoolInfo(s);
	}
	
	/**
	 * @param s school to be unsaved
	 * @return true on success
	 */
	public boolean removeSavedSchool(School s){
		return this.controller.removeSavedSchool(s);
	}
	
	/**
	 * adds school to user's list of saved schools
	 * @param s school to be saved
	 * @return true on sucess
	 */
	public boolean saveSchool(School s){
		return this.controller.saveSchool(s);
	}
	
	//give null or -1 for empty fields
	/**
	 * searches for schools matching parameters
	 * 
	 * @param name
	 * @param state
	 * @param location
	 * @param control
	 * @param numStudents
	 * @param percentFemale
	 * @param SATVerb
	 * @param SATMath
	 * @param expenses
	 * @param percentFinancialAid
	 * @param numberOfApplicants
	 * @param percentAdmitted
	 * @param percentEnrolled
	 * @param academicsScale
	 * @param socialScale
	 * @param qualityOfLifeScale
	 * @param emphases
	 * @return list of schools matching parameters
	 */
	
	//TOPs should be -1 if invalid or ""
	public List<School> search(String name,String state,String location,String control,
			
			int BOTnumStudents,double BOTpercentFemale,double BOTSATVerb,double BOTSATMath,double BOTexpenses,
			int TOPnumStudents,double TOPpercentFemale,double TOPSATVerb,double TOPSATMath,double TOPexpenses,
			
			double BOTpercentFinancialAid,int BOTnumberOfApplicants,double BOTpercentAdmitted,
			double TOPpercentFinancialAid,int TOPnumberOfApplicants,double TOPpercentAdmitted,
			
			double BOTpercentEnrolled,int BOTacademicsScale,int BOTsocialScale,int BOTqualityOfLifeScale,
			double TOPpercentEnrolled,int TOPacademicsScale,int TOPsocialScale,int TOPqualityOfLifeScale,
			
			String [] emphases){
		return this.controller.search(name,state,location,control,
				BOTnumStudents,BOTpercentFemale,BOTSATVerb,BOTSATMath,BOTexpenses,
				TOPnumStudents,TOPpercentFemale,TOPSATVerb,TOPSATMath,TOPexpenses,
				
				BOTpercentFinancialAid,BOTnumberOfApplicants,BOTpercentAdmitted,
				TOPpercentFinancialAid,TOPnumberOfApplicants,TOPpercentAdmitted,
				
				BOTpercentEnrolled,BOTacademicsScale,BOTsocialScale,BOTqualityOfLifeScale,
				TOPpercentEnrolled,TOPacademicsScale,TOPsocialScale,TOPqualityOfLifeScale
				, emphases);
	}
	
	/**
	 * gets schools most similar to s
	 * @param s school to base recs on
	 * @return schools most similar to s
	 */
	public List<School> getRecommendations(School s){
		return this.controller.getRecommendations(s);
	}
	
	
	/**
	 * @return user associated with this ui's controller
	 */
	public User getUser(){
		return controller.getUser();
	}
	
	/**
	 * updates profile for user associated with this ui and controller
	 * @param firstName
	 * @param lastName
	 * @param password
	 * @return true on success
	 */
	public boolean UpdateUser(String firstName, String lastName, String password){		//no type users editing themselves are users
	return this.controller.UpdateUser(firstName, lastName, password);
	}
	
	
	}

