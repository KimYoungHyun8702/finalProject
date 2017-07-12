package com.mugs.security.provider;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.mugs.dao.AuthoritiesDao;
import com.mugs.dao.UsersDao;
import com.mugs.vo.Authorities;
import com.mugs.vo.Users;


@Component
/*
 * Spring Security 컨테이너가 사용자 인증 처리(로그인 처리)할 때 호출할 클래스
 * 		=> AuthenticationProvider
 * 구현 : AuthenticationProvider를 implements한 후 메소드를 overriding (authenticate() 메소드)
 */
public class UserAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private AuthoritiesDao dao;
	@Autowired
	private UsersDao uDao;
	@Autowired
	private PasswordEncoder encoder;	//org.springframework.security.crypto.password.PasswordEncoder로 import
										//문자열을 암호화 - encode()
										//문자열과 암호화된 문자열을 비교 - matches(비교대상 문자열, 암호화된 문자열) : boolean
	
	/*
		Authentication 객체 : 한 사용자의 인증/권한 정보를 가지는 객체 (=VO)
			- 매개변수 authentication : 로그인 처리시 사용할 아이디와 비밀번호를 제공 (로그인 시 사용자가 입력한 정보들)
			- 리턴 타입 authentication : 로그인 처리가 끝나고 로그인 한 사용자의 정보를 담아 리턴할 때 사용
		    인증 실패 : Exception을 던짐
		   		  return null 
				  (Spring Security 컨테이너가 인증실패로 처리해서 /login_form.do(authentication-failure-url로 지정된 url)로 이동)

	 	GrantedAuthority - 권한 정보 하나를 저장하는 객체
	*/
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {	
																			//2가지 Exception 존재 
																			//1.계정정보 관련 = UsernameNotFoundException
																			//2.패스워드 관련 = BadCredentialsException
		//ID 체크
		String id = authentication.getName();	//사용자가 입력한 ID
		Users user = uDao.selectUsersById(id);
		if(user == null) {	//ID가 없는 경우 => 로그인 실패
			throw new UsernameNotFoundException("ID를 확인하세요.");
		}
		
		//Password 체크
		String password = (String)authentication.getCredentials();	//사용자가 입력한 Password - 리턴 타입이 Object이기에 형변환 필요
		//if(password.equals(user.getUserPassword())){}	//사용자가 입력한 패스워드는 암호화되서 저장되기 때문에 단순히 문자열이 같은지를 비교하면 안됨
		//동준이형 학생 등록되면 적용시킴.
		if(!encoder.matches(password, user.getUsersPassword())) {//패스워드가 틀린 경우
			throw new BadCredentialsException("패스워드를 확인하세요.");
		}
		
		//인증 성공
		
		//권한 조회
		Authorities auth = dao.selectAuthoritiesByUserId(id);
		if(auth == null) {
			//모든 인증된 사용자는 권한이 있어야 하는 경우는 권한 개수 체크 후 권한이 없으면 예외 발생시킴 (권한이 없는 사용자도 있을 경우 생략)
			throw new UsernameNotFoundException("권한이 없는 사용자입니다.");
		}
		List<SimpleGrantedAuthority> authList = new ArrayList<>();
		authList.add(new SimpleGrantedAuthority(auth.getAuthoritiesRole()));
		
		return new UsernamePasswordAuthenticationToken(user, null, authList);	
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.isAssignableFrom(UsernamePasswordAuthenticationToken.class);
	}
	
}
