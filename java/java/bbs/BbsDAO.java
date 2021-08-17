package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class BbsDAO {
	 public int create(String noticeWriter, String noticeTitle, String noticeKinds, String noticeContents, String noticeDate) throws Exception {
	      //++자바와 DB연결하는 프로그램(=JDBC) 순서
	      //1.JDBC Connector 설정
	      Class.forName("com.mysql.jdbc.Driver");
	      System.out.println("1. connector 연결성공!!");
	    
	      //2.java에서 DB로 연결 : 연결할 주소 URL(ip, port, DB명), user name, password
	      String url = "jdbc:mysql://localhost:3306/Makgeolli?useUnicode=true&characterEncoding=utf8";
	      String user = "root";
	      String password = "fender601";
	      Connection con = DriverManager.getConnection(url, user, password);
	      //import java.sql.Connection;경로확인
	      System.out.println("2. db 연결성공!");
	      
	      //3.sql문을 만든다.
	      String sql = "insert into notice values (null, ?, ?, ?, ?, ?)";
//	      PreparedStatement => sql문 객체, 컵에 sql을 담았을때 컵과 같은 의미
	      PreparedStatement ps = con.prepareStatement(sql);//con이 가져와줌
	      
	      ps.setString(1, noticeWriter);
	      ps.setString(2, noticeTitle);
	      ps.setString(3, noticeKinds);
	      ps.setString(4, noticeContents);
	      ps.setString(5, noticeDate); 
	      System.out.println("3. SQL문 연결성공!!");
	      
	      //4.sql문을 mysql로 전송한다.
	      int result = ps.executeUpdate();
	      System.out.println("4. SQL문 전송 성공!");
	      System.out.println("SQL문 수행개수 " + result);
		return result;
	   }
	 public ArrayList<BbsDTO> read() throws Exception {
			
		 
		//1.JDBC Connector 설정
	      Class.forName("com.mysql.jdbc.Driver");
	      System.out.println("1. connector 연결성공!!");
	    
	      //2.java에서 DB로 연결 : 연결할 주소 URL(ip, port, DB명), user name, password
	      String url = "jdbc:mysql://localhost:3306/Makgeolli?useUnicode=true&characterEncoding=utf8";
	      String user = "root";
	      String password = "fender601";
	      Connection con = DriverManager.getConnection(url, user, password);
	      //import java.sql.Connection;경로확인
	      System.out.println("2. db 연결성공!");
	      
			//DTO를 넣을 컨테이너 역할을 하는 ArrayList를 만들어주어야 한다.
			ArrayList<BbsDTO> list = new ArrayList<>();
			ResultSet rs = null; //메서드 안에서 선언된변수는 모두 지역변수
			//지역변수는 초기화를 해주어야 한다. 

			try {
				//3. sql문을 만든다.
				String sql = "select * from notice";
				PreparedStatement ps = con.prepareStatement(sql);
				System.out.println("3. sql문 생성 성공!!!");
				
				//4. sql문을 mysql로 전송한다.
				//result = ps.executeUpdate(); //cud일 때만 사용 
				 rs = ps.executeQuery();
				System.out.println("4. sql문 전송 전송");
				//System.out.println("검색 결과는 >> " + rs.next());
				while(rs.next()) {
					BbsDTO bag2 = new BbsDTO();
					System.out.println("검색 결과가 있음.");
					bag2.setNoticeNum(rs.getInt(1));
					bag2.setNoticeWriter(rs.getString(2));
					bag2.setNoticeTitle(rs.getString(3));
					bag2.setNoticeKinds(rs.getString(4));
					bag2.setNoticeContents(rs.getString(5));
					bag2.setNoticeDate(rs.getString(6));
					System.out.println(bag2);
					list.add(bag2);
					System.out.println(list.size());
				}
			} catch (SQLException e) { //3-4단계
				System.out.println("3-4번 에러>> DB관련된 처리하다 에러발생함..!!!!");
				e.printStackTrace();
			}
			return list;
			
		} //read end.
	}

