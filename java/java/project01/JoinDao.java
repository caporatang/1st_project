package project01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JoinDao {
	// 메서드를 호출할 때 값을 전달하게 되는데 이 전달된 값들을 중간에 저장할 목적으로 매개체 역할을 해주는 변수(매개변수=파라미터)
	Connection con;

	public JoinDao() {// JDBC 1,2단계 자동처리

		try {
			Class.forName("com.mysql.jdbc.Driver"); // 웹은 webapp- WEB-INF - lib 안에다가 넣어야함
			System.out.println("1. connector 연결성공!!");

			// 2.java에서 DB로 연결 : 연결할 주소 URL(ip, port, DB명), user name, password
			String url = "jdbc:mysql://localhost:3306/Makgeolli?useUnicode=true&characterEncoding=utf8";
			String user = "root";
			String password = "fender601";
			con = DriverManager.getConnection(url, user, password);
			// import java.sql.Connection;경로확인
			System.out.println("2. db 연결성공!");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}// public Joindao 끝

	public int create(JoinDto bag) {
		// 3.sql문을 만든다.
		int result = 999;
		try {
			String sql = "insert into member values (?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, bag.getId());
			ps.setString(2, bag.getPw());
			ps.setString(3, bag.getName());
			ps.setString(4, bag.getEmail());
			ps.setString(5, bag.getTel());
			ps.setString(6, bag.getAddress());
			ps.setString(7, bag.getBirthday());
			ps.setString(8, bag.getGender());
			System.out.println("3. SQL문 연결성공!!");

			// 4.sql문을 mysql로 전송한다.
			result = ps.executeUpdate();
			System.out.println("4. SQL문 전송 성공!");
			System.out.println("SQL문 수행개수 " + result);
			// String result2 = Integer.toString(result);
			// return result2;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;

	} // create end

	public String read(String id) {
			
			// 3.sql문을 만든다.
			String result="";

			try {
				String sql = "select pw from member where id=?"; // ?갯수 하나
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, id);// 1번 물음표에 id를 넣어라.

				// PreparedStatement: sql을 나타내는 부품.
				// ps부품을 2단계에서 획득한 con부품이 만들어서 리턴.
				System.out.println("3.sql문 생성 성공!!");

				// 4.sql문을 mysql로 전송한다.
				ResultSet rs = ps.executeQuery();// 이거 써줘야함. 해당 컬럼의 값을 나타내주는애 ★

				System.out.println("4.sql문 전송 성공!");

				if (rs.next()) {
					result = rs.getString(1);

					System.out.println("rs.next() true, 겟스트링성공");

				} else {// rs.next() false 가 false일때
					System.out.println("rs.next() fasle");
					return "0";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("sql오류");
			}return result;

	}

	public JoinDto readMemberInfo(String id) {
		JoinDto bag = new JoinDto();
		
			try {
				// 3.sql문을 만든다.
				// String sql = "insert into member values ('apple2','apple2','apple2','019')";
				// //sql는 싱글따옴표. "쓰면 String"" 이거 끝나는줄암
				String sql = "select email,tel,address,birthday,gender from member where id=?"; // ?갯수 하나
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, id);// 1번 물음표에 id를 넣어라.

				// PreparedStatement: sql을 나타내는 부품.
				// ps부품을 2단계에서 획득한 con부품이 만들어서 리턴.
				System.out.println("3.sql문 생성 성공!!");

				// 4.sql문을 mysql로 전송한다.
				// int result = ps.executeUpdate(); //executeUpdate는 무조건 int로 반환해서.. 테이블로 갖고올려면
				ResultSet rs = ps.executeQuery();// 이거 써줘야함. 해당 컬럼의 값을 나타내주는애 ★

				System.out.println("4.sql문 전송 성공!");
				// System.out.println("rs.next()결과: "+rs.next()); // 있어야 값을 꺼내오니까 next!!!!
				// true떠야있는것.

				// String[] result = new String[5];
				/*
				 * if (rs.next()) { // 테이블에 검색결과가 있다라고 얘기. String center_num = rs.getString(1);
				 * String address = rs.getString(2); String ins_tel = rs.getString(3); String
				 * open_day = rs.getString(4); String open_time = rs.getString(5);
				 * System.out.println(center_num + " " + address + " " + ins_tel + " " +
				 * open_day + " " + open_time); result[0] = center_num; result[1] = address;
				 * result[2] = ins_tel; result[3] = open_day; result[4] = open_time; }
				 */
				if (rs.next()) {
					System.out.println("rs.next() true");
					bag.setEmail(rs.getString(1));
					bag.setTel(rs.getString(2));
					bag.setAddress(rs.getString(3));
					bag.setBirthday(rs.getString(4));
					bag.setGender(rs.getString(5));
					System.out.println("rs.겟스트링 성공");
				} else {// rs.next() false 가 false일때
					System.out.println("rs.next() fasle");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return bag;
	}

	public String count(String gender) {

		// 1.jdbc connector설정 드라이브or커넥터 연결
		String result = null;

			try {
				// 3.sql문을 만든다.
				// String sql = "insert into member values ('apple2','apple2','apple2','019')";
				// //sql는 싱글따옴표. "쓰면 String"" 이거 끝나는줄암
				// String sql = "select gender from member"; // ?갯수 하나
				String sql = "select count(*) from member where gender=?"; // ?갯수 하나
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, gender);

				// PreparedStatement: sql을 나타내는 부품.
				// ps부품을 2단계에서 획득한 con부품이 만들어서 리턴.
				System.out.println("3.sql문 생성 성공!!");

				// 4.sql문을 mysql로 전송한다.
				// result2 = ps.executeUpdate(); //executeUpdate는 무조건 int로 반환해서.. 테이블로 갖고올려면
				ResultSet rs = ps.executeQuery();// 이거 써줘야함. 해당 컬럼의 값을 나타내주는애 ★

				System.out.println("4.sql문 전송 성공!");
				if (rs.next()) {
					result = rs.getString(1);
					System.out.println(result);
				} else {
					System.out.println("rs.next()실패");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		return result;
	}

	public String name(String id) {

			String result="";
			try {
				// 3.sql문을 만든다.
				// String sql = "insert into member values ('apple2','apple2','apple2','019')";
				// //sql는 싱글따옴표. "쓰면 String"" 이거 끝나는줄암
				String sql = "select name from member where id=?"; // ?갯수 하나
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, id);// 1번 물음표에 id를 넣어라.

				// PreparedStatement: sql을 나타내는 부품.
				// ps부품을 2단계에서 획득한 con부품이 만들어서 리턴.
				System.out.println("3.sql문 생성 성공!!");

				// 4.sql문을 mysql로 전송한다.
				// int result = ps.executeUpdate(); //executeUpdate는 무조건 int로 반환해서.. 테이블로 갖고올려면
				ResultSet rs = ps.executeQuery();// 이거 써줘야함. 해당 컬럼의 값을 나타내주는애 ★

				System.out.println("4.sql문 전송 성공!");

				if (rs.next()) {
					result = rs.getString(1);

					System.out.println("rs.next() true, 겟스트링성공");
				} else {// rs.next() false 가 false일때
					System.out.println("rs.next() fasle");
					result="0";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}return result;

	}

	public int update(JoinDto bag) {
		int result = 0;

		
			// 3.sql문을 만든다.
			try {
				String sql = "update member set pw=?,email=?,tel=?,address=?,birthday=? where id=?";
				PreparedStatement ps = con.prepareStatement(sql);// con이 가져와줌

				ps.setString(1, bag.getPw());
				ps.setString(2, bag.getEmail());
				ps.setString(3, bag.getTel());
				ps.setString(4, bag.getAddress());
				ps.setString(5, bag.getBirthday());
				ps.setString(6, bag.getId());
				System.out.println("3. SQL문 연결성공!!");

				// 4.sql문을 mysql로 전송한다.
				result = ps.executeUpdate();
				System.out.println("4. SQL문 전송 성공!");
				System.out.println("SQL문 수행개수 " + result);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


		return result;
	} // create end

	public int delete(String id) {
		int result = 0;
		
			// 3.sql문을 만든다.
			try {
				String sql = "delete from member where id=?";
				PreparedStatement ps = con.prepareStatement(sql);// con이 가져와줌
				ps.setString(1,id);
				System.out.println("3. SQL문 연결성공!!");

				// 4.sql문을 mysql로 전송한다.
				result = ps.executeUpdate();
				System.out.println("4. SQL문 전송 성공!");
				System.out.println("SQL문 수행개수 " + result);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return result;
	} // create end
	
} // class
