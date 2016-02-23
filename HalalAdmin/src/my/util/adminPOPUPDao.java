package my.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class adminPOPUPDao {
	//Popup List 가져옴
		public ArrayList<adminVo> popupInfo(){
			ArrayList<adminVo> list = new ArrayList<adminVo>();
			Connection conn=null;
			PreparedStatement ps = null;
			ResultSet rs=null;
			try{
				conn = Conn.getConnection();
				String sql = "select * from aboutfacee.TB_POPUP where del_yn=0";	//삭제 인자가 0 인 것 중에 가져옴(1: 삭제)
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()){
					adminVo vo = new adminVo();
					vo.setPopupTitle(rs.getString("popup_title"));
					vo.setPopupImg(rs.getString("popup_img"));
					list.add(vo);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(rs, ps, conn);
			}
			return list;
		}
		//PopUp 개수 체크(2개 이상인지 체크하기 위해 정보 파싱)
		public int popupChk(){
			Connection conn=null;
			PreparedStatement ps = null;
			ResultSet rs=null;
			int res = 0;
			try{
				conn = Conn.getConnection();
				String sql = "select count(*) from aboutfacee.TB_POPUP where del_yn=0";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();

				if(rs.next()){
					res=rs.getInt(1);
				}



			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(rs, ps, conn);
			}
			return res;
		}
		//Title로 Popup Img Link 확인
		public String findPopupImg(String title){
			String img= null;
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			try{
				conn = Conn.getConnection();
				String sql = "select popup_img from aboutfacee.TB_POPUP where popup_title=?"; 

				ps = conn.prepareStatement(sql);
				ps.setString(1, title);
				rs = ps.executeQuery();
				while(rs.next()){
					img = rs.getString("popup_img");
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(rs, ps, conn);
			}
			return img;
		}


		//팝업 새로 넣기
		public int insertPopup(String title, String img){
			int rst = 0;
			Connection conn = null;
			PreparedStatement ps = null;
			try{
				conn = Conn.getConnection();
				String sql = "insert into aboutfacee.TB_POPUP values(null,?,?,0)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, title);
				ps.setString(2, img);
				rst = ps.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(ps, conn);
			}
			return rst;
		}
		//팝업 수정
		public int updatePopup(String pre_title, String title, String img){
			int rst = 0;
			Connection conn = null;
			PreparedStatement ps = null;
			try{
				conn = Conn.getConnection();
				String sql = "UPDATE aboutfacee.TB_POPUP SET popup_title=?, popup_img=? WHERE popup_title=?;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, title);
				ps.setString(2, img);
				ps.setString(3, pre_title);
				rst = ps.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(ps, conn);
			}
			return rst;
		}

		//팝업 제거
		public int removePopup(String title){
			int rst = 0;
			Connection conn = null;
			PreparedStatement ps = null;
			try{
				conn = Conn.getConnection();
				String sql = "UPDATE aboutfacee.TB_POPUP SET del_yn=1 WHERE popup_title=?;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, title);
				rst = ps.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(ps, conn);
			}
			return rst;
		}

}
