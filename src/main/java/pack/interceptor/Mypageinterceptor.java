package pack.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

@Configuration
public class Mypageinterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("1단계 작동");
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		System.out.println("session 값 : " + member_id);
		
		String requestUrl = request.getRequestURL().toString();

		System.out.println("url 값 :" + requestUrl);
		
		if(member_id == null) {
			System.out.println("2단계 작동");
			response.sendRedirect("/shopmemberloginform");
			return false;
		}
			
		System.out.println("문제가 있다구요?");
		return true;
		
	}

}
