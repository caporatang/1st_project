package Product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDAO {

	public void create(ProductDTO dto) {

		// 받아온 bag을 get을 이용해서 꺼낸다.
//		bag.getTitle()

		try {
			// 자바와 db연결하는 프로그램(JDBC) 순서
			// 1. jdbc connector설정
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!");

			// 2. java에서 db로 연결:
			// 연결할 주소url(ip, port, db명), username, password
			String url = "jdbc:mysql://localhost:3306/Makgeolli";
			String username = "root";
			String password = "fender601";
			Connection con = DriverManager.getConnection(url, username, password);
			System.out.println("2. listup db연결 성공!!!");

			// 3. sql문을 만든다.
			String sql = "insert into listup values (?, ?, ?, ?, ?, ?)";
			// String sql = "delete from member where id = 'win'";
			// PrepareStatment : sql을 나타내는 부품.
			// 부품을 램에 넣어놓은 주소만 잇으면 됨.
			// ps부품을 2단계에서 획득한 con부품이 만들어서 return.!
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getProductNum());
			ps.setString(2, dto.getProductPic());
			ps.setString(3, dto.getProductName());
			ps.setInt(4, dto.getProductPrice());
			ps.setString(5, dto.getProductWeight());
			ps.setString(6, dto.getProductOrigin());

			System.out.println("3. sql문 생성 성공!!!");

			// 4. sql문을 mysql로 전송한다.
			int result = ps.executeUpdate();
			System.out.println("4. sql문 전송 전송");
			System.out.println(result);
		} catch (ClassNotFoundException e) { // 1단계
			System.out.println("1번 에러 >> 드라이버 없음.!!!!!");

			e.printStackTrace();
		} catch (SQLException e) { // 2-4단계
			System.out.println("2-4번 에러 >> DB관련 처리로 에러 발생함..!!");
			e.printStackTrace();
		}

	} // create

	public ArrayList<ProductDTO> read(String id) { // 한줄 read

		ResultSet rs = null;

		ProductDTO dto2 = new ProductDTO();
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			// 1. jdbc connector설정
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!");

			// 2. java에서 db로 연결:
			String url = "jdbc:mysql://localhost:3306/Makgeolli";
			String username = "root";
			String password = "fender601";
			Connection con = DriverManager.getConnection(url, username, password);
			System.out.println("2. shoes db연결 성공!!!");

			// 3. sql문을 만든다.
			String sql = "select * from listup where productNum = ? ";
			// String sql = "delete from member where id = 'win'";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			System.out.println("3. sql문 생성 성공!!!");

			// 4. sql문을 mysql로 전송한다.
			// result = ps.executeUpdate(); // executeUpdate(); << CUD 할때만 사용 read는 리턴이 1이
			// 아니기 떄문이다
			rs = ps.executeQuery(); // read는 테이블 형태로 리턴 받는다.
			System.out.println("4. sql문 전송 전송");

			// System.out.println("검색 결과는" + rs.next()); rs.next는 사용될때마다 내려가므로 두번 써주면 결과 없음이
			// 나올것이다.
			if (rs.next()) {
				System.out.println("검색 결과가 있음.");
				String productNum = rs.getString(1); // rs.getString("컬럼명 사용 가능");
				String productPic = rs.getString(2);
				String productName = rs.getString(3);
				int productPrice = rs.getInt(4);
				String productWeight = rs.getString(5);
				String productOrigin = rs.getString(6);
				dto2.setProductNum(productNum);
				dto2.setProductPic(productPic);
				dto2.setProductName(productName);
				dto2.setProductPrice(productPrice);
				dto2.setProductWeight(productWeight);
				dto2.setProductOrigin(productOrigin);

			} else {
				System.out.println("검색 결과가 없음.");
			}
		} catch (ClassNotFoundException e) { // 1단계
			System.out.println("1번 에러 >> 드라이버 없음.!!!!!");
			e.printStackTrace();
		} catch (SQLException e) { // 2-4단계
			System.out.println("2-4번 에러 >> DB관련 처리로 에러 발생함..!!");
			e.printStackTrace();
		}
		list.add(dto2);
		return list;
	} // read

	
	
	
	public ArrayList<ProductDTO> category(String id) { 
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();

		ResultSet rs = null;

		
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				System.out.println("1. connector연결 성공!!!");

				String url = "jdbc:mysql://localhost:3306/Makgeolli";
				String username = "root";
				String password = "fender601";
				Connection con = DriverManager.getConnection(url, username, password);
				System.out.println("2. shoes db연결 성공!!!");

				String sql = "select * from listup where productNum like ?";
				PreparedStatement ps = con.prepareStatement(sql);
				String ids = "%"+id+"%";
				ps.setString(1,	ids);
				


				System.out.println("3. sql문 생성 성공!!!");

				rs = ps.executeQuery(); // read는 테이블 형태로 리턴 받는다.
				System.out.println("4. sql문 전송 전송");

				while (rs.next()) {
					ProductDTO dto2 = new ProductDTO();
					System.out.println("검색 결과가 있음.");
					 String productNum = rs.getString(1); 
					 String productPic = rs.getString(2); 
					 String productName = rs.getString(3); 
					 int productPrice = rs.getInt(4); 
					 String productWeight = rs.getString(5); 
					 String producOrigin= rs.getString(6); 
					 
					dto2.setProductNum(rs.getString(1));
					dto2.setProductPic(rs.getString(2));
					dto2.setProductName(rs.getString(3));
					dto2.setProductPrice(rs.getInt(4));
					dto2.setProductWeight(rs.getString(5));
					dto2.setProductOrigin(rs.getString(6));
					
					
					System.out.println(dto2);
					list.add(dto2);
				}
			} catch (ClassNotFoundException | SQLException e) {
				
				e.printStackTrace();
			}
		
		return list;

	} // read
	
	public ArrayList<ProductDTO> category2(String id) { 
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();

		ResultSet rs = null;

		
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				System.out.println("1. connector연결 성공!!!");

				String url = "jdbc:mysql://localhost:3306/Makgeolli";
				String username = "root";
				String password = "fender601";
				Connection con = DriverManager.getConnection(url, username, password);
				System.out.println("2. shoes db연결 성공!!!");

				String sql = "select * from listup where productNum like ?";
				PreparedStatement ps = con.prepareStatement(sql);
				String ids = id+"%";
				ps.setString(1,	ids);
				


				System.out.println("3. sql문 생성 성공!!!");

				rs = ps.executeQuery(); // read는 테이블 형태로 리턴 받는다.
				System.out.println("4. sql문 전송 전송");

				while (rs.next()) {
					ProductDTO dto2 = new ProductDTO();
					System.out.println("검색 결과가 있음.");
					 String productNum = rs.getString(1); 
					 String productPic = rs.getString(2); 
					 String productName = rs.getString(3); 
					 int productPrice = rs.getInt(4); 
					 String productWeight = rs.getString(5); 
					 String producOrigin= rs.getString(6); 
					 
					dto2.setProductNum(rs.getString(1));
					dto2.setProductPic(rs.getString(2));
					dto2.setProductName(rs.getString(3));
					dto2.setProductPrice(rs.getInt(4));
					dto2.setProductWeight(rs.getString(5));
					dto2.setProductOrigin(rs.getString(6));
					
					
					System.out.println(dto2);
					list.add(dto2);
				}
			} catch (ClassNotFoundException | SQLException e) {
				
				e.printStackTrace();
			}
		
		return list;

	} // read
}// class
