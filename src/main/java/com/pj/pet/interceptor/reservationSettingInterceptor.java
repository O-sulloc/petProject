package com.pj.pet.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.pj.pet.reservation.ReservationVO;
import com.pj.pet.service.ReservationSettingVO;
import com.pj.pet.service.ServiceService;
import com.pj.pet.user.UserVO;

@Component
public class reservationSettingInterceptor implements HandlerInterceptor{

	@Autowired
	ServiceService serviceService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("인터셉터 실행");
		boolean check = false;
		HttpSession session= request.getSession();
		UserVO userVO=(UserVO)session.getAttribute("user");
		
		ReservationSettingVO reservationSettingVO=serviceService.getReservationSettingCheck(userVO);
		
		//reservationSetting이 존재한다면 
		if(reservationSettingVO ==null) {
			System.out.println("세팅 안되어있음");
			check=true;
		}
		
		if(!check) { //check가 false면 포워드로 보내
			System.out.println("세팅 되어있음");
		//mv.addObject
		request.setAttribute("msg", "이미 등록되어 있습니다. 수정페이지로 이동합니다.");
		request.setAttribute("path", "./updateReservationSetting"); 
		
		//mv.setViewName();와 같다 
		//컨트롤러 거치지 않기 때문에 경로 전체 다 써줘야됨 
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/getResult.jsp");
		view.forward(request, response);
		}
		
		
		return check;
	}
}
