package controllers;
import java.util.List;

import entities.*;
import interfaces.*;
/**
 * @author Megan Noah Yang Jordan
 *
 */
public class SearchController {

	private DBController database;
	/**
	 * creates new searchcontroller and initializes DBController instance
	 */
	public SearchController(){
		database = new DBController();
	}
	
	/**
	 * Searches Database for schools matching parameters
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
	 * @return
	 */
	public List<School> search(String name,String state,String location,String control,
			
			int BOTnumStudents,double BOTpercentFemale,double BOTSATVerb,double BOTSATMath,double BOTexpenses,
			int TOPnumStudents,double TOPpercentFemale,double TOPSATVerb,double TOPSATMath,double TOPexpenses,
			
			double BOTpercentFinancialAid,int BOTnumberOfApplicants,double BOTpercentAdmitted,
			double TOPpercentFinancialAid,int TOPnumberOfApplicants,double TOPpercentAdmitted,
			
			double BOTpercentEnrolled,int BOTacademicsScale,int BOTsocialScale,int BOTqualityOfLifeScale,
			double TOPpercentEnrolled,int TOPacademicsScale,int TOPsocialScale,int TOPqualityOfLifeScale,
			
			String [] emphases){
		
	
		return database.search(name,state,location,control,
				BOTnumStudents,BOTpercentFemale,BOTSATVerb,BOTSATMath,BOTexpenses,
				TOPnumStudents,TOPpercentFemale,TOPSATVerb,TOPSATMath,TOPexpenses,
				
				BOTpercentFinancialAid,BOTnumberOfApplicants,BOTpercentAdmitted,
				TOPpercentFinancialAid,TOPnumberOfApplicants,TOPpercentAdmitted,
				
				BOTpercentEnrolled,BOTacademicsScale,BOTsocialScale,BOTqualityOfLifeScale,
				TOPpercentEnrolled,TOPacademicsScale,TOPsocialScale,TOPqualityOfLifeScale
				, emphases);
	}
	
	/**
	 * gets list of schools closest to provided school
	 * @param s school recommendations will match           
	 * @return list of recommended schools related to s
	 */
	public List<School> recommendations(School s){
		return database.recommendations(s);
	}
}
