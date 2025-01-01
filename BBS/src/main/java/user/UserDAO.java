package user;

/* 로그인 기능 만드는 페이지, 
 * 사용자가 입력한 아이디와 비밀번호 일치하는지 확인해줌 
 * (사용자 정보를 DB에서 확인하는 일을 함)
 * */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:9000/BBS";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver"); //mysql 드라이버를 찾음, 드라이버는 mysql에 접속할 수 있게 해주는 매개체  
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch (Exception e) { //예외처리 
			e.printStackTrace(); //오류났을때 오류페이지띄움 
		}
	}
	
	public int login(String userID, String userPassword) {  //유저 아이디와 비번을 받아 로그인 시도하는 함수 작성 
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?"; //유저테이블에서 해당 사용자 비번 가져옴 
		try {
			pstmt = conn.prepareStatement(SQL); //해킹방지 ..법이래요 이중보안 
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				}else { 
					return 0; // 비밀번호 불일치
				}
				
			}return -1;  //아이디가 없음
			
		}catch (Exception e) {  //예외처리 
			e.printStackTrace(); //예외인경우 창 띄움 
		}
		return -2; //데이터베이스 오류 
	}
	
	public int join(User user) { //한명의 사용자 입력받음. user(VO)클래스에서 만들어질 수 있는 하나의 인스턴스가 됨 
		String SQL = "INSERT INTO USER VALUES (?,? ?,?,?)";  //db에서 한명의 사용자가 사용할 수 있는 속성 5개
		try {
			pstmt = conn.prepareStatement(sql);//프리페어드 스테이트먼트 문구 -> connection으로 위 문장을 이용해서 rkRhdha
			pstmt.setString(1, user.getUserID()); //각각 물음표에 해당하는 값 넣어줌 . 매개변수로 받은 유저 인스턴스에 
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //DB 오류 
	}
}
