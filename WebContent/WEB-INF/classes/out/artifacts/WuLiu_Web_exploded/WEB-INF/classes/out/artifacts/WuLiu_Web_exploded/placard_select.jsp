<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connection" scope="page" class="com.wy.util.JDBConnection"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="CSS/style.css">
<title></title>
</head>
<%!
String sql;
ResultSet rs=null;
int code;
%>
<body>
<table width="100%" height="238" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100%" height="39"  align="center">
 <font size="7">������Ϣ</font></td>
  </tr>
<%
sql="select * from tb_Placard where ID="+request.getParameter("id");
try
{
rs=connection.executeQuery(sql);
if(rs.next())
{
code=rs.getInt("ID");
%>
  <tr>
    <td width="100%" height="37">���⣺
<%=rs.getString("Title")%></td>
  </tr>
  <tr>
    <td width="100%" height="37">*  ע����������������д1000����</td>
  </tr>
  <tr>
    <td width="100%" height="36">
   <textarea rows="10" name="content" cols="100">
   <%=rs.getString("Content")%></textarea></td>
  </tr>
<tr>
<td width="100%" height="27">������:
<%=rs.getString("Author")%></td>
</tr>
<tr>
<td width="100%" height="27">����ʱ��:
<%=rs.getDate("IssueDate")%> </td>
</tr>
<tr>
<td width="100%" height="27">���º�:
<%=code%></td>
</tr>
<%
}
}catch(Exception e)
{
e.printStackTrace();
}
%>
<tr><td width="100%" height="27" align="center">
<input type="button" name="wclose" value="�رմ���" onClick="window.close()">
</td>
</tr>
</table>

</body>
</html>
