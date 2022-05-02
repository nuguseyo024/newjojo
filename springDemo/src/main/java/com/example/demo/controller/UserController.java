package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.example.demo.svc.UserSVC;
import com.example.demo.vo.UserVO;

@Controller
@SessionAttributes("user_id")
public class UserController {
	
	@Autowired
	private UserSVC userSvc;
	

	@Autowired
	private HttpSession session;
	
	// 로그인 화면
	@GetMapping("/login")
    public String login() {
		return "/user/user_login";
	}
   
	// 회원가입 화면
	@GetMapping("/join")
	public String join() {
		return "/user/user_join";
	}
   
	// 회원가입 기능
	@PostMapping("/join")
	@ResponseBody
	public String joinProcess(UserVO userVO) {
		return String.format("{\"joined\":%b}", userSvc.join(userVO));
	}
	
	// 로그인 기능
	@PostMapping("/login")
	@ResponseBody
	public String loginsuccess(UserVO userVO) {
		return String.format("{\"loginsuccess\":%b}", userSvc.login(userVO));
	}
	
	// 로그아웃
	@GetMapping("/logout")
	@ResponseBody
	public String logout(SessionStatus status) {
		return String.format("{\"logoutok\":%b}", userSvc.logout(status));
	}
	
	// 회원 정보 페이지
	@GetMapping("/user_info/{user_id}")
	public String userInfo(@PathVariable("user_id") String user_id, Model model) {
		model.addAttribute("user", userSvc.userInfo(user_id));
		return "/user/user_info";
	}
	
	// 회원 정보 수정
	@GetMapping("/user_edit/{user_id}")
	public String userEdit(@PathVariable("user_id") String user_id, Model model) {
		model.addAttribute("user", userSvc.userInfo(user_id));
		return "/user/user_edit";
	}
	
	// 회원 정보 수정 완료 페이지
	@PostMapping("/user_update")
	@ResponseBody
	public String userUpdate(UserVO userVO) {
		boolean userupdated = userSvc.userEdit(userVO);
		return String.format("{\"userupdated\":%b}", userupdated);
	}
	
	// 회원 탈퇴
	@GetMapping("/user_out/{user_id}")
	@ResponseBody
	public String userOut(@PathVariable("user_id") String user_id, SessionStatus status) {
		status.setComplete();
		return String.format("{\"userout\":%b}", userSvc.userOut(user_id));
	}
	
	// 임시 메인
	@GetMapping("/main")
	public String main() {
		return "/user/main";
	}
	
	
	
	
}