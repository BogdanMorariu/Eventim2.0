package events.authentication;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

@Component
public class Authenticate implements AuthenticationProvider{

<<<<<<< HEAD
	public Authentication authenticate(Authentication arg0) throws AuthenticationException {
=======
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
>>>>>>> bb0ed0fae3ecd17f870a724de7e8b7141611c497
		// TODO Auto-generated method stub
		return null;
	}

<<<<<<< HEAD
	public boolean supports(Class<?> arg0) {
=======
	public boolean supports(Class<?> authentication) {
>>>>>>> bb0ed0fae3ecd17f870a724de7e8b7141611c497
		// TODO Auto-generated method stub
		return false;
	}

}
