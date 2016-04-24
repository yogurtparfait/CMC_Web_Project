package cmcControllerTests;

import static org.junit.Assert.*;


	import entities.*;
import junit.framework.Assert;
import controllers.*;
	import org.junit.Before;
	import org.junit.Test;

	public class AdminControllerTest {
		Admin a;
		AdminController controller;
		
		@Before
		public void setUp() throws Exception {
			a = new Admin();
			controller = new AdminController(a);
		}
		
		@Test
		public void testConstructor() {
			assertTrue("AdminController's controller works",!(controller==null));
		}
		
		@Test
		public void testAddPerson(){

			assertTrue("controller is an admin", controller.addPerson("firstName", "lastName", "password", "username", true)==false);
			assertTrue("controller is an admin", controller.addPerson("firstName", "lastName", "password", "username", false)==false);
			assertFalse("controller is an admin", controller.addPerson("firstName", "lastName", "password", "username", false)==true);
		}	
		
		public void testGetPersonByUsername(){
			Person person = controller.getPersonByUsername("bStrong");
		    assertTrue("Person is not null", (person!=null));
		    assertTrue("Person has the correct username", person.getUsername().equals("bStrong"));	
		}

		public void testActivateDeactivate(){
			Person person = controller.getPersonByUsername("bStrong");
			boolean isActiveOriginally = person.getIsActive();
			controller.changeStatus(person);
			Person changed = controller.getPersonByUsername("bStrong");
			assertTrue("Status changed in DB", isActiveOriginally = (!(changed.getIsActive())));
			assertTrue("Status changed", isActiveOriginally=(!(person.getIsActive())));
			controller.changeStatus(person);
			Person changedBack = controller.getPersonByUsername("bStrong");
			assertTrue("Status changed in DB", isActiveOriginally = (!(changedBack.getIsActive())));
			assertTrue("Status back to previous", isActiveOriginally == person.getIsActive());

		}

	}


