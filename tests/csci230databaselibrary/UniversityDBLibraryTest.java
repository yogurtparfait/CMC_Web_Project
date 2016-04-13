package csci230databaselibrary;

import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import dblibrary.project.csci230.*;

public class UniversityDBLibraryTest {
	
	UniversityDBLibrary library;
	@Before
	public void setUp() throws Exception {
		library = new UniversityDBLibrary("yogurtparf","yogurtparf","jmny4");
	}

	@Test
	public void testUniversityDBLibrary() {
		fail("Not yet implemented");
	}

	@Test
	public void testUser_getUsers() {
		String[][] users = library.user_getUsers();
		Assert.assertTrue("users are not null", users != null);
	}

	@Test
	public void testUser_addUser() {
		fail("Not yet implemented");
	}

	@Test
	public void testUser_editUser() {
		fail("Not yet implemented");
	}

	@Test
	public void testUser_deleteUser() {
		fail("Not yet implemented");
	}

	@Test
	public void testUser_getUsernamesWithSavedSchools() {
		fail("Not yet implemented");
	}

	@Test
	public void testUser_saveSchool() {
		fail("Not yet implemented");
	}

	@Test
	public void testUser_removeSchool() {
		fail("Not yet implemented");
	}

	@Test
	public void testUniversity_getUniversities() {
		fail("Not yet implemented");
	}

	@Test
	public void testUniversity_getEmphases() {
		fail("Not yet implemented");
	}

	@Test
	public void testUniversity_getNamesWithEmphases() {
		fail("Not yet implemented");
	}

	@Test
	public void testUniversity_addUniversity() {
		fail("Not yet implemented");
	}

	@Test
	public void testUniversity_editUniversity() {
		fail("Not yet implemented");
	}

	@Test
	public void testUniversity_addUniversityEmphasis() {
		fail("Not yet implemented");
	}

	@Test
	public void testUniversity_removeUniversityEmphasis() {
		fail("Not yet implemented");
	}

	@Test
	public void testUniversity_deleteUniversity() {
		fail("Not yet implemented");
	}

}
