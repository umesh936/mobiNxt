import com.mobingen.location.services.AddressFinder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by amitsingh on 3/20/14.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration (locations = {"classpath:META-INF/spring/location-spring.xml"})
public class AddressFinderTest {

    @Autowired
    AddressFinder addressFinder;

        @Test
        public void test1(){
       	        System.out.println("This test will be executed only in Windows XP OS");
            System.out.println(addressFinder.getAddress("28.6700", "77.4200"));

        	    }

}
