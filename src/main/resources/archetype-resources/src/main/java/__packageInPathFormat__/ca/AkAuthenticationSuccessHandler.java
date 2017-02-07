package ${package}.ca;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.transaction.annotation.Transactional;

import br.com.akula.impl.auth.SentinelaAuthenticationSuccessHelper;

public class AkAuthenticationSuccessHandler extends SentinelaAuthenticationSuccessHelper implements AuthenticationSuccessHandler{

	private static final Logger logger = LoggerFactory.getLogger(AkAuthenticationSuccessHandler.class);
	
	@Override
	@Transactional
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		logger.debug("onAuthenticationSuccess...");
		
		
	}
}