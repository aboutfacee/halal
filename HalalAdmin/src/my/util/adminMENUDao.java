package my.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class adminMENUDao {
	//특정 업체에 해당하는 Menu List 가져옴
		public ArrayList<adminVo> MenuInfo(String rest_name){
			ArrayList<adminVo> list = new ArrayList<adminVo>();
			Connection conn=null;
			PreparedStatement ps = null;
			ResultSet rs=null;
			try{
				conn = Conn.getConnection();
				String sql = "SELECT * FROM aboutfacee.TB_MENU, aboutfacee.TB_RESTAURANT where aboutfacee.TB_RESTAURANT.rest_no=aboutfacee.TB_MENU.rest_no and rest_name=? and aboutfacee.TB_MENU.del_yn=0 order by menu_priority;";	//삭제 인자가 0 인 것 중에 가져옴(1: 삭제)
				ps = conn.prepareStatement(sql);
				ps.setString(1, rest_name);
				rs = ps.executeQuery();
				while(rs.next()){
					adminVo vo = new adminVo();
					vo.setMenuName(rs.getString("menu_name"));
					vo.setMenuPriority(rs.getString("menu_priority"));
					vo.setMenuPrice(rs.getString("menu_price"));
					vo.setMenuSumm(rs.getString("menu_summ"));
					list.add(vo);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(rs, ps, conn);
			}
			return list;
		}
		//Menu 우선 순위 상향 조정
		public int MenuUp(String prioriy){
			int rst = 0;
			Connection conn = null;
			PreparedStatement ps = null;
			int pri = Integer.parseInt(prioriy);
			String sql = "UPDATE aboutfacee.TB_MENU SET menu_priority=? WHERE menu_priority=? and del_yn=0;";
			try{
				conn = Conn.getConnection();

				ps = conn.prepareStatement(sql);
				ps.setString(1, Integer.toString(1000));
				ps.setString(2, Integer.toString(pri-1));
				ps.addBatch();

				ps.clearParameters();

				ps.setString(1, Integer.toString(pri-1));
				ps.setString(2, Integer.toString(pri));
				ps.addBatch();

				ps.clearParameters();

				ps.setString(1, Integer.toString(pri));
				ps.setString(2, Integer.toString(1000));
				ps.addBatch();
				ps.clearParameters();

				ps.executeBatch();

			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(ps, conn);
			}
			return rst;

		}
		//Menu 우선순위 하향 조정
		public int MenuDown(String prioriy){
			int rst = 0;
			Connection conn = null;
			PreparedStatement ps = null;
			int pri = Integer.parseInt(prioriy);
			String sql = "UPDATE aboutfacee.TB_MENU SET menu_priority=? WHERE menu_priority=? and del_yn=0;";
			try{
				conn = Conn.getConnection();

				ps = conn.prepareStatement(sql);
				ps.setString(1, Integer.toString(1000));
				ps.setString(2, Integer.toString(pri+1));
				ps.addBatch();

				ps.clearParameters();

				ps.setString(1, Integer.toString(pri+1));
				ps.setString(2, Integer.toString(pri));
				ps.addBatch();

				ps.clearParameters();

				ps.setString(1, Integer.toString(pri));
				ps.setString(2, Integer.toString(1000));
				ps.addBatch();
				ps.clearParameters();

				ps.executeBatch();

			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(ps, conn);
			}
			return rst;

		}

		//Menu 우선순위 최대값
		public String findMenuMax(){
			String max= null;
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			try{
				conn = Conn.getConnection();
				String sql = "select max(menu_priority) from aboutfacee.TB_MENU where del_yn=0"; 

				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()){
					max = rs.getString(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(rs, ps, conn);
			}
			return max;
		}

		//MENU 삭제
		public int removeMenu(String priority){
			int rst = 0;
			Connection conn = null;
			PreparedStatement ps = null;
			try{
				conn = Conn.getConnection();
				String sql = "UPDATE aboutfacee.TB_MENU SET del_yn=1 WHERE menu_priority=?;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, priority);
				rst = ps.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(ps, conn);
			}
			//Priority Max값 찾아내기
			rst = 0;
			conn = null;
			ps = null;
			int max=0;
			ResultSet rs = null;
			try{
				conn = Conn.getConnection();
				String sql = "select max(menu_priority) from aboutfacee.TB_MENU where del_yn=0"; 

				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()){
					max = rs.getInt(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(rs, ps, conn);
			}


			//수정할 priority 값보다 작은 값 priority 자동 조정
			String sql = "UPDATE aboutfacee.TB_MENU SET menu_priority=? WHERE menu_priority=? and del_yn=0;";
			try{
				conn = Conn.getConnection();
				ps = conn.prepareStatement(sql);
				for(int i=Integer.parseInt(priority)+1; i<=max; i++){
					ps.setString(1, Integer.toString(i-1));
					ps.setString(2, Integer.toString(i));
					ps.addBatch();
					ps.clearParameters();		
				}
				ps.executeBatch();

			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(ps, conn);
			}


			return rst;
		}
		//Modify에서 Priority로 다른 정보들 찾기
		public adminVo findMenuInfo(String priority){
			adminVo vo = new adminVo();
			Connection conn=null;
			PreparedStatement ps = null;
			ResultSet rs=null;
			try{
				conn = Conn.getConnection();
				String sql = "select * from aboutfacee.TB_MENU where menu_priority=? and del_yn=0";	//삭제 인자가 0 인 것 중에 가져옴(1: 삭제)
				ps = conn.prepareStatement(sql);
				ps.setString(1, priority);
				rs = ps.executeQuery();
				while(rs.next()){
					vo.setMenuName(rs.getString("menu_name"));
					vo.setMenuPrice(rs.getString("menu_price"));
					vo.setMenuSumm(rs.getString("menu_summ"));
					vo.setMenuContent(rs.getString("menu_content"));
					vo.setMenuImg(rs.getString("menu_img"));
					vo.setMenuNo(rs.getString("menu_no"));
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(rs, ps, conn);
			}
			return vo;
		}

		//Menu 삽입
		public int insertMenu(String rest_no, String title, String priority, String price, String summary, String content, String storedFile){
			int rst = 0;
			Connection conn = null;
			PreparedStatement ps = null;

			//Priority Max값 찾아내기
			int max=0;
			ResultSet rs = null;
			try{
				conn = Conn.getConnection();
				String sql = "select max(menu_priority) from aboutfacee.TB_MENU where aboutfacee.TB_MENU.rest_no=? and del_yn=0"; 

				ps = conn.prepareStatement(sql);
				ps.setString(1, rest_no);
				rs = ps.executeQuery();
				while(rs.next()){
					max = rs.getInt(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(rs, ps, conn);
			}


			//수정할 priority 값보다 작은 값 priority 자동 조정
			String sql = "UPDATE aboutfacee.TB_MENU SET menu_priority=? WHERE aboutfacee.TB_MENU.rest_no=? and menu_priority=? and del_yn=0;";
			try{
				conn = Conn.getConnection();
				ps = conn.prepareStatement(sql);
				for(int i=max; i>=Integer.parseInt(priority); i--){

					ps.setString(1, Integer.toString(i+1));
					ps.setString(2, rest_no);
					ps.setString(3, Integer.toString(i));
					ps.addBatch();
					ps.clearParameters();		
				}
				ps.executeBatch();

			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(ps, conn);
			}
			rst = 0;
			conn = null;
			ps = null;

			try{
				conn = Conn.getConnection();
				sql = "insert into aboutfacee.TB_MENU values(null,? , ? , ? , ?, ? , ? , ?, 0)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, rest_no);
				ps.setString(2, title);
				ps.setString(3, priority);
				ps.setString(4, price);
				ps.setString(5, summary);
				ps.setString(6, content);
				ps.setString(7, storedFile);
				rst = ps.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(ps, conn);
			}



			return rst;
		}

		//menu Update
		public int updateMenu(String rest_no, String pre_priority, String menuNo, String title, String priority, String price, String summary, String content, String storedFile){
			int rst = 0;
			Connection conn = null;
			PreparedStatement ps = null;

			//Priority Max값 찾아내기
			rst = 0;
			conn = null;
			ps = null;
			int max=0;
			ResultSet rs = null;
			try{
				conn = Conn.getConnection();
				String sql = "select max(menu_priority) from aboutfacee.TB_MENU where aboutfacee.TB_MENU.rest_no=? and del_yn=0"; 

				ps = conn.prepareStatement(sql);
				ps.setString(1, rest_no);
				rs = ps.executeQuery();
				while(rs.next()){
					max = rs.getInt(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(rs, ps, conn);
			}
			if(Integer.parseInt(pre_priority)>Integer.parseInt(priority)){		//priority를 하향 조정 하려고 할 때
				if(max>Integer.parseInt(pre_priority)){
					//수정하려는 pre_priority가 Max보다 우선순위가 높을 때
					String sql = "UPDATE aboutfacee.TB_MENU SET menu_priority=? WHERE aboutfacee.TB_MENU.rest_no=? and menu_priority=? and del_yn=0;";
					try{
						conn = Conn.getConnection();
						ps = conn.prepareStatement(sql);
						for(int i=Integer.parseInt(pre_priority)-1; i>=Integer.parseInt(priority); i--){
							ps.setString(1, Integer.toString(i+1));
							ps.setString(2, rest_no);
							ps.setString(3, Integer.toString(i));
							ps.addBatch();
							ps.clearParameters();		
						}
						ps.executeBatch();

					}catch(Exception e){
						e.printStackTrace();
					}finally{
						Conn.close(ps, conn);
					}
				}else{
					//수정하려는 pre_priority가 Max값 일 때
					String sql = "UPDATE aboutfacee.TB_MENU SET menu_priority=? WHERE aboutfacee.TB_MENU.rest_no=? and menu_priority=? and del_yn=0;";
					try{

						conn = Conn.getConnection();
						ps = conn.prepareStatement(sql);
						for(int i=max-1; i>=Integer.parseInt(priority); i--){
							ps.setString(1, Integer.toString(i+1));
							ps.setString(2, rest_no);
							ps.setString(3, Integer.toString(i));
							ps.addBatch();
							ps.clearParameters();		
						}
						ps.executeBatch();

					}catch(Exception e){
						e.printStackTrace();
					}finally{
						Conn.close(ps, conn);
					}
				}
			}else if(Integer.parseInt(pre_priority)<Integer.parseInt(priority)){	//Priority를 상향 조정 하려고 할 때
				if(1<Integer.parseInt(pre_priority)){
					//수정하려는 pre_priority가 1보다 우선순위가 낮을 때
					String sql = "UPDATE aboutfacee.TB_MENU SET menu_priority=? WHERE aboutfacee.TB_MENU.rest_no=? and menu_priority=? and del_yn=0;";
					try{
						conn = Conn.getConnection();
						ps = conn.prepareStatement(sql);
						for(int i=Integer.parseInt(pre_priority)+1; i<=Integer.parseInt(priority); i++){
							ps.setString(1, Integer.toString(i-1));
							ps.setString(2, rest_no);
							ps.setString(3, Integer.toString(i));
							ps.addBatch();
							ps.clearParameters();		
						}
						ps.executeBatch();

					}catch(Exception e){
						e.printStackTrace();
					}finally{
						Conn.close(ps, conn);
					}
				}else{
					//수정하려는 pre_priority가 1순위 일 때
					String sql = "UPDATE aboutfacee.TB_MENU SET menu_priority=? WHERE aboutfacee.TB_MENU.rest_no=? and menu_priority=? and del_yn=0;";
					try{

						conn = Conn.getConnection();
						ps = conn.prepareStatement(sql);
						for(int i=2; i<=Integer.parseInt(priority); i++){
							ps.setString(1, Integer.toString(i-1));
							ps.setString(2, rest_no);
							ps.setString(3, Integer.toString(i));
							ps.addBatch();
							ps.clearParameters();		
						}
						ps.executeBatch();

					}catch(Exception e){
						e.printStackTrace();
					}finally{
						Conn.close(ps, conn);
					}
				}
			}

			rst=0;
			conn = null;
			ps = null;
			try{
				conn = Conn.getConnection();
				String sql = "UPDATE aboutfacee.TB_MENU SET menu_name=?, menu_priority=?, menu_price=?, menu_summ=?, menu_content=?, menu_img=? WHERE menu_no=? and del_yn=0;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, title);
				ps.setString(2, priority);
				ps.setString(3, price);
				ps.setString(4, summary);
				ps.setString(5, content);
				ps.setString(6, storedFile);
				ps.setString(7, menuNo);
				rst = ps.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(ps, conn);
			}
			return rst;
		}
		public ArrayList<adminVo> RestaurantInfo(){
			ArrayList<adminVo> list = new ArrayList<adminVo>();
			Connection conn=null;
			PreparedStatement ps = null;
			ResultSet rs=null;
			try{
				conn = Conn.getConnection();
				String sql = "select * from aboutfacee.TB_RESTAURANT where del_yn=0 order by rest_priority";	//삭제 인자가 0 인 것 중에 가져옴(1: 삭제)
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()){
					adminVo vo = new adminVo();
					vo.setRestaurantPriority(rs.getString("rest_priority"));
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
		
		public String findRestNo(String restName){
			String rest= null;
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			try{
				conn = Conn.getConnection();
				String sql = "select aboutfacee.TB_RESTAURANT.rest_no from aboutfacee.TB_RESTAURANT where rest_name=?"; 

				ps = conn.prepareStatement(sql);
				ps.setString(1, restName);
				rs = ps.executeQuery();
				while(rs.next()){
					rest = rs.getString("rest_no");
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(rs, ps, conn);
			}
			return rest;
		}

}
