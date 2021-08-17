package basket;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
public class BasketDAO {
	Connection con;
	// 메서드(변수들): 메서드를 호출할 때 값을 전달하게 되는데 이 전달된 값들을
	// 중간에 저장할 목적으로 매개체역할을 해주는 변수(매개변수)
	// 파라메터, parameter
	String dbUrl = "jdbc:mysql://localhost:3306/makgeolli?useUnicode=true&characterEncoding=utf8";
	String dbId = "root";
	String dbPwd = "fender601";

	// 바스킷 존재 여부 확인 없으면 insert 있으면 받은 값으로 업데이트
	public int basketInUpdChk(BasketDTO DT) {
		int result =0;
		try {
			// 자바와 db연결하는 프로그램(JDBC) 순서
			// 1. jdbc connector설정
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!_1");
			
			// 2. java에서 db로 연결:
			// 연결할 주소url(ip, port, db명), username, password
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPwd);
			System.out.println("2. Makgeolli db연결 성공!!!");
			
			// 3. sql문을 만든다.
			String sql = "SELECT SUM(amount) FROM basket WHERE productId = ? AND userId = ?";
			// TODO 현재 DB에 중복 데이터가 많아서 SUB
			// String sql = "SELECT amount FROM basket WHERE userId = ? AND productId = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, DT.getProductId());
			ps.setString(2, DT.getUserId());
			
			// 4. sql문을 mysql로 전송한다.
			result = ps.executeUpdate();
			System.out.println("4. sql문 전송 전송 : result : " + result);
			
		} catch (ClassNotFoundException e) { // 1단계
			System.out.println("1번 에러>> 드라이버 없음.!!!!");
			
		} catch (SQLException e) { // 2-4단계
			System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!_23");
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 바스킷 insert
	public int insBasket(BasketDTO DT) {
		int result =0;
		try {
			// 자바와 db연결하는 프로그램(JDBC) 순서
			// 1. jdbc connector설정
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!_1");
			
			// 2. java에서 db로 연결:
			// 연결할 주소url(ip, port, db명), username, password
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPwd);
			System.out.println("2. Makgeolli db연결 성공!!!");
			
			// 3. sql문을 만든다.
			String sql = "INSERT INTO basket (productPrice, amount, userId, productId) VALUES ( ?, ?, ?, ? )";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, DT.getProductPrice());
			ps.setInt(2, DT.getAmount());
			ps.setString(3, DT.getUserId());
			ps.setString(4, DT.getProductId());
			
			// 4. sql문을 mysql로 전송한다.
			result = ps.executeUpdate();
			System.out.println("4. sql문 전송 전송 : result : " + result);
			
		} catch (ClassNotFoundException e) { // 1단계
			System.out.println("1번 에러>> 드라이버 없음.!!!!");
			
		} catch (SQLException e) { // 2-4단계
			System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!_45");
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 바스킷 update
	public int updBasket(BasketDTO DT) {
		int result =0;
		try {
			// 자바와 db연결하는 프로그램(JDBC) 순서
			// 1. jdbc connector설정
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!_1");
			
			// 2. java에서 db로 연결:
			// 연결할 주소url(ip, port, db명), username, password
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPwd);
			System.out.println("2. Makgeolli db연결 성공!!!");
			
			// 3. sql문을 만든다.
			
			String sql = "UPDATE basket SET amount = ? WHERE productId = ? AND userID = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, DT.getAmount());
			ps.setString(2, DT.getProductId());
			ps.setString(3, DT.getUserId());
			
			// 4. sql문을 mysql로 전송한다.
			result = ps.executeUpdate();
			System.out.println("4. sql문 전송 전송 : result : " + result);
			
		} catch (ClassNotFoundException e) { // 1단계
			System.out.println("1번 에러>> 드라이버 없음.!!!!");
			
		} catch (SQLException e) { // 2-4단계
			System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!_45");
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 장바구니상품List 조회 
	public ArrayList<BasketDTO> sltBasketList(BasketDTO dto) throws Exception {
		
		//DTO를 넣을 컨테이너 역할을 하는 ArrayList를 만들어주어야 한다.
		ArrayList<BasketDTO> list = new ArrayList<>();
		ResultSet rs = null; //지역변수는 항상 초기화 시켜줘야한다. //set은 집합, 모음이다.
		//메서드 안에서 선언된변수는 모두 지역변수이며 지역변수는 초기화를 해주어야 한다.
		//회원Bag은 public뒤에 랑 같아야한다.
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPwd);
			
			// 3. sql문을 만든다.
			String sql = "SELECT BSK.productId /* 상품Id */"
					   + "	   , LST.productName /* 상품명 */"
					   + "	   , LST.productPrice /* 가격 */"
					   + "	   , BSK.amount /* 개수 */"
					   + "	   , BSK.userId /* 사용자Id */"
					   + "  FROM ( SELECT * FROM basket WHERE '0' != amount AND userId = ?) AS BSK"
					   + "  JOIN listUp AS LST ON BSK.productId = LST.productNum"
					   + " ORDER BY LST.productName";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getUserId());
			System.out.println("3. sql문 생성 성공!!!");
			
			// 4. sql문을 mysql로 전송한다.
			rs = ps.executeQuery();
			System.out.println("4. sql문 전송 전송");
			
			BasketDTO bag3 = new BasketDTO();
			while(rs.next()) {
				bag3 = new BasketDTO();
				bag3.setProductId(rs.getString(1));
				bag3.setProductName(rs.getString(2));
				bag3.setProductPrice(rs.getInt(3));
				bag3.setAmount(rs.getInt(4));
				bag3.setUserId(rs.getString(5));
				
				list.add(bag3);
				System.out.println(list.size());
			}
		} catch (ClassNotFoundException e) { //1단계
			System.out.println("1번 에러>>드라이버 없음!!");
		} catch (SQLException e) { // 2-4단계
			System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!_211");
			e.printStackTrace();
		}
		
		return list; // 결과값을 리턴해라 위치확인.
		
	}//read end.
	
}// class end