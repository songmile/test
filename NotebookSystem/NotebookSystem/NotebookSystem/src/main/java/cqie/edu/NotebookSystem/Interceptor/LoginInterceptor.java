package cqie.edu.NotebookSystem.Interceptor;

import cqie.edu.NotebookSystem.domain.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws ServletException, IOException {
        // 获取请求Url
        String url = request.getRequestURI();
        if (url.contains("/user/login")||url.contains("/customer/reg")||url.contains("/static/")){
            // 白名单放行
            return true;
        }
        // 其他请求，检查用户是否已登录
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        if (loginUser != null){
            // 已登录放行
            return true;
        }
        // 未登录跳转到登录页
        request.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(request,response);
        return false;
    }
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response
            , Object handler, Exception ex)
            throws Exception {
    }
}
