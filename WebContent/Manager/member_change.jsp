<%@ page contentType="text/html; charset=GBK" import="java.sql.*,java.util.*"%>
<jsp:useBean id="connection" scope="page" class="com.wy.JDBConnection"/>
<html>
<head>
<link rel="stylesheet" href="../CSS/style.css">
<title>
Member_change page
</title>
</head>
<script language="javascript">
      function check(){
		if(form1.name.value==""){
			alert("����������û���");
			form1.name.focus();
			return false;
		}

		if(form1.password.value==""){
			alert("��������ע�������");
			form1.password.focus();
			return false;
		}
		if(form1.repassword.value==""){
			alert("������ȷ������");
			form1.repassword.focus();
			return false;
		}
		if(form1.password.value!=form1.repassword.value){
			alert("��������������벻һ��");
			return false;
		}
		if(form1.email.value==""){
			alert("���������Emailַ");
			form1.email.focus();
			return false;
		}


		if(form1.phone.value==""){
			alert("�����������ϵ�绰");
			form1.phone.focus();
			return false;
		}
		if(form1.question.value==""){
			alert("����������ʾ�������ȡ������");
			form1.question.focus;
			return false;
		}
		if(form1.result.value==""){
			alert("������ش�����Ĵ�");
			form1.result.focus();
			return false;
		}
	}
</script>
<%!
ResultSet rs=null;
String sql;
int code;
%>
<body><jsp:include page="mtop.jsp"/>
<%
sql="select * from tb_Customer where ID="+request.getParameter("id");
rs=connection.executeQuery(sql);
while(rs.next())
{
code=rs.getInt("ID");
%>
<form method="POST" action="member_changeConfig.jsp" name="form1">
    <div align="center">
��Ա�޸�
   <p> *&nbsp; ע���������ݱ�����д������</p>
<table width="46%" height="216" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#333333" bordercolorlight="#FFFFFF" >
<tr>
    <td width="100%" align="left" height="34">���֣�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="name" size="20" value="<%=rs.getString("Name")%>"></td>
  </tr>
  <tr>
    <td width="100%" height="16">
      <p>���룺&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="password" name="password" size="20" value="<%=rs.getString("Password")%>"></p>
    </td>
  </tr>
  <tr>
    <td width="100%" height="16">
      <p>ȷ�����룺&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="password" name="repassword" size="20" value="<%=rs.getString("Password")%>"></p>
    </td>
  </tr>
  
  <tr><td width="100%" height="16">
      <p>Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="text" name="email" size="20" value="<%=rs.getString("Email")%>">��</p>
    </td>
    
  </tr>
  <tr>

    <td width="100%" height="16">
      �Ա�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <%String xb=rs.getString("sex");
	  if(xb.equals("man"))
	  {
	  %>
	  ��
      <input type="radio" value="man" checked name="sex">&nbsp;&nbsp;&nbsp;&nbsp;
      Ů<input type="radio" name="sex" value="moman">
	  <%}else
	  {
	  %>
	   ��
      <input type="radio" value="man"  name="sex">&nbsp;&nbsp;&nbsp;&nbsp;
      Ů<input type="radio" name="sex"checked value="moman">
	  <%
	  }
	  %>
    </td>
  </tr>
  <tr>
    <td width="100%" height="16">
      <p>�绰��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="text" name="phone" size="20" value="<%=rs.getString("Phone")%>">
      </p>
    </td>
  </tr>
  <tr>
    <td width="100%" height="16">
    <p>�һ��������⣺&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="question" size="20" value="<%=rs.getString("Question")%>">
    </p>
    </td>
  </tr>
  <tr>
    <td width="100%" height="16">����𰸣�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="result" size="20" value="<%=rs.getString("Result")%>"></td>
  </tr>
<tr>
    <td width="100%" height="16">&nbsp;ID&nbsp;  &nbsp;   &nbsp;  &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;  &nbsp;
      <%=code%><input type="hidden" name="code" size="20"value="<%=code%>"></td>
  </tr>
  <tr>
    <td width="100%" height="16">
    <input type="submit" value="�޸�" name="Submit"onClick="return check()"> ��<input type="reset" value="����">
&nbsp;&nbsp;<a href="member_select.jsp">����</a>
    </td>
  </tr>
</table>
</div>
</form>
<%}%><jsp:include page="down.jsp"/>
</body>
</html>
