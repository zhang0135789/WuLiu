<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<jsp:useBean id="connection" scope="page" class="com.wy.util.JDBConnection"/>
<% request.setCharacterEncoding("gb2312"); %>
<link rel="stylesheet" href="CSS/style.css">
<html>
<head>
<title>�һ�����</title>
</head>
<body>
<%
try
{
	String username=request.getParameter("username");
	String email=request.getParameter("email");
	String question=request.getParameter("question");
	String result=request.getParameter("result");
	String sql="select * from tb_Customer where Name='"+username+"' and Email='"+email+"' and Question='"+question+"' and Result='"+result+"'";
	ResultSet rs=connection.executeQuery(sql);
	String password="";
	String pass="���������:";
	if(rs.next()){
		 password=rs.getString("password");
%>
<center><h2>
��ע�Ᵽ���������룡��
<br>
���������ǣ�<%=password%>
</h2>
  <h2><br>
    <a href="index.jsp">����</a>
  </h2>
</center>
<%
}else{
%>
<script language='javaScript'>
alert('��������Ϣ����');history.back();
</script>
<%
	}
}catch(Exception e)
{System.out.println("�����쳣������");}
%>
</body>
</html>
