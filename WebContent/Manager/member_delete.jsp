<%@ page contentType="text/html; charset=GBK" %>
<jsp:useBean id="connection" scope="page" class="com.wy.JDBConnection"/>
<html>
<head>
<title>
Member_delete page
</title>
</head>
<%
String code,sql;
%>
<body bgcolor="#ffffff">
<%
 sql="delete tb_Customer where ID="+request.getParameter("id");
boolean bb=connection.executeUpdata(sql);
if(bb)
{
%>
<script language="javascript">
alert("�޸ĳɹ�������");
</script><%
response.sendRedirect("member_select.jsp");
} else
{
%>
<script language="javascript">
alert("�޸�ʧ�ܣ�����");
history.back();
</script><%
}
%>
</body>
</html>
