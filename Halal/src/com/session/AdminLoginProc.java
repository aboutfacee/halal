
package com.session;
 
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.util.StringUtil;

import front.vo.MemberVO;

public class AdminLoginProc {

//	@Autowired
//	private SqlSession sqlSession;

	public	boolean setSession	(HttpServletRequest	req, String	inId, String inPwd, SqlSession sqlSession) throws IOException {
		boolean flag  = false;
		MemberVO paramVo = new MemberVO();
		paramVo.setEmail(inId);
		paramVo.setPwd(inPwd);
		MemberVO memberVO = sqlSession.selectOne("member.memberLogin", paramVo);
		
		if (memberVO != null){
			
			HttpSession	session = req.getSession( true );
			session.setMaxInactiveInterval(60*60*10);
			session.setAttribute("USERINFO", memberVO);
			
			System.out.println("memberVO======="+memberVO);
			System.out.println("getLogin_id()======="+memberVO.getEmail());
			System.out.println("getLogin_pwd()======="+memberVO.getPwd());
			System.out.println("userinfo======="+session.getAttribute("USERINFO"));
			
			
			if(!StringUtil.nvl(memberVO.getEmail()).equals("")){
				flag = true;
			}
		}
		
		return flag;
		
	}
	
	public static boolean isLogined(HttpServletRequest request) {
		try {
			
			Object obj = request.getSession(false).getAttribute("ADMININFO");
			if(obj == null) {
				return false;
			} else {
				if(obj instanceof MemberVO) {
					
				} else {
					return false;
				}
			}
		} catch (Exception e) {
			return false;
		}
		return true;
	}

}
