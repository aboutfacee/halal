package my.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Conn {
 static {
  try {
   String driverName = "com.mysql.jdbc.Driver";
   Class.forName(driverName);
  } catch (ClassNotFoundException e) {
   e.printStackTrace();
  }
 }
 public static Connection getConnection() throws SQLException{
	
	
	 //Cafe24에서 Cafe24 DB 접속
	  String url = "jdbc:mysql://localhost:3306/aboutfacee";
	  String id = "aboutfacee";
	  String password = "aboutface123";
	 
	 /*
	
	 //Local에서 Cafe24 DB 접속
  String url = "jdbc:mysql://aboutfacee.cafe24.com:3306/aboutfacee";
  String id = "aboutfacee";
  String password = "aboutface123";
  
  
  
  	//Local에서 Local DB 접속
  String url = "jdbc:mysql://localhost:3306/aboutfacee";
  String id = "root";
  String password = "wook";
 */
  Connection conn = DriverManager.getConnection(url, id,
    password);
  return conn;
 }
 public static void close(PreparedStatement ps, Connection conn){
  if(ps != null){try{ps.close();}catch(SQLException e){e.printStackTrace();}}
  if(conn != null){try{conn.close();}catch(SQLException e){e.printStackTrace();}}
 }
 public static void close(ResultSet rs, PreparedStatement ps, Connection conn){
  if(rs != null){try{rs.close();}catch(SQLException e){e.printStackTrace();}}
  close(ps, conn);
 }
}
