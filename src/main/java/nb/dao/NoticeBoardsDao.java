package nb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import nb.vo.NoticeBoards;

public class NoticeBoardsDao {
	public int delete(NoticeBoards nb) throws Exception {
		int cnt = 0;
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "123456";

		Class.forName(driver);
		Connection conn = null;
		conn = DriverManager.getConnection(url, user, pw);
		PreparedStatement pstmt = null;

		String sql = "delete from noticeboards where seq=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, nb.getSeq());

		cnt = pstmt.executeUpdate();
		return cnt;
	}
	
	public int insert(NoticeBoards nb) throws Exception {
		int resultNum = 0;
		//db연결하여 insert
		Connection conn = null;
		PreparedStatement pstmt = null;

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "123456";

		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, pw);

		String sql = "insert into noticeboards(seq, title, writer, content, regdate, hit)";
				sql+= " values((select max(seq)+1 from noticeboards)";
				sql+= ", ?, ?, ?, systimestamp, 0)";
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, nb.getTitle());
		pstmt.setString(2, nb.getWriter());
		pstmt.setString(3, nb.getContent());

		resultNum = pstmt.executeUpdate();
		System.out.println("resultNum : "+resultNum);
		
		return resultNum;
	}
	
	public int edit(NoticeBoards nb) throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "123456";

		Class.forName(driver);
		Connection conn = null;
		conn = DriverManager.getConnection(url, user, pw);

		String sql = "update noticeboards set title=?, content=? where seq=?";

		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, nb.getTitle());
		pstmt.setString(2, nb.getContent());
		pstmt.setInt(3, nb.getSeq());

		//ResultSet rs = null;
		//rs = pstmt.executeQuery();
		//rs.next();

		int cnt = pstmt.executeUpdate();
		
		return cnt;
	}
	
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
