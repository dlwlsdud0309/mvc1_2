package nb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import nb.vo.NoticeBoards;

public class NoticeBoardsDao {
	public NoticeBoards getNBD(String num) throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "123456";

		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, user, pw);

		//String sql = "select * from noticeboards where seq='"+num+"'"; //num이 String이기 때문에 작은따옴표 사용

		//Statement st = conn.createStatement();
		//ResultSet rs = st.executeQuery(sql);

		String sql = "select * from noticeboards where seq=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(num));

		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		//NoticeBoards.java에 저장(setting)
		NoticeBoards nb = new NoticeBoards();
		nb.setSeq(rs.getInt("seq"));
		nb.setHit(rs.getInt("hit"));
		nb.setWriter(rs.getString("writer"));
		nb.setRegdate(rs.getDate("regdate"));
		nb.setTitle(rs.getString("title"));
		nb.setContent(rs.getString("content"));
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return nb;
	}
}
