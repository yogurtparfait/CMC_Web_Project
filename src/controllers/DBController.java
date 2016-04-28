package controllers;
import java.util.ArrayList;
import java.util.List;
import dblibrary.project.csci230.*;
import entities.*;

/**
 * Controller for the Database, that includes all of the functionalities.
 * @author Noah, Megan, Jordan, Yang
 */




public class DBController { 
	
	
	private UniversityDBLibrary library;
	
	/**
	 *  Constructor for the DBController.
	 */
	public DBController() {
		this.library = new UniversityDBLibrary("yogurtparf","yogurtparf","jmny4");
	}
	
	/** unsaves the school of the user.
	 * @param u
	 * @param s
	 * @return
	 */
	public boolean unSaveSchool(User u, School s){
		int i = library.user_removeSchool(u.getUsername(),s.getName());
		if(i<1) return false;
		return true;
	}
	
	/** Adds a school to the library
	 * @param u user
	 * @param s school
	 * @return
	 */
	public boolean addSavedSchool(User u, School s){
		int i = library.user_saveSchool(u.getUsername(),s.getName());
		if(i<1) return false;
		return true;

	}

	/** Finds a person by their username.
	 * @param username
	 * @return
	 */
	public Person findByUserName(String username){
		String[][] users = library.user_getUsers();
		for(String[] currentUser:users){
			if(currentUser[2].equals(username)){
				if(currentUser[4].charAt(0)=='u'){
					User returnUser = new User();
					//System.out.println("firstname: " + currentUser[0]);
					returnUser.setFirstName(currentUser[0]);
					//System.out.println("lastname: " + currentUser[1]);
					returnUser.setLastName(currentUser[1]);
					//System.out.println("Username: " + currentUser[2]);
					returnUser.setUsername(currentUser[2]);
					//System.out.println("Password: " + currentUser[3]);
					returnUser.setPassword(currentUser[3]);
					if (currentUser[5].equals("Y")){
						returnUser.setIsActive(true);
					}
					else{
						returnUser.setIsActive(false);
					}
					returnUser.setIsAdmin(false);
					return returnUser;
				}
				else{ //isAdmin
				Admin returnAdmin = new Admin();
				//System.out.println("firstname: " + currentUser[0]);
				returnAdmin.setFirstName(currentUser[0]);
				//System.out.println("lastname: " + currentUser[1]);
				returnAdmin.setLastName(currentUser[1]);
				//System.out.println("Username: " + currentUser[2]);
				returnAdmin.setUsername(currentUser[2]);
				//System.out.println("Password: " + currentUser[3]);
				returnAdmin.setPassword(currentUser[3]);
				if (currentUser[5].equals("Y")){
					returnAdmin.setIsActive(true);
				}
				else{
					returnAdmin.setIsActive(false);
				}
				returnAdmin.setIsAdmin(true);
				return returnAdmin;
				}				
			}
		}
		return null;
	}
	
	
	/** Creates a school.
	 * @param name 
	 * @param state 
	 * @param location
	 * @param control
	 * @param numStudents
	 * @param percentFemale 
	 * @param d
	 * @param SATMath
	 * @param expenses
	 * @param percentFinancialAid
	 * @param numberOfApplicants
	 * @param percentAdmitted
	 * @param percentEnrolled
	 * @param academicsScale
	 * @param socialScale
	 * @param qualityOfLifeScale
	 * @return
	 */
	public boolean createSchool(String name,String state,String location,String control,
			int numStudents,double percentFemale,double SATVerb,double SATMath,double expenses,
			double percentFinancialAid,int numberOfApplicants,double percentAdmitted,
			double percentEnrolled,int academicsScale,int socialScale,int qualityOfLifeScale, String[] emphases){
		
		int i = library.university_addUniversity(name, state, location, control, numStudents,
				percentFemale, SATVerb, SATMath, expenses, percentFinancialAid, numberOfApplicants,
				percentAdmitted, percentEnrolled, academicsScale, socialScale, qualityOfLifeScale);
		for (String emphasis:emphases)
		{
			library.university_addUniversityEmphasis(name, emphasis);
		}
		
		if(i==-1) return false;
		return true;
		
	}
	
	/** Returns a list of the user schools.
	 * @param u User
	 * @return
	 */
	public List<School> getUserSchools(User u){
		String[][] userSchools = library.user_getUsernamesWithSavedSchools();
		String[][] schools = library.university_getUniversities();
		List<School> returnSchools = new ArrayList<School>();
		for(String[] currentUsername:userSchools){
		if(currentUsername[0].equals(u.getUsername())){
			for(String[] currentSchool:schools){
				if(currentUsername[1].equals(currentSchool[0])){
					returnSchools.add(new School(
							//name
							currentSchool[0],
							//state
							currentSchool[1],
							//location
							currentSchool[2],
							//control
							currentSchool[3],
							//numberOfStudents
							Integer.parseInt(currentSchool[4]),
							//PercentFemale
							Double.parseDouble(currentSchool[5]),
							//SATVerbal
							Double.parseDouble(currentSchool[6]),
							//SATMath
							Double.parseDouble(currentSchool[7]),
							//Expenses
							Double.parseDouble(currentSchool[8]),
							//PercentFincancialAid
							Double.parseDouble(currentSchool[9]),
							//NumberOfApplicants
							Integer.parseInt(currentSchool[10]),
							//PercentAdmitted
							Double.parseDouble(currentSchool[11]),
							//PercentEnrolled
							Double.parseDouble(currentSchool[12]),
							//AcademicsScale
							Integer.parseInt(currentSchool[13]),
							//SocialScale
							Integer.parseInt(currentSchool[14]),
							//QualityOfLife
							Integer.parseInt(currentSchool[15]),
							//Emphases
							getEmphasesForSchoolName(currentSchool[0])
							));
				}
			}
		}
		
		}
		return returnSchools;	
	}
	
	public String[] getEmphasesForSchoolName(String name){
		String[][] allEmphases = library.university_getNamesWithEmphases();
		String[] emphases = new String[5];
		int i = 0; //index to add emphasis
		for(String[] dbEmphasisEntry: allEmphases)
		{
			if ( dbEmphasisEntry[0].equals(name) && i<5)
			{
				emphases[i] = dbEmphasisEntry[1];
				i++;
			}
		}
		return emphases;
	}
	
	
	
	/** Returns list of persons that are users.
	 * @return 
	 */
	public List<Person> getPeople(){
		String[][] users = library.user_getUsers();
		List<Person> returnPersons = new ArrayList<Person>();
		for(String[] currentUser:users){
			if(currentUser[4].charAt(0)=='u'){
				User returnUser = new User();
				returnUser.setFirstName(currentUser[0]);
				returnUser.setLastName(currentUser[1]);
				returnUser.setUsername(currentUser[2]);
				returnUser.setPassword(currentUser[3]);
				if (currentUser[5].equals("Y")){
					returnUser.setIsActive(true);
				}
				else{
					returnUser.setIsActive(false);
				}
				returnUser.setIsAdmin(false);
				returnPersons.add(returnUser);
			}
			else{ //isAdmin
			Admin returnAdmin = new Admin();
			returnAdmin.setFirstName(currentUser[0]);
			returnAdmin.setLastName(currentUser[1]);
			returnAdmin.setUsername(currentUser[2]);
			returnAdmin.setPassword(currentUser[3]);
			if (currentUser[5].equals("Y")){
				returnAdmin.setIsActive(true);
			}
			else{
				returnAdmin.setIsActive(false);
			}
			returnAdmin.setIsAdmin(true);
			returnPersons.add(returnAdmin);
			}	
		}
		return returnPersons;
	}

	/** Adds a person to the user library. 
	 * @param firstName First name of person
	 * @param lastName Last name of person
	 * @param password Password of person
	 * @param username username of person
	 * @return
	 */

	public boolean addPerson(String firstName, String lastName, String password, String username, boolean isAdmin){ //assuming people are created active
		
		Person p = this.findByUserName(username);
		if(!(p==null)) {
			return false;
			
		}
		
		else{
			int i;
			
			if(isAdmin)
				i = library.user_addUser(firstName,lastName,username,password,'a');
			else
				i = library.user_addUser(firstName,lastName,username,password,'u');
			if(i<1) return false;
			
			else return true;
		}
	}
	
	/**
	 *  Checks to see if the persons account is active.
	 * @param u Person 
	 * @return
	 */
	public boolean activate(Person u){					
		char type;
		if(u.getIsAdmin()){
			type = 'a';
		}
		else{
			type = 'u';
		}
		int i = library.user_editUser(u.getUsername(),u.getFirstName(),u.getLastName(),u.getPassword()
				,type,'Y');
		if(i==-1) return false;
		else return true;
	
	}
	

	/** Updates the person info
	 * @param person
	 * @param firstName
	 * @param lastName
	 * @param password
	 * @return
	 */
	public boolean updatePerson(Person person,String firstName, String lastName, String password, boolean isAdmin, boolean isActive){	//Make sure isAdmin and isActive are correctly managed
		int i = -1;
		char type;
		char ActiveState;
		if(isAdmin){
			type = 'a';
		}
		else{
			type= 'u';
		}
		if(isActive){
			ActiveState = 'Y';
		}
		else{
			ActiveState = 'N';
		}
		i = library.user_editUser(person.getUsername(),firstName,lastName,password,type,ActiveState);
		if(i<1) return false;
		else return true;
	}
	
	//for steal
	/** Logouts the person.
	 * @param p
	 * @return
	 */
	public boolean logOut(Person p){
	//TODO
		return true;
	}
	
	
	/** Updates the school.
	 * @param s
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
	public boolean updateSchool(School s, String name,String state,String location,String control,		//being phased out for emphases version
			int numStudents,double percentFemale,double SATVerb,double SATMath,double expenses,
			double percentFinancialAid,int numberOfApplicants,double percentAdmitted,
			double percentEnrolled,int academicsScale,int socialScale,int qualityOfLifeScale){
		
		int i = library.university_editUniversity(name, state, location, control, numStudents, 
				percentFemale, SATVerb, SATMath, expenses, percentFinancialAid, numberOfApplicants, 
				percentAdmitted, percentEnrolled, academicsScale, socialScale, qualityOfLifeScale);
		
		if(i<1) return false;
		
		
		return true;
	}	
	
	//Override with emphases:
	public boolean updateSchool(School s, String name,String state,String location,String control,
			int numStudents,double percentFemale,double SATVerb,double SATMath,double expenses,
			double percentFinancialAid,int numberOfApplicants,double percentAdmitted,
			double percentEnrolled,int academicsScale,int socialScale,int qualityOfLifeScale, String[] emphases){
		
		int i = library.university_editUniversity(name, state, location, control, numStudents, 
				percentFemale, SATVerb, SATMath, expenses, percentFinancialAid, numberOfApplicants, 
				percentAdmitted, percentEnrolled, academicsScale, socialScale, qualityOfLifeScale);
		
		if(i<1) return false;
		
		String[] oldEmphases = getEmphasesForSchoolName(s.getName());
		for(String oldE : oldEmphases)
		{
			library.university_removeUniversityEmphasis(name, oldE);		//delete old to make room for new
		}
		
		for(String e:emphases)
		{
			library.university_addUniversityEmphasis(name,e);
		}	
		return true;
	}	
	
	/** Deactivates a person.
	 * @param p
	 * @return
	 */
	public boolean deactivate(Person p){			//double check integration with Person.isActive 
		char type;
		if (p.getIsAdmin())
		{
			type = 'a';
		}
		else{
			type = 'u';							
		}
		int i = library.user_editUser(p.getUsername(),p.getFirstName(),p.getLastName(),p.getPassword(),type,'N');
		if(i==-1) return false;
		else return true;
	}
	
	/** Returns a list of schools 
	 * @return
	 */
	public List<School> getSchools(){
		String[][] schools = library.university_getUniversities();
		List<School> returnSchools = new ArrayList<School>();
			for(String[] currentSchool:schools){
					returnSchools.add(new School(
							//Fix all these parameter types
							//name
							currentSchool[0],
							//state
							currentSchool[1],
							//location
							currentSchool[2],
							//control
							currentSchool[3],
							//numberOfStudents
							Integer.parseInt(currentSchool[4]),
							//PercentFemale
							Double.parseDouble(currentSchool[5]),
							//SATVerbal
							Double.parseDouble(currentSchool[6]),
							//SATMath
							Double.parseDouble(currentSchool[7]),
							//Expenses
							Double.parseDouble(currentSchool[8]),
							//PercentFincancialAid
							Double.parseDouble(currentSchool[9]),
							//NumberOfApplicants
							Integer.parseInt(currentSchool[10]),
							//PercentAdmitted
							Double.parseDouble(currentSchool[11]),
							//PercentEnrolled
							Double.parseDouble(currentSchool[12]),
							//AcademicsScale
							Integer.parseInt(currentSchool[13]),
							//SocialScale
							Integer.parseInt(currentSchool[14]),
							//QualityOfLife
							Integer.parseInt(currentSchool[15]),
							//Emphases
							getEmphasesForSchoolName(currentSchool[0])
							));
			}
		return returnSchools;
		}
		
	/** Searchs for a school by name.
	 * @param name
	 * @return
	 */
	public School findBySchoolName(String name){
		String[][] schools = library.university_getUniversities();
		for(String[] currentSchool:schools){
		if(currentSchool[0].equals(name)) 
			return new School(
					//name
					currentSchool[0],
					//state
					currentSchool[1],
					//location
					currentSchool[2],
					//control
					currentSchool[3],
					//numberOfStudents
					Integer.parseInt(currentSchool[4]),
					//PercentFemale
					Double.parseDouble(currentSchool[5]),
					//SATVerbal
					Double.parseDouble(currentSchool[6]),
					//SATMath
					Double.parseDouble(currentSchool[7]),
					//Expenses
					Double.parseDouble(currentSchool[8]),
					//PercentFincancialAid
					Double.parseDouble(currentSchool[9]),
					//NumberOfApplicants
					Integer.parseInt(currentSchool[10]),
					//PercentAdmitted
					Double.parseDouble(currentSchool[11]),
					//PercentEnrolled
					Double.parseDouble(currentSchool[12]),
					//AcademicsScale
					Integer.parseInt(currentSchool[13]),
					//SocialScale
					Integer.parseInt(currentSchool[14]),
					//QualityOfLife
					Integer.parseInt(currentSchool[15]),
					//Emphases
					getEmphasesForSchoolName(currentSchool[0])
					);
			
		}
		return null;
	}


	/** Searchs for a school by name. 
	 * @param name
	 * @return
	 */
	public School getSchoolByName(String name){
		String[][] schools = library.university_getUniversities();
		for(String[] currentSchool:schools){
			if(currentSchool[0].equals(name))
				return new School(
						//Fix all these parameter types
						//name
						currentSchool[0],
						//state
						currentSchool[1],
						//location
						currentSchool[2],
						//control
						currentSchool[3],
						//numberOfStudents
						Integer.parseInt(currentSchool[4]),
						//PercentFemale
						Double.parseDouble(currentSchool[5]),
						//SATVerbal
						Double.parseDouble(currentSchool[6]),
						//SATMath
						Double.parseDouble(currentSchool[7]),
						//Expenses
						Double.parseDouble(currentSchool[8]),
						//PercentFincancialAid
						Double.parseDouble(currentSchool[9]),
						//NumberOfApplicants
						Integer.parseInt(currentSchool[10]),
						//PercentAdmitted
						Double.parseDouble(currentSchool[11]),
						//PercentEnrolled
						Double.parseDouble(currentSchool[12]),
						//AcademicsScale
						Integer.parseInt(currentSchool[13]),
						//SocialScale
						Integer.parseInt(currentSchool[14]),
						//QualityOfLife
						Integer.parseInt(currentSchool[15]),
						//Emphases
						getEmphasesForSchoolName(currentSchool[0])
						);
		}
		return null;
	}
	
	/** Search method. 
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
			
			String [] emphases)
	{
	
		String[][] currentEmphases;
		boolean emphasesEqual = true;
		boolean emphasisFound = false;
		String[][] schools = library.university_getUniversities();
		List<School> returnSchools = new ArrayList<School>();
		

		for(String[] currentSchool:schools)
		{
			currentEmphases = library.university_getNamesWithEmphases();
			
			//Checks Emphases
			for(String t:emphases)
			{
				for(String[] s:currentEmphases)
				{
					if(((s[0].equals(name))&&(s[1].equals(t)))||t=="")
					{
						emphasisFound = true;
					}	
				}
				if(emphasisFound) 
					emphasesEqual = true;
				else
				{
					emphasesEqual = false;
					break;
				}
			}
			
			
			if(
						//name
						(currentSchool[0].contains(name) || name.equals("")) &&
						//state
						(currentSchool[1].contains(state) || state.equals("")) &&
						//location
						(currentSchool[2].contains(location) || location.equals("")) &&
						//control
						(currentSchool[3].contains(control) || control.equals("")) &&
						//numberOfStudents
						(((BOTnumStudents<=Integer.parseInt(currentSchool[4])&&Integer.parseInt(currentSchool[4])<=TOPnumStudents))|| 
								TOPnumStudents==-1) &&
						//PercentFemale
						((BOTpercentFemale<=(Double.parseDouble(currentSchool[5]))&&(Double.parseDouble(currentSchool[5])<=TOPpercentFemale))|| 
								TOPnumStudents==-1) &&
						//SATVerbal
						((BOTSATVerb<=(Double.parseDouble(currentSchool[6]))&&(Double.parseDouble(currentSchool[6])<=TOPSATVerb))|| 
								TOPnumStudents==-1) &&
						//SATMath
						((BOTSATMath<=(Double.parseDouble(currentSchool[7]))&&(Double.parseDouble(currentSchool[7])<=TOPSATMath))|| 
								TOPnumStudents==-1) &&
						//Expenses
						((BOTexpenses<=(Double.parseDouble(currentSchool[8]))&&(Double.parseDouble(currentSchool[8])<=TOPexpenses))|| 
								TOPnumStudents==-1) &&
						//PercentFincancialAid
						((BOTpercentFinancialAid<=(Double.parseDouble(currentSchool[9]))&&(Double.parseDouble(currentSchool[9])<=TOPpercentFinancialAid))|| 
								TOPnumStudents==-1) &&
						//NumberOfApplicants
						(((BOTnumberOfApplicants<=Integer.parseInt(currentSchool[10])&&Integer.parseInt(currentSchool[10])<=TOPnumberOfApplicants))|| 
								TOPnumStudents==-1) &&
						//PercentAdmitted
						((BOTpercentAdmitted<=(Double.parseDouble(currentSchool[11]))&&(Double.parseDouble(currentSchool[11])<=TOPpercentAdmitted))|| 
								TOPnumStudents==-1) &&
						//PercentEnrolled
						((BOTpercentEnrolled<=(Double.parseDouble(currentSchool[12]))&&(Double.parseDouble(currentSchool[12])<=TOPpercentEnrolled))|| 
								TOPnumStudents==-1) &&
						//AcademicsScale
						(((BOTacademicsScale<=Integer.parseInt(currentSchool[13])&&Integer.parseInt(currentSchool[13])<=TOPacademicsScale))|| 
								TOPnumStudents==-1) &&
						//SocialScale
						(((BOTsocialScale<=Integer.parseInt(currentSchool[14])&&Integer.parseInt(currentSchool[14])<=TOPsocialScale))|| 
								TOPnumStudents==-1) &&
						//QualityOfLife
						(((BOTqualityOfLifeScale<=Integer.parseInt(currentSchool[15])&&Integer.parseInt(currentSchool[15])<=TOPqualityOfLifeScale))|| 
								TOPnumStudents==-1) &&
						//Emphases
						emphasesEqual)
						
			
			{
				

				returnSchools.add(new School(
						//name
						currentSchool[0],
						//state
						currentSchool[1],
						//location
						currentSchool[2],
						//control
						currentSchool[3],
						//numberOfStudents
						Integer.parseInt(currentSchool[4]),
						//PercentFemale
						Double.parseDouble(currentSchool[5]),
						//SATVerbal
						Double.parseDouble(currentSchool[6]),
						//SATMath
						Double.parseDouble(currentSchool[7]),
						//Expenses
						Double.parseDouble(currentSchool[8]),
						//PercentFincancialAid
						Double.parseDouble(currentSchool[9]),
						//NumberOfApplicants
						Integer.parseInt(currentSchool[10]),
						//PercentAdmitted
						Double.parseDouble(currentSchool[11]),
						//PercentEnrolled
						Double.parseDouble(currentSchool[12]),
						//AcademicsScale
						Integer.parseInt(currentSchool[13]),
						//SocialScale
						Integer.parseInt(currentSchool[14]),
						//QualityOfLife
						Integer.parseInt(currentSchool[15]),
						//Emphases
						getEmphasesForSchoolName(currentSchool[0])
						));
			}
		}
		return returnSchools;
	}
			
		

	
	
	/** Returns a list of schools(recommended)
	 * @param s
	 * @return
	 */
	public List<School> recommendations(School s){
		String[][] schools = library.university_getUniversities();
		List<School> returnSchools = new ArrayList<School>();
		School[] schoolList = new School[1000];
		double[] searchVector = new double[16];
		double[] foundVector = new double[200];
		
		//Initializes vectors to a high value, so the empty values aren't returned:
		for(int x = 0;x<foundVector.length;x++)
		{
			foundVector[x] = 100;
		}
		
		double total = 0;
		School holder; //placeholder for sorting, total is used for the doubles.
		int counter = 0;
		
			//calculates the difference vector
		for(String[] currentSchool:schools)
		{
				
			//name
					if(currentSchool[0].equals(s.getName())) 
						searchVector[0] = 0;
					else 
						searchVector[0] = 1;
			//state
					if(currentSchool[1].equals(s.getState())) 
						searchVector[1] = 0;
					else 
						searchVector[1] = 1;
			//location
					if(currentSchool[2].equals(s.getLocation())) 
						searchVector[2] = 0;
					else 
						searchVector[2] = 1;
			//control
					if(currentSchool[3].equals(s.getName())) 
						searchVector[3] = 0;
					else 
						searchVector[3] = 1;
			//numberOfStudents
					if(s.getNumStudents()==-1) 
						searchVector[4] = 0; 
					else
						searchVector[4] = Math.abs(Double.parseDouble(currentSchool[4]) - s.getNumStudents())/s.getNumStudents();
			//PercentFemale
					if(s.getPercentFemale()==-1||Double.parseDouble(currentSchool[5])==-1) 
						searchVector[5] = 0; 
					else
						searchVector[5] = Math.abs(Double.parseDouble(currentSchool[5]) - s.getPercentFemale())/s.getPercentFemale();
			//SATVerbal
					if(s.getSATVerb()==-1||Double.parseDouble(currentSchool[6])==-1) 
						searchVector[6] = 0; 
					else
						searchVector[6] = Math.abs(Double.parseDouble(currentSchool[6]) - s.getSATVerb())/s.getSATVerb();
			//SATMath
					if(s.getSATMath()==-1||Double.parseDouble(currentSchool[7])==-1) 
						searchVector[7] = 0; 
					else
						searchVector[7] = Math.abs(Double.parseDouble(currentSchool[7]) - s.getSATMath())/s.getSATMath();
			//Expenses
					if(s.getExpenses()==-1||Double.parseDouble(currentSchool[8])==-1) 
						searchVector[8] = 0; 
					else
						searchVector[8] = Math.abs(Double.parseDouble(currentSchool[8]) - s.getExpenses())/s.getExpenses();
			//PercentFincancialAid
					if(s.getPercentFinancialAid()==-1||Double.parseDouble(currentSchool[9])==-1) 
						searchVector[9] = 0; 
					else
						searchVector[9] = Math.abs(Double.parseDouble(currentSchool[9]) - s.getPercentFinancialAid())/s.getPercentFinancialAid();
			//NumberOfApplicants
					if(s.getNumberOfApplicants()==-1||Double.parseDouble(currentSchool[10])==-1) 
						searchVector[10] = 0; 
					else
						searchVector[10] = Math.abs(Double.parseDouble(currentSchool[10]) - s.getNumberOfApplicants())/s.getNumberOfApplicants();
			//PercentAdmitted
					if(s.getPercentAdmitted()==-1||Double.parseDouble(currentSchool[11])==-1) 
						searchVector[11] = 0; 
					else
						searchVector[11] = Math.abs(Double.parseDouble(currentSchool[11]) - s.getPercentAdmitted())/s.getPercentAdmitted();
			//PercentEnrolled
					if(s.getPercentEnrolled()==-1||Double.parseDouble(currentSchool[12])==-1) 
						searchVector[12] = 0; 
					else
						searchVector[12] = Math.abs(Double.parseDouble(currentSchool[12]) - s.getPercentEnrolled())/s.getPercentEnrolled();
			//AcademicsScale
					if(s.getAcademicsScale()==-1||Double.parseDouble(currentSchool[13])==-1) 
						searchVector[13] = 0; 
					else
						searchVector[13] = Math.abs(Double.parseDouble(currentSchool[13]) - s.getAcademicsScale())/s.getAcademicsScale();
			//SocialScale
					if(s.getSocialScale()==-1||Double.parseDouble(currentSchool[14])==-1) 
						searchVector[14] = 0; 
					else
						searchVector[14] = Math.abs(Double.parseDouble(currentSchool[14]) - s.getSocialScale())/s.getSocialScale();
			//QualityOfLife
					if((s.getQualityOfLifeScale()==-1)||Double.parseDouble(currentSchool[15])==-1) 
						searchVector[15] = 0; 
					else
						searchVector[15] = Math.abs(Double.parseDouble(currentSchool[15]) - s.getQualityOfLifeScale())/s.getQualityOfLifeScale();
	
					total = 0;
					for(double d:searchVector)
					{
						total = total + d;
					}
					foundVector[counter] = total;
					
					schoolList[counter++] = (new School(
							//name
							currentSchool[0],
							//state
							currentSchool[1],
							//location
							currentSchool[2],
							//control
							currentSchool[3],
							//numberOfStudents
							Integer.parseInt(currentSchool[4]),
							//PercentFemale
							Double.parseDouble(currentSchool[5]),
							//SATVerbal
							Double.parseDouble(currentSchool[6]),
							//SATMath
							Double.parseDouble(currentSchool[7]),
							//Expenses
							Double.parseDouble(currentSchool[8]),
							//PercentFincancialAid
							Double.parseDouble(currentSchool[9]),
							//NumberOfApplicants
							Integer.parseInt(currentSchool[10]),
							//PercentAdmitted
							Double.parseDouble(currentSchool[11]),
							//PercentEnrolled
							Double.parseDouble(currentSchool[12]),
							//AcademicsScale
							Integer.parseInt(currentSchool[13]),
							//SocialScale
							Integer.parseInt(currentSchool[14]),
							//QualityOfLife
							Integer.parseInt(currentSchool[15]),
							//Emphases
							getEmphasesForSchoolName(currentSchool[0])
							));
		
		}
		
	
		//Found vector now has distances for each school.
		//to find the closest five:

		for(int i = 0;i<foundVector.length-1;i++)
		{
			for(int j = 0;j<foundVector.length;j++)
			{
				if(foundVector[i]<foundVector[0]){
					total = foundVector[0];
					holder = schoolList[0];
					foundVector[0] = foundVector[i];
					schoolList[0] = schoolList[i];
					foundVector[i] = foundVector[5];
					schoolList[i] = schoolList[5];
					foundVector[5] = foundVector[4];
					schoolList[5] = schoolList[4];
					foundVector[4] = foundVector[3];
					schoolList[4] = schoolList[3];
					foundVector[3] = foundVector[2];
					schoolList[3] = schoolList[2];
					foundVector[2] = foundVector[1];
					schoolList[2] = schoolList[1];
					foundVector[1] = total;
					schoolList[1] = holder;
				}
				else if(foundVector[i]<foundVector[1]){
					total = foundVector[1];
					holder = schoolList[1];
					foundVector[1] = foundVector[i];
					schoolList[1] = schoolList[i];
					foundVector[i] = foundVector[5];
					schoolList[i] = schoolList[5];
					foundVector[5] = foundVector[4];
					schoolList[5] = schoolList[4];
					foundVector[4] = foundVector[3];
					schoolList[4] = schoolList[3];
					foundVector[3] = foundVector[2];
					schoolList[3] = schoolList[2];
					foundVector[2] = total;
					schoolList[2] = holder;
				}
				else if(foundVector[i]<foundVector[2]){
					total = foundVector[2];
					holder = schoolList[2];
					foundVector[2] = foundVector[i];
					schoolList[2] = schoolList[i];
					foundVector[i] = foundVector[5];
					schoolList[i] = schoolList[5];
					foundVector[5] = foundVector[4];
					schoolList[5] = schoolList[4];
					foundVector[4] = foundVector[3];
					schoolList[4] = schoolList[3];
					foundVector[3] = total;
					schoolList[3] = holder;
				}
				else if(foundVector[i]<foundVector[3]){
					total = foundVector[3];
					holder = schoolList[3];
					foundVector[3] = foundVector[i];
					schoolList[3] = schoolList[i];
					foundVector[i] = foundVector[5];
					schoolList[i] = schoolList[5];
					foundVector[5] = foundVector[4];
					schoolList[5] = schoolList[4];
					foundVector[4] = total;
					schoolList[4] = holder;
				}
				else if(foundVector[i]<foundVector[4]){
					total = foundVector[4];
					holder = schoolList[4];
					foundVector[4] = foundVector[i];
					schoolList[4] = schoolList[i];
					foundVector[i] = foundVector[5];
					schoolList[i] = schoolList[5];
					foundVector[5] = total;
					schoolList[5] = holder;
				}
				else if(foundVector[i]<foundVector[5]){
					total = foundVector[5];
					holder = schoolList[5];
					foundVector[5] = foundVector[i];
					schoolList[5] = schoolList[i];
					foundVector[i] = total;
					schoolList[i] = holder;
				}
			}
		}
		//schoolList is now sorted shortest to longest.
		//doesn't return school at spot 1, since the closest school is always itself.
		for(int i = 1;i<6;i++){
			returnSchools.add(schoolList[i]);
		}
		
		return returnSchools;
		
	}
	
	
	public boolean deleteSchool(String schoolName){
		int i = library.university_deleteUniversity(schoolName);
		if(i==-1) return false;
		
		String[][] emphases = library.university_getNamesWithEmphases();
		for (String[] emphasis : emphases)
		{
			if (emphasis[0].equals(schoolName))
			{
				library.university_removeUniversityEmphasis(schoolName, emphasis[1]);
			}
		}
		
		return true;
	}
	public boolean deletePerson(String username){
		int i = library.user_deleteUser(username);
		if(i==-1) return false;
		return true;
	}
}
