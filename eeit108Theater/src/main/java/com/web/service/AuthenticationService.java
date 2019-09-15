package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.stereotype.Service;

import com.web.dao.EmployeeDao;
import com.web.entity.EmployeeBean;

@Service
public class AuthenticationService implements AuthenticationProvider {

	@Autowired
	private EmployeeDao employeeDao;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String email = authentication.getName();
		String password = authentication.getCredentials().toString();
		EmployeeBean eb = employeeDao.getEmployeeByEmailPassword(email, password);
		System.out.println("email:"+email);
		System.out.println("password:"+password);
		System.out.println(eb);
		if (eb != null) {

			String Permission=Integer.toString(eb.getPermission());
			String[] PermissionArr=new String[1];
			PermissionArr[0]=Permission;
			System.out.println("PermissionArr for this employee is:"+PermissionArr);
			//Object Permission = employeeDao.getPermissionByEmpEmail(email);
//			if (Permission!=null) {
//				String[] PermissionArr = new String[PermissionList.size()];
//				for (int i = 0; i < PermissionList.size(); i++) {
//					Integer a = PermissionList.get(0).getPermission();
//					String b = Integer.toString(a);
//					PermissionArr[i] = b;
//					System.out.println("Permission for this employee is:"+b);
//				}
				List<GrantedAuthority> grantedAuthority = AuthorityUtils.createAuthorityList(Permission);
				System.out.println("grantedAuthority for this employee is:"+grantedAuthority);
				return new UsernamePasswordAuthenticationToken(email, password, grantedAuthority);
			
		}
		return null;

	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
