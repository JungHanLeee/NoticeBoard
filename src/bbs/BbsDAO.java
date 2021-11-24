package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {

	private Connection conn; //�ڹٿ� �����ͺ��̽��� ����
	private ResultSet rs; //����� �޾ƿ���
	
	//�⺻ ������
	//UserDAO�� ����Ǹ� �ڵ����� �����Ǵ� �κ�
	//�޼ҵ帶�� �ݺ��Ǵ� �ڵ带 �̰��� ������ �ڵ尡 ����ȭ�ȴ�
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
		String SQL="SELECT NOW()"; //���� �ð��� �����´�
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL); //���� ����Ǿ��ִ� ��ü(conn)�� �̿��ؼ� SQL������ ���� �غ�ܰ� �� ������ش�
			rs=pstmt.executeQuery(); //������ �������� �� ������ ����� ������ �ش�
			if(rs.next()) { //���� �����Ѵٸ�
				return rs.getString(1); //���� ��¥ ��ȯ
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //�����ͺ��̽� ����
		
	}
	public int getNext() {
		String SQL="SELECT bbsID FROM BBS ORDER BY bbsID DESC"; //���� �������� ���� �Խù��� ��ȣ�� �����´�
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL); //���� ����Ǿ��ִ� ��ü(conn)�� �̿��ؼ� SQL������ ���� �غ�ܰ� �� ������ش�
			rs=pstmt.executeQuery(); //������ �������� �� ������ ����� ������ �ش�
			if(rs.next()) { //���� �����Ѵٸ�
				return rs.getInt(1)+1; //���� ��¥ ��ȯ
			}
			return 1;// ù ��° �Խù��� ���
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����	
	}
	public int write(String bbsTitle,String userID,String bbsContent) {
		String SQL="INSERT INTO BBS VALUES(?,?,?,?,?,?)"; //bbs ���̺�ȿ� 6���� ���ڸ� �־��ش�
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL); //���� ����Ǿ��ִ� ��ü(conn)�� �̿��ؼ� SQL������ ���� �غ�ܰ� �� ������ش�
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
		return -1; //�����ͺ��̽� ����	
	}
	public ArrayList<Bbs> getList(int pageNumber){
		String SQL="SELECT * FROM BBS WHERE bbsID <? AND bbsAvailable=1 ORDER BY bbsID DESC LIMIT 10"; //���� �������� ���� �Խù��� ��ȣ�� �����´�
		ArrayList<Bbs> list=new ArrayList<Bbs>();	//bbs Ŭ�������� ������ �ν��Ͻ��� �����ϴ� ����Ʈ
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL); //���� ����Ǿ��ִ� ��ü(conn)�� �̿��ؼ� SQL������ ���� �غ�ܰ� �� ������ش�
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs=pstmt.executeQuery(); //������ �������� �� ������ ����� ������ �ش�
			while(rs.next()) { //���� �����Ѵٸ�
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
		String SQL="SELECT * FROM BBS WHERE bbsID <? AND bbsAvailable=1"; //���� �������� ���� �Խù��� ��ȣ�� �����´�
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL); //���� ����Ǿ��ִ� ��ü(conn)�� �̿��ؼ� SQL������ ���� �غ�ܰ� �� ������ش�
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs=pstmt.executeQuery(); //������ �������� �� ������ ����� ������ �ش�
			if(rs.next()) { //���� �����Ѵٸ�
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public Bbs getBbs(int bbsID) {
		String SQL="SELECT * FROM BBS WHERE bbsID =?"; //���� �������� ���� �Խù��� ��ȣ�� �����´�
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL); //���� ����Ǿ��ִ� ��ü(conn)�� �̿��ؼ� SQL������ ���� �غ�ܰ� �� ������ش�
			pstmt.setInt(1, bbsID);
			rs=pstmt.executeQuery(); //������ �������� �� ������ ����� ������ �ش�
			if(rs.next()) { //���� �����Ѵٸ�
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











