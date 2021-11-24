package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {

	private Connection conn; //자바와 데이터베이스를 연결
	private ResultSet rs; //결과값 받아오기
	
	//기본 생성자
	//UserDAO가 실행되면 자동으로 생성되는 부분
	//메소드마다 반복되는 코드를 이곳에 넣으면 코드가 간소화된다
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "990401";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getDate() {
		String SQL="SELECT NOW()"; //현재 시간을 가져온다
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL); //현재 연결되어있는 객체(conn)을 이용해서 SQL문장을 실행 준비단계 로 만들어준다
			rs=pstmt.executeQuery(); //실제로 실행했을 때 나오는 결과를 가져다 준다
			if(rs.next()) { //값이 존재한다면
				return rs.getString(1); //현재 날짜 반환
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
		
	}
	public int getNext() {
		String SQL="SELECT bbsID FROM BBS ORDER BY bbsID DESC"; //가장 마지막에 쓰인 게시물의 번호를 가져온다
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL); //현재 연결되어있는 객체(conn)을 이용해서 SQL문장을 실행 준비단계 로 만들어준다
			rs=pstmt.executeQuery(); //실제로 실행했을 때 나오는 결과를 가져다 준다
			if(rs.next()) { //값이 존재한다면
				return rs.getInt(1)+1; //현재 날짜 반환
			}
			return 1;// 첫 번째 게시물일 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류	
	}
	public int write(String bbsTitle,String userID,String bbsContent) {
		String SQL="INSERT INTO BBS VALUES(?,?,?,?,?,?)"; //bbs 테이블안에 6개의 인자를 넣어준다
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL); //현재 연결되어있는 객체(conn)을 이용해서 SQL문장을 실행 준비단계 로 만들어준다
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류	
	}
	public ArrayList<Bbs> getList(int pageNumber){
		String SQL="SELECT * FROM BBS WHERE bbsID <? AND bbsAvailable=1 ORDER BY bbsID DESC LIMIT 10"; //가장 마지막에 쓰인 게시물의 번호를 가져온다
		ArrayList<Bbs> list=new ArrayList<Bbs>();	//bbs 클래스에서 나오는 인스턴스를 보관하는 리스트
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL); //현재 연결되어있는 객체(conn)을 이용해서 SQL문장을 실행 준비단계 로 만들어준다
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs=pstmt.executeQuery(); //실제로 실행했을 때 나오는 결과를 가져다 준다
			while(rs.next()) { //값이 존재한다면
				Bbs bbs=new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean nextPage(int pageNumber){
		String SQL="SELECT * FROM BBS WHERE bbsID <? AND bbsAvailable=1"; //가장 마지막에 쓰인 게시물의 번호를 가져온다
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL); //현재 연결되어있는 객체(conn)을 이용해서 SQL문장을 실행 준비단계 로 만들어준다
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs=pstmt.executeQuery(); //실제로 실행했을 때 나오는 결과를 가져다 준다
			if(rs.next()) { //값이 존재한다면
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public Bbs getBbs(int bbsID) {
		String SQL="SELECT * FROM BBS WHERE bbsID =?"; //가장 마지막에 쓰인 게시물의 번호를 가져온다
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL); //현재 연결되어있는 객체(conn)을 이용해서 SQL문장을 실행 준비단계 로 만들어준다
			pstmt.setInt(1, bbsID);
			rs=pstmt.executeQuery(); //실제로 실행했을 때 나오는 결과를 가져다 준다
			if(rs.next()) { //값이 존재한다면
				Bbs bbs=new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}











