package com.wy.util;

import java.sql.*;

public class JDBConnection {

	private static Connection conn = null; // ����Connection��Ķ���
	private static Statement st = null; // ����Statement��Ķ���
	private ResultSet rs = null; // ����ResultSet��Ķ���

	private String dbUrl = "jdbc:mysql://localhost:3306/db_wuliu";
	private String dbUserName = "root";
	private String dbPassword = "123456";
	private String jdbcName = "com.mysql.jdbc.Driver";

	/**
	 * ��ȡ���ݿ�����
	 * 
	 * @return
	 * @throws Exception
	 */
	public Connection getCon() throws Exception {
		Class.forName(jdbcName);
		Connection con = DriverManager.getConnection(dbUrl, dbUserName,
				dbPassword);
		return con;
	}

	public void close(Connection con) throws Exception {
		if (con != null) {
			con.close();
		}
	}

	public ResultSet executeQuery(String sql) throws Exception {
		conn = this.getCon();
		try {
			st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			rs = st.executeQuery(sql); // ִ�ж����ݿ�Ĳ�ѯ����
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Query Exception"); // �ڿ���̨�������쳣��Ϣ
		} 
		return rs; // ����ѯ�Ľ��ͨ��return�ؼ��ַ���
	}

	public boolean executeUpdata(String sql) {
		try {
			st = conn.createStatement(); // ����������������
			st.executeUpdate(sql); // ִ����ӡ��޸ġ�ɾ������
			return true; // ���ִ�гɹ��򷵻�true
		} catch (Exception e) {
			e.printStackTrace();
			return false; // ���ִ�гɹ��򷵻�false
		}
	}

}
