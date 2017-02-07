package ${package}.ca;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import br.com.akula.api.msg.AkulaResourceBundleMessageSource;

public class AkAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler{

	@Autowired
	private AkulaResourceBundleMessageSource akulaMessage;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request,
			HttpServletResponse response, AuthenticationException exception)
			throws IOException, ServletException {
		super.onAuthenticationFailure(request, response, exception);
		
		request.getSession().setAttribute("statusMessage", akulaMessage.getMessage("eu.login.falha"));
	}
}