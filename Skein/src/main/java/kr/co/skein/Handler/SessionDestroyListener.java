package kr.co.skein.Handler;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.session.SessionDestroyedEvent;

public class SessionDestroyListener implements ApplicationListener<SessionDestroyedEvent> {

	private static final Logger logger = LoggerFactory.getLogger(SessionDestroyListener.class);

	@Override
	public void onApplicationEvent(SessionDestroyedEvent event) {

		System.out.println("INFO : Skein-I201 - Session Destroyed(Logout)");
		
		List<SecurityContext> contexts = event.getSecurityContexts();
		if (!contexts.isEmpty()) {
			for (SecurityContext ctx : contexts) {
				Object atuh = ctx.getAuthentication().getPrincipal();
				String[] atums = atuh.toString().split(";");
				logger.info("Logout : " + atums[0]);
			}
		}
	}
}