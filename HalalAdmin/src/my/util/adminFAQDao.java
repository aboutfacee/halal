package my.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class adminFAQDao {
	//FAQ List 가져옴
		public ArrayList<adminVo> FAQInfo(){
			ArrayList<adminVo> list = new ArrayList<adminVo>();
			Connection conn=null;
			PreparedStatement ps = null;
			ResultSet rs=null;
			try{
				conn = Conn.getConnection();
				String sql = "select * from aboutfacee.TB_FAQ where del_yn=0 order by faq_priority";	//삭제 인자가 0 인 것 중에 가져옴(1: 삭제)
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()){
					adminVo vo = new adminVo();
					vo.setFaqPriority(rs.getString("faq_priority"));
					vo.setFaqQuestion(rs.getString("question"));
					list.add(vo);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(rs, ps, conn);
			}
			return list;
		}
		
		//FAQ 우선 순위 상향 조정
		public int faqUp(String prioriy){
			int rst = 0;
			Connection conn = null;
			PreparedStatement ps = null;
			int pri = Integer.parseInt(prioriy);
			String sql = "UPDATE aboutfacee.TB_FAQ SET faq_priority=? WHERE faq_priority=? and del_yn=0;";
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
				//Conn.close(ps, conn2);
				//Conn.close(ps, conn3);
			}
			return rst;

		}
		//FAQ 우선순위 하향 조정
		public int faqDown(String prioriy){
			int rst = 0;
			Connection conn = null;
			PreparedStatement ps = null;
			int pri = Integer.parseInt(prioriy);
			String sql = "UPDATE aboutfacee.TB_FAQ SET faq_priority=? WHERE faq_priority=? and del_yn=0;";
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
				//Conn.close(ps, conn2);
				//Conn.close(ps, conn3);
			}
			return rst;

		}

		//FAQ 우선순위 최대값
		public String findFaqMax(){
			String max= null;
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			try{
				conn = Conn.getConnection();
				String sql = "select max(faq_priority) from aboutfacee.TB_FAQ where del_yn=0"; 

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

		//FAQ 삭제
		public int removeFaq(String priority){
			int rst = 0;
			Connection conn = null;
			PreparedStatement ps = null;
			try{
				conn = Conn.getConnection();
				String sql = "UPDATE aboutfacee.TB_FAQ SET del_yn=1 WHERE faq_priority=?;";
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
				String sql = "select max(faq_priority) from aboutfacee.TB_FAQ where del_yn=0"; 

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
			String sql = "UPDATE aboutfacee.TB_FAQ SET faq_priority=? WHERE faq_priority=? and del_yn=0;";
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
		//FAQ 삽입
		public int insertFaq(String question, String priority, String answer){
			int rst = 0;
			Connection conn = null;
			PreparedStatement ps = null;

			//Priority Max값 찾아내기
			int max=0;
			ResultSet rs = null;
			try{
				conn = Conn.getConnection();
				String sql = "select max(faq_priority) from aboutfacee.TB_FAQ where del_yn=0"; 

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
			String sql = "UPDATE aboutfacee.TB_FAQ SET faq_priority=? WHERE faq_priority=? and del_yn=0;";
			try{
				conn = Conn.getConnection();
				ps = conn.prepareStatement(sql);
				for(int i=max; i>=Integer.parseInt(priority); i--){
					ps.setString(1, Integer.toString(i+1));
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
			rst = 0;
			conn = null;
			ps = null;

			try{
				conn = Conn.getConnection();
				sql = "insert into aboutfacee.TB_FAQ values(null,? , ? , ?, 0)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, priority);
				ps.setString(2, question);
				ps.setString(3, answer);
				rst = ps.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(ps, conn);
			}



			return rst;
		}

		//FAQ Update
		public int updateFaq(String pre_priority, String faqNo, String question, String priority, String answer){
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
				String sql = "select max(faq_priority) from aboutfacee.TB_FAQ where del_yn=0"; 

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
			if(Integer.parseInt(pre_priority)>Integer.parseInt(priority)){		//priority를 하향 조정 하려고 할 때
				if(max>Integer.parseInt(pre_priority)){
					//수정하려는 pre_priority가 Max보다 우선순위가 높을 때
					String sql = "UPDATE aboutfacee.TB_FAQ SET faq_priority=? WHERE faq_priority=? and del_yn=0;";
					try{
						conn = Conn.getConnection();
						ps = conn.prepareStatement(sql);
						for(int i=Integer.parseInt(pre_priority)-1; i>=Integer.parseInt(priority); i--){
							ps.setString(1, Integer.toString(i+1));
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
				}else{
					//수정하려는 pre_priority가 Max값 일 때
					String sql = "UPDATE aboutfacee.TB_FAQ SET faq_priority=? WHERE faq_priority=? and del_yn=0;";
					try{

						conn = Conn.getConnection();
						ps = conn.prepareStatement(sql);
						for(int i=max-1; i>=Integer.parseInt(priority); i--){
							ps.setString(1, Integer.toString(i+1));
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
				}
			}else if(Integer.parseInt(pre_priority)<Integer.parseInt(priority)){	//Priority를 상향 조정 하려고 할 때
				if(1<Integer.parseInt(pre_priority)){
					//수정하려는 pre_priority가 1보다 우선순위가 낮을 때
					String sql = "UPDATE aboutfacee.TB_FAQ SET faq_priority=? WHERE faq_priority=? and del_yn=0;";
					try{
						conn = Conn.getConnection();
						ps = conn.prepareStatement(sql);
						for(int i=Integer.parseInt(pre_priority)+1; i<=Integer.parseInt(priority); i++){
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
				}else{
					//수정하려는 pre_priority가 1순위 일 때
					String sql = "UPDATE aboutfacee.TB_FAQ SET faq_priority=? WHERE faq_priority=? and del_yn=0;";
					try{

						conn = Conn.getConnection();
						ps = conn.prepareStatement(sql);
						for(int i=2; i<=Integer.parseInt(priority); i++){
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
				}
			}

			rst=0;
			conn = null;
			ps = null;
			try{
				conn = Conn.getConnection();
				String sql = "UPDATE aboutfacee.TB_FAQ SET faq_priority=?, question=?, answer=? WHERE faq_no=? and del_yn=0;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, priority);
				ps.setString(2, question);
				ps.setString(3, answer);
				ps.setString(4, faqNo);
				rst = ps.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(ps, conn);
			}
			return rst;
		}


		//Modify에서 Priority로 다른 정보들 찾기
		public adminVo findFaqInfo(String priority){
			adminVo vo = new adminVo();
			Connection conn=null;
			PreparedStatement ps = null;
			ResultSet rs=null;
			try{
				conn = Conn.getConnection();
				String sql = "select * from aboutfacee.TB_FAQ where faq_priority=? and del_yn=0";	//삭제 인자가 0 인 것 중에 가져옴(1: 삭제)
				ps = conn.prepareStatement(sql);
				ps.setString(1, priority);
				rs = ps.executeQuery();
				while(rs.next()){
					vo.setFaqQuestion(rs.getString("question"));
					vo.setFaqAnswer(rs.getString("answer"));
					vo.setFaqNo(rs.getString("faq_no"));
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Conn.close(rs, ps, conn);
			}
			return vo;
		}

}
