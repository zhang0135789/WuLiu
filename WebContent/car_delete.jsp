<%@ page contentType="text/html; charset=GBK" %>
<jsp:useBean id="connection" scope="page" class="com.wy.JDBConnection"/>
<html>
<head>
<title>
CarMessage_delete page
</title>
</head>
<body bgcolor="#ffffff">
<%
String sql="delete tb_CarMessage where Code="+request.getParameter("id");
boolean bb=connection.executeUpdata(sql);
if(bb)
{
%>
<script language="javascript">
 alert("������Ϣ�Ѿ�ɾ��");
</script>
<%
response.sendRedirect("car_select.jsp");
}else
{
%>
<script language="javascript">
 alert("������Ϣɾ��ʧ��!!!");
history.back();
</script>
<%
}
%>
</body>
</html>
