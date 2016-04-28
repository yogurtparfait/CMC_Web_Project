package cmcControllerTests;

import static org.junit.Assert.*;

import org.junit.Before;

import dblibrary.project.csci230.*;
import org.junit.Test;
import  controllers.DBController;

public class EmphasesTest {
	UniversityDBLibrary library;
	DBController dbController;
	
	@Before
	public void before()
	{
		library = new UniversityDBLibrary("yogurtparf","yogurtparf","jmny4");
		dbController = new DBController();
	}
	
	@Test
	public void printAllEmphasesWithNames() {
		String[][] emphases = library.university_getNamesWithEmphases();
		System.out.println("emphasis number " + emphases.length);
		for (String[]emphasis:emphases)
		{
			for(String part : emphasis)
			{
				System.out.print(part + ",");
			}
			System.out.println("***");
			
		}
		
		
	}
	
	@Test
	public void printEmphasisOfAugsburg() {
		System.out.println("Emphases of Augsburg:");
		String[] emphases = dbController.getEmphasesForSchoolName("YALE");
		for(String emphasis : emphases)
		{
			System.out.println(emphasis);
		}
	}
	
	
	//@Test
	public void printPossibleEmphases()
	{
		String[][] emphases = library.university_getEmphases();
		for (String[] emphasis: emphases)
		{
			System.out.println("*");
			for (String part: emphasis)
				System.out.print(part + ",");
			System.out.println("");
		}
	}
	
	
	//@Test
	public void addEmphasis()
	{
		library.university_removeUniversityEmphasis("ADELPHI", "painting");
		printAllEmphasesWithNames();
	}
	


}
