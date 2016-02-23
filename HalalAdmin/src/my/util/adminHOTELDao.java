package my.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class adminHOTELDao {
	//호텔 정보 입력
		public ArrayList<adminVo> HotelInfo(){
			ArrayList<adminVo> list = new ArrayList<adminVo>();
			Connection conn=null;
			PreparedStatement ps = null;
			ResultSet rs=null;
			try{
				conn = Conn.getConnection();
				String sql = "select * from aboutfacee.TB_HOTEL where del_yn=0 order by hotel_name";	//삭제 인자가 0 인 것 중에 가져옴(1: 삭제)
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()){
					adminVo vo = new adminVo();
					vo.setHotelName(rs.getString("hotel_name"));
					vo.setHotelAddress(rs.getString("hotel_address"));
					vo.setHotelNo(rs.getString("hotel_no"));
					list.add(vo);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(rs, ps, conn);
			}
			return list;
		}
		//호텔 제거
		public int removeHotel(String no){
			int rst = 0;
			Connection conn = null;
			PreparedStatement ps = null;
			try{
				conn = Conn.getConnection();
				String sql = "UPDATE aboutfacee.TB_HOTEL SET del_yn=1 WHERE hotel_no=?;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, no);
				rst = ps.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(ps, conn);
			}
			return rst;
		}


		//호텔 새로 넣기
		public int insertHotel(String title, String address){
			int rst = 0;
			Connection conn = null;
			PreparedStatement ps = null;
			try{
				conn = Conn.getConnection();
				String sql = "insert into aboutfacee.TB_HOTEL values(null,?,?,0)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, title);
				ps.setString(2, address);
				rst = ps.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(ps, conn);
			}
			return rst;
		}

}
