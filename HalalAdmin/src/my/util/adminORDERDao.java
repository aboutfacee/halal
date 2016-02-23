package my.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class adminORDERDao {
	

	public ArrayList<adminVo> BasicOrderInfo( ){
		ArrayList<adminVo> list = new ArrayList<adminVo>();
		Connection conn=null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;

		PreparedStatement ps4 = null;
		ResultSet rs=null;
		ResultSet rs2=null;
		ResultSet rs3=null;
		ResultSet rs4=null;
		try{
			conn = Conn.getConnection();
			String sql = "SELECT * FROM aboutfacee.TB_ORDER, aboutfacee.TB_RESTAURANT "
					+ "where aboutfacee.TB_ORDER.rest_no=aboutfacee.TB_RESTAURANT.rest_no order by order_no desc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();




			while(rs.next()){
				int total=0;
				adminVo vo = new adminVo();


				//고객 명 가져오기
				String sql2 = "SELECT mem_name from aboutfacee.TB_MEMBER, aboutfacee.TB_ORDER "
						+ "where aboutfacee.TB_ORDER.email=aboutfacee.TB_MEMBER.email and aboutfacee.TB_ORDER.email=?;";
				ps2=conn.prepareStatement(sql2);
				ps2.setString(1, rs.getString("email"));
				rs2 = ps2.executeQuery();
				while(rs2.next()){
					vo.setMemberName(rs2.getString(1));
				}

				//총 금액 가져오기
				String sql4 = "SELECT aboutfacee.TB_MENU.menu_price, aboutfacee.TB_ORDER_MENU.count FROM aboutfacee.TB_ORDER_MENU, aboutfacee.TB_MENU "
						+ "where aboutfacee.TB_MENU.menu_no = aboutfacee.TB_ORDER_MENU.menu_no and order_no=?;";

				ps4=conn.prepareStatement(sql4);
				ps4.setString(1, rs.getString("order_no"));
				rs4 = ps4.executeQuery();
				while(rs4.next()){
					total+=(rs4.getInt(1))*(rs4.getInt(2));
				}
				vo.setOrderTotalCost(Integer.toString(total));

				vo.setOrderNo(rs.getString("order_no"));
				vo.setOrderEmail(rs.getString("email"));
				vo.setOrderAddress(rs.getString("address"));
				vo.setOrderRoom(rs.getString("room"));
				vo.setOrderPayMethod(rs.getString("pay_method"));
				vo.setOrderDeliTime(rs.getString("delivery_time"));
				vo.setOrderTime(rs.getString("order_time"));
				vo.setOrderState(rs.getString("order_state"));
				vo.setRestaurantName(rs.getString("rest_name"));
				list.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			Conn.close(rs, ps, conn);
		}
		return list;
	}

	public ArrayList<adminVo> DeliOrderInfo( ){
		ArrayList<adminVo> list = new ArrayList<adminVo>();
		Connection conn=null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;

		PreparedStatement ps4 = null;
		ResultSet rs=null;
		ResultSet rs2=null;
		ResultSet rs3=null;
		ResultSet rs4=null;
		try{
			conn = Conn.getConnection();
			String sql = "SELECT * FROM aboutfacee.TB_ORDER, aboutfacee.TB_RESTAURANT "
					+ "where aboutfacee.TB_ORDER.rest_no=aboutfacee.TB_RESTAURANT.rest_no order by delivery_time, order_no desc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();




			while(rs.next()){
				int total=0;
				adminVo vo = new adminVo();


				//고객 명 가져오기
				String sql2 = "SELECT mem_name from aboutfacee.TB_MEMBER, aboutfacee.TB_ORDER "
						+ "where aboutfacee.TB_ORDER.email=aboutfacee.TB_MEMBER.email and aboutfacee.TB_ORDER.email=?;";
				ps2=conn.prepareStatement(sql2);
				ps2.setString(1, rs.getString("email"));
				rs2 = ps2.executeQuery();
				while(rs2.next()){
					vo.setMemberName(rs2.getString(1));
				}

				//총 금액 가져오기
				String sql4 = "SELECT aboutfacee.TB_MENU.menu_price, aboutfacee.TB_ORDER_MENU.count FROM aboutfacee.TB_ORDER_MENU, aboutfacee.TB_MENU "
						+ "where aboutfacee.TB_MENU.menu_no = aboutfacee.TB_ORDER_MENU.menu_no and order_no=?;";

				ps4=conn.prepareStatement(sql4);
				ps4.setString(1, rs.getString("order_no"));
				rs4 = ps4.executeQuery();
				while(rs4.next()){
					total+=(rs4.getInt(1))*(rs4.getInt(2));
				}
				vo.setOrderTotalCost(Integer.toString(total));

				vo.setOrderNo(rs.getString("order_no"));
				vo.setOrderEmail(rs.getString("email"));
				vo.setOrderAddress(rs.getString("address"));
				vo.setOrderRoom(rs.getString("room"));
				vo.setOrderPayMethod(rs.getString("pay_method"));
				vo.setOrderDeliTime(rs.getString("delivery_time"));
				vo.setOrderTime(rs.getString("order_time"));
				vo.setOrderState(rs.getString("order_state"));
				vo.setRestaurantName(rs.getString("rest_name"));
				list.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			Conn.close(rs, ps, conn);
		}
		return list;
	}

	public ArrayList<adminVo> StateOrderInfo( ){
		ArrayList<adminVo> list = new ArrayList<adminVo>();
		Connection conn=null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;

		PreparedStatement ps4 = null;
		ResultSet rs=null;
		ResultSet rs2=null;
		ResultSet rs3=null;
		ResultSet rs4=null;
		try{
			conn = Conn.getConnection();
			String sql = "SELECT * FROM aboutfacee.TB_ORDER, aboutfacee.TB_RESTAURANT "
					+ "where aboutfacee.TB_ORDER.rest_no=aboutfacee.TB_RESTAURANT.rest_no order by order_state desc, order_no desc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();




			while(rs.next()){
				int total=0;
				adminVo vo = new adminVo();


				//고객 명 가져오기
				String sql2 = "SELECT mem_name from aboutfacee.TB_MEMBER, aboutfacee.TB_ORDER where aboutfacee.TB_ORDER.email=aboutfacee.TB_MEMBER.email and aboutfacee.TB_ORDER.email=?;";
				ps2=conn.prepareStatement(sql2);
				ps2.setString(1, rs.getString("email"));
				rs2 = ps2.executeQuery();
				while(rs2.next()){
					vo.setMemberName(rs2.getString(1));
				}

				//총 금액 가져오기
				String sql4 = "SELECT aboutfacee.TB_MENU.menu_price, aboutfacee.TB_ORDER_MENU.count FROM aboutfacee.TB_ORDER_MENU, aboutfacee.TB_MENU where aboutfacee.TB_MENU.menu_no = aboutfacee.TB_ORDER_MENU.menu_no and order_no=?;";

				ps4=conn.prepareStatement(sql4);
				ps4.setString(1, rs.getString("order_no"));
				rs4 = ps4.executeQuery();
				while(rs4.next()){
					total+=(rs4.getInt(1))*(rs4.getInt(2));
				}
				vo.setOrderTotalCost(Integer.toString(total));

				vo.setOrderNo(rs.getString("order_no"));
				vo.setOrderEmail(rs.getString("email"));
				vo.setOrderAddress(rs.getString("address"));
				vo.setOrderRoom(rs.getString("room"));
				vo.setOrderPayMethod(rs.getString("pay_method"));
				vo.setOrderDeliTime(rs.getString("delivery_time"));
				vo.setOrderTime(rs.getString("order_time"));
				vo.setOrderState(rs.getString("order_state"));
				vo.setRestaurantName(rs.getString("rest_name"));
				list.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			Conn.close(rs, ps, conn);
		}
		return list;
	}


	public ArrayList<adminVo> OrderTimeOrderInfo( ){
		ArrayList<adminVo> list = new ArrayList<adminVo>();
		Connection conn=null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;

		PreparedStatement ps4 = null;
		ResultSet rs=null;
		ResultSet rs2=null;
		ResultSet rs3=null;
		ResultSet rs4=null;
		try{
			conn = Conn.getConnection();
			String sql = "SELECT * FROM aboutfacee.TB_ORDER, aboutfacee.TB_RESTAURANT "
					+ "where aboutfacee.TB_ORDER.rest_no=aboutfacee.TB_RESTAURANT.rest_no order by order_time, order_no desc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();




			while(rs.next()){
				int total=0;
				adminVo vo = new adminVo();


				//고객 명 가져오기
				String sql2 = "SELECT mem_name from aboutfacee.TB_MEMBER, aboutfacee.TB_ORDER where aboutfacee.TB_ORDER.email=aboutfacee.TB_MEMBER.email and aboutfacee.TB_ORDER.email=?;";
				ps2=conn.prepareStatement(sql2);
				ps2.setString(1, rs.getString("email"));
				rs2 = ps2.executeQuery();
				while(rs2.next()){
					vo.setMemberName(rs2.getString(1));
				}

				//총 금액 가져오기
				String sql4 = "SELECT aboutfacee.TB_MENU.menu_price, aboutfacee.TB_ORDER_MENU.count FROM aboutfacee.TB_ORDER_MENU, aboutfacee.TB_MENU where aboutfacee.TB_MENU.menu_no = aboutfacee.TB_ORDER_MENU.menu_no and order_no=?;";

				ps4=conn.prepareStatement(sql4);
				ps4.setString(1, rs.getString("order_no"));
				rs4 = ps4.executeQuery();
				while(rs4.next()){
					total+=(rs4.getInt(1))*(rs4.getInt(2));
				}
				vo.setOrderTotalCost(Integer.toString(total));

				vo.setOrderNo(rs.getString("order_no"));
				vo.setOrderEmail(rs.getString("email"));
				vo.setOrderAddress(rs.getString("address"));
				vo.setOrderRoom(rs.getString("room"));
				vo.setOrderPayMethod(rs.getString("pay_method"));
				vo.setOrderDeliTime(rs.getString("delivery_time"));
				vo.setOrderTime(rs.getString("order_time"));
				vo.setOrderState(rs.getString("order_state"));
				vo.setRestaurantName(rs.getString("rest_name"));
				list.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			Conn.close(rs, ps, conn);
		}
		return list;
	}

	public ArrayList<adminVo> RestNameOrderInfo( ){
		ArrayList<adminVo> list = new ArrayList<adminVo>();
		Connection conn=null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;

		PreparedStatement ps4 = null;
		ResultSet rs=null;
		ResultSet rs2=null;
		ResultSet rs3=null;
		ResultSet rs4=null;
		try{
			conn = Conn.getConnection();
			String sql = "SELECT * FROM aboutfacee.TB_ORDER, aboutfacee.TB_RESTAURANT "
					+ "where aboutfacee.TB_ORDER.rest_no=aboutfacee.TB_RESTAURANT.rest_no order by rest_name, order_no desc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();




			while(rs.next()){
				int total=0;
				adminVo vo = new adminVo();


				//고객 명 가져오기
				String sql2 = "SELECT mem_name from aboutfacee.TB_MEMBER, aboutfacee.TB_ORDER where aboutfacee.TB_ORDER.email=aboutfacee.TB_MEMBER.email and aboutfacee.TB_ORDER.email=?;";
				ps2=conn.prepareStatement(sql2);
				ps2.setString(1, rs.getString("email"));
				rs2 = ps2.executeQuery();
				while(rs2.next()){
					vo.setMemberName(rs2.getString(1));
				}

				//총 금액 가져오기
				String sql4 = "SELECT aboutfacee.TB_MENU.menu_price, aboutfacee.TB_ORDER_MENU.count FROM aboutfacee.TB_ORDER_MENU, aboutfacee.TB_MENU where aboutfacee.TB_MENU.menu_no = aboutfacee.TB_ORDER_MENU.menu_no and order_no=?;";

				ps4=conn.prepareStatement(sql4);
				ps4.setString(1, rs.getString("order_no"));
				rs4 = ps4.executeQuery();
				while(rs4.next()){
					total+=(rs4.getInt(1))*(rs4.getInt(2));
				}
				vo.setOrderTotalCost(Integer.toString(total));

				vo.setOrderNo(rs.getString("order_no"));
				vo.setOrderEmail(rs.getString("email"));
				vo.setOrderAddress(rs.getString("address"));
				vo.setOrderRoom(rs.getString("room"));
				vo.setOrderPayMethod(rs.getString("pay_method"));
				vo.setOrderDeliTime(rs.getString("delivery_time"));
				vo.setOrderTime(rs.getString("order_time"));
				vo.setOrderState(rs.getString("order_state"));
				vo.setRestaurantName(rs.getString("rest_name"));
				list.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			Conn.close(rs, ps, conn);
		}
		return list;
	}
	
	public ArrayList<adminVo> SearchOrder(String orderState){
		ArrayList<adminVo> list = new ArrayList<adminVo>();
		Connection conn=null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;

		PreparedStatement ps4 = null;
		ResultSet rs=null;
		ResultSet rs2=null;
		ResultSet rs3=null;
		ResultSet rs4=null;
		try{
			conn = Conn.getConnection();
			String sql = "SELECT * FROM aboutfacee.TB_ORDER, aboutfacee.TB_RESTAURANT "
					+ "where aboutfacee.TB_ORDER.rest_no=aboutfacee.TB_RESTAURANT.rest_no and order_state=? order by order_no desc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, orderState);
			rs = ps.executeQuery();




			while(rs.next()){
				int total=0;
				adminVo vo = new adminVo();


				//고객 명 가져오기
				String sql2 = "SELECT mem_name from aboutfacee.TB_MEMBER, aboutfacee.TB_ORDER where aboutfacee.TB_ORDER.email=aboutfacee.TB_MEMBER.email and aboutfacee.TB_ORDER.email=?;";
				ps2=conn.prepareStatement(sql2);
				ps2.setString(1, rs.getString("email"));
				rs2 = ps2.executeQuery();
				while(rs2.next()){
					vo.setMemberName(rs2.getString(1));
				}

				//총 금액 가져오기
				String sql4 = "SELECT aboutfacee.TB_MENU.menu_price, aboutfacee.TB_ORDER_MENU.count FROM aboutfacee.TB_ORDER_MENU, aboutfacee.TB_MENU where aboutfacee.TB_MENU.menu_no = aboutfacee.TB_ORDER_MENU.menu_no and order_no=?;";

				ps4=conn.prepareStatement(sql4);
				ps4.setString(1, rs.getString("order_no"));
				rs4 = ps4.executeQuery();
				while(rs4.next()){
					total+=(rs4.getInt(1))*(rs4.getInt(2));
				}
				vo.setOrderTotalCost(Integer.toString(total));

				vo.setOrderNo(rs.getString("order_no"));
				vo.setOrderEmail(rs.getString("email"));
				vo.setOrderAddress(rs.getString("address"));
				vo.setOrderRoom(rs.getString("room"));
				vo.setOrderPayMethod(rs.getString("pay_method"));
				vo.setOrderDeliTime(rs.getString("delivery_time"));
				vo.setOrderTime(rs.getString("order_time"));
				vo.setOrderState(rs.getString("order_state"));
				vo.setRestaurantName(rs.getString("rest_name"));
				list.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			Conn.close(rs, ps, conn);
		}
		return list;
	}
	
	public ArrayList<adminVo> SearchByRestaurant(String rest_name){
		ArrayList<adminVo> list = new ArrayList<adminVo>();
		Connection conn=null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		System.out.println(rest_name);
		PreparedStatement ps4 = null;
		ResultSet rs=null;
		ResultSet rs2=null;
		ResultSet rs3=null;
		ResultSet rs4=null;
		try{
			conn = Conn.getConnection();
			String sql = "SELECT * FROM aboutfacee.TB_ORDER, aboutfacee.TB_RESTAURANT "
					+ "where aboutfacee.TB_ORDER.rest_no=aboutfacee.TB_RESTAURANT.rest_no and rest_name=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, rest_name);
			rs = ps.executeQuery();




			while(rs.next()){
				int total=0;
				adminVo vo = new adminVo();


				//고객 명 가져오기
				String sql2 = "SELECT mem_name from aboutfacee.TB_MEMBER, aboutfacee.TB_ORDER where aboutfacee.TB_ORDER.email=aboutfacee.TB_MEMBER.email and aboutfacee.TB_ORDER.email=?;";
				ps2=conn.prepareStatement(sql2);
				ps2.setString(1, rs.getString("email"));
				rs2 = ps2.executeQuery();
				while(rs2.next()){
					vo.setMemberName(rs2.getString(1));
				}

				//총 금액 가져오기
				String sql4 = "SELECT aboutfacee.TB_MENU.menu_price, aboutfacee.TB_ORDER_MENU.count FROM aboutfacee.TB_ORDER_MENU, aboutfacee.TB_MENU where aboutfacee.TB_MENU.menu_no = aboutfacee.TB_ORDER_MENU.menu_no and order_no=?;";

				ps4=conn.prepareStatement(sql4);
				ps4.setString(1, rs.getString("order_no"));
				rs4 = ps4.executeQuery();
				while(rs4.next()){
					total+=(rs4.getInt(1))*(rs4.getInt(2));
				}
				vo.setOrderTotalCost(Integer.toString(total));

				vo.setOrderNo(rs.getString("order_no"));
				vo.setOrderEmail(rs.getString("email"));
				vo.setOrderAddress(rs.getString("address"));
				vo.setOrderRoom(rs.getString("room"));
				vo.setOrderPayMethod(rs.getString("pay_method"));
				vo.setOrderDeliTime(rs.getString("delivery_time"));
				vo.setOrderTime(rs.getString("order_time"));
				vo.setOrderState(rs.getString("order_state"));
				vo.setRestaurantName(rs.getString("rest_name"));
				list.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			Conn.close(rs, ps, conn);
		}
		return list;
	}
	
	
	public ArrayList<adminVo> SpecifyOrderInfo(String order_no){
		ArrayList<adminVo> list = new ArrayList<adminVo>();
		Connection conn=null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;

		PreparedStatement ps4 = null;
		ResultSet rs=null;
		ResultSet rs2=null;
		ResultSet rs3=null;
		ResultSet rs4=null;
		try{
			conn = Conn.getConnection();
			String sql = "SELECT * FROM aboutfacee.TB_ORDER, aboutfacee.TB_RESTAURANT "
					+ "where aboutfacee.TB_ORDER.rest_no=aboutfacee.TB_RESTAURANT.rest_no and order_no=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, order_no);
			rs = ps.executeQuery();




			while(rs.next()){
				int total=0;
				adminVo vo = new adminVo();


				//고객 정보 가져오기
				String sql2 = "SELECT mem_name, phone, social_name, social_id from aboutfacee.TB_MEMBER, aboutfacee.TB_ORDER "
						+ "where aboutfacee.TB_ORDER.email=aboutfacee.TB_MEMBER.email and aboutfacee.TB_ORDER.email=?;";
				ps2=conn.prepareStatement(sql2);
				ps2.setString(1, rs.getString("email"));
				rs2 = ps2.executeQuery();
				while(rs2.next()){
					vo.setMemberName(rs2.getString(1));
					vo.setMemberPhone(rs2.getString(2));
					vo.setMemberSNS(rs2.getString(3));
					vo.setMemberSNSID(rs2.getString(4));
				}

				//총 금액 가져오기
				String sql4 = "SELECT aboutfacee.TB_MENU.menu_price, aboutfacee.TB_ORDER_MENU.count FROM aboutfacee.TB_ORDER_MENU, aboutfacee.TB_MENU where aboutfacee.TB_MENU.menu_no = aboutfacee.TB_ORDER_MENU.menu_no and order_no=?;";

				ps4=conn.prepareStatement(sql4);
				ps4.setString(1, rs.getString("order_no"));
				rs4 = ps4.executeQuery();
				while(rs4.next()){
					total+=(rs4.getInt(1))*(rs4.getInt(2));
				}
				vo.setOrderTotalCost(Integer.toString(total));

				vo.setOrderNo(rs.getString("order_no"));
				vo.setOrderEmail(rs.getString("email"));
				vo.setOrderAddress(rs.getString("address"));
				vo.setOrderRoom(rs.getString("room"));
				vo.setOrderPayMethod(rs.getString("pay_method"));
				vo.setOrderDeliTime(rs.getString("delivery_time"));
				vo.setOrderTime(rs.getString("order_time"));
				vo.setOrderState(rs.getString("order_state"));
				vo.setRestaurantName(rs.getString("rest_name"));
				list.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			Conn.close(rs, ps, conn);
		}
		return list;
	}
	
	
	public int OrderTotalCost(String order_no){
		Connection conn=null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		int total=0;
		
		//총 금액 가져오기
		String sql = "SELECT aboutfacee.TB_MENU.menu_price, aboutfacee.TB_ORDER_MENU.count FROM aboutfacee.TB_ORDER_MENU, aboutfacee.TB_MENU "
				+ "where aboutfacee.TB_MENU.menu_no = aboutfacee.TB_ORDER_MENU.menu_no and order_no=?;";

		try {
			conn = Conn.getConnection();
		ps=conn.prepareStatement(sql);
		ps.setString(1, order_no);
		rs = ps.executeQuery();
		while(rs.next()){
			total+=(rs.getInt(1))*(rs.getInt(2));
		}
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			Conn.close(rs, ps, conn);
		}
		return total;
		
	}
	//주문한 Menu List 가져옴
	public ArrayList<adminVo> OrderedMenu(String order_no){
		ArrayList<adminVo> list = new ArrayList<adminVo>();
		Connection conn=null;
		PreparedStatement ps = null;
		ResultSet rs=null;
	
		try{
			conn = Conn.getConnection();
			String sql = "SELECT menu_name, aboutfacee.TB_ORDER_MENU.count, menu_price  FROM aboutfacee.TB_MENU, aboutfacee.TB_ORDER_MENU"
					+ " where aboutfacee.TB_MENU.menu_no= aboutfacee.TB_ORDER_MENU.menu_no and aboutfacee.TB_ORDER_MENU.order_no=?;";	//삭제 인자가 0 인 것 중에 가져옴(1: 삭제)
			ps = conn.prepareStatement(sql);
			ps.setString(1, order_no);
			rs = ps.executeQuery();
			
			while(rs.next()){
				adminVo vo = new adminVo();

				vo.setMenuName(rs.getString(1));
				vo.setOrderCount(rs.getString(2));
				vo.setOrderPrice(rs.getString(3));
				list.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			Conn.close(rs, ps, conn);
		}
		return list;
	}
	
	//주문 상태 수정
	public int modifyOrderState(String orderNo, String orderState){
		String sql = "UPDATE aboutfacee.TB_ORDER SET order_state=? WHERE order_no=? ;";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int rst =0;
		try{

			conn = Conn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, orderState);
			ps.setString(2, orderNo);

			rst =ps.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			Conn.close(ps, conn);
		}
		return rst;
	}
	

	public int OrderCount(){
		int cnt=0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			conn = Conn.getConnection();
			String sql = "select count(*) from aboutfacee.TB_ORDER";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			cnt = rs.getInt("count(*)");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			Conn.close(ps, conn);
		}
		return cnt;
	}

	
}
