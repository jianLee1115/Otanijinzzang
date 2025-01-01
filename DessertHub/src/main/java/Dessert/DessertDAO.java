package Dessert;

import java.sql.*;
import java.util.*;

public class DessertDAO { 

	// 랜덤으로 디저트 하나를 가져오는 메서드
//	public DessertVO getRandom(int limit) {
//		Connection conn = null;
////		Connection conn = DBConnection.getConnection(); // DB 연결
//		String sql = "SELECT * FROM desserts ORDER BY RAND () LIMIT ?"; // SQL 쿼리 (랜덤으로 디저트 1개 가져오기)
//		DessertVO dessert = null; // 결과를 저장할 DessertVO 객체
//
//		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
//			pstmt.setInt(1, limit); // 쿼리에 제한 개수 지정 (랜덤 개수)
//			ResultSet rs = pstmt.executeQuery(); // 쿼리 실행
//
//			if (rs.next()) {
//				int dIndex = rs.getInt("D_INDEX");
//				String dName = rs.getString("D_NAME");
//				String dImg = rs.getString("D_IMG");
//				String dChara = rs.getString("D_CHARA");
//
//				dessert = new DessertVO(dIndex, dName, dImg, dChara); // 디저트 정보를 VO 객체에 저장
//			}
//
//		} catch (SQLException e) {
//			e.printStackTrace(); //예외처리
//		}
//
//		return dessert ; //디저트 객체 반환
//		
//
//	}
	
	public DessertVO getRandom(int limit) {
		
		DessertVO retvo = new DessertVO(1, "쿠키", "cookie", "sweet");
		
		return retvo;
	}

	// 예시: 64개의 랜덤 디저트 가져오기
	public List<DessertVO> getRandomList(int count) {
		Connection conn = null;
//		Connection conn = DBConnection.getConnection();
		String sql = "SELECT * FROM desserts ORDER BY RAND() LIMIT ?";
		List<DessertVO> dessertList = new ArrayList<>();

		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, count);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int dIndex = rs.getInt("D_INDEX");
				String dName = rs.getString("D_NAME");
				String dImg = rs.getString("D_IMG");
				String dChara = rs.getString("D_CHARA");

				DessertVO dessert = new DessertVO(dIndex, dName, dImg, dChara);
				dessertList.add(dessert);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return dessertList;
	}
	
	// 범주로 추리기 
    public DessertVO getRandomByChara(String chara) {
    	
     	 Connection conn = null;
//        Connection conn = DBConnection.getConnection();  // DB 연결
        String sql = "SELECT * FROM desserts WHERE D_CHARA = ? ORDER BY RAND() LIMIT 1";  // 주어진 chara에 해당하는 디저트 1개 랜덤 가져오기
        DessertVO dessert = null;

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, chara);  // 쿼리의 특징(chara) 값 바인딩
            ResultSet rs = pstmt.executeQuery();  // 쿼리 실행

            if (rs.next()) {  // 결과가 있으면
                int dIndex = rs.getInt("D_INDEX");  // 디저트 고유 ID
                String dName = rs.getString("D_NAME");  // 디저트 이름
                String dImg = rs.getString("D_IMG");  // 디저트 이미지 경로
                String dChara = rs.getString("D_CHARA");  // 디저트 특징

                dessert = new DessertVO(dIndex, dName, dImg, dChara);  // 디저트 객체 생성
            }
        } catch (SQLException e) {
            e.printStackTrace();  // 예외 처리
        }

        return dessert;  // 디저트 객체 반환
    }
    
    //getMBTIResult() 추가 

}



