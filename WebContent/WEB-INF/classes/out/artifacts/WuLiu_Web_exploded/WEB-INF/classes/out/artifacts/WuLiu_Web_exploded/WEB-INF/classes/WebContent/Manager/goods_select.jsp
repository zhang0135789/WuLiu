<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<jsp:useBean id="connection" scope="page" class="com.wy.util.JDBConnection"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../CSS/style.css">
<title>
Goods_show page
</title>
</head>
<%!
ResultSet rs=null;
String sql,sqlshow;
int n;
int pagesize=10;
int rowcount=0;
int pagecount=1;
%>

<body bgcolor="#ffffff"><jsp:include page="mtop.jsp"/>
<table width="783" height="137" border="1" align="center" cellpadding="0" cellspacing="0"bordercolor="#FFFFFF" bordercolordark="#333333" bordercolorlight="#FFFFFF">
  <tr>
  <td width="100%" colspan="9" height="60" align="center">
     ������Ϣ
  </td>
  </tr>
  <tr align="center">
    <td width="11%" height="29">��������</td>
    <td width="11%" height="29">��������</td>
    <td width="11%" height="29">��������</td>
    <td width="11%" height="29">������λ</td>
    <td width="11%" height="29">��ʼʡ��</td>
    <td width="11%" height="29">��ʼ����</td>
    <td width="11%" height="29">�ִ�ʡ��</td>
    <td width="11%" height="29">�ִ����</td>
    <td width="12%" height="29">����</td>
  </tr>  <%
    sql="select * from tb_GoodsMeg order by IssueDate desc";
try
{
 rs=connection.executeQuery(sql);
if(!rs.next())
{
%>
<script language="javascript">
	alert("û�л�����Ϣ");
        history.back();
</script>
<%
}else
{
rs.last();
rowcount=rs.getRow();
int showpage=1;
pagecount=((rowcount%pagesize)==0?(rowcount/pagesize):(rowcount/pagesize)+1);
 String topage=request.getParameter("topage");
if(topage!=null)
{
showpage=Integer.parseInt(topage);
if(showpage>pagecount){
  showpage=pagecount;
  }else if(showpage<=0){
  showpage=1;
  }
}
rs.absolute((showpage-1)*pagesize+1);
for(int i=1;i<=pagesize;i++)
{
n=rs.getInt("ID");
%>
<tr align="center">
<td width="11%" height="29"><%=rs.getString("GoodsStyle")%></td>
<td width="11%" height="29"><%=rs.getString("GoodsName")%></td>
<td width="11%" height="29"><%=rs.getString("GoodsNumber")%></td>
<td width="11%" height="29"><%=rs.getString("GoodsUnit")%></td>
<td width="11%" height="29"><%=rs.getString("StartProvince")%></td>
<td width="11%" height="29"><%=rs.getString("StartCity")%></td>
<td width="11%" height="29"><%=rs.getString("EndProvince")%></td>
<td width="11%" height="29"><%=rs.getString("EndCity")%></td>
<td width="12%" height="29">
    <p align="center"><a href="goods_xiangxi.jsp?id=<%=n%>">��ϸ</a></td>
</tr>
<%
if(!rs.next())
break;
}
%>
<tr>
    <td width="786" height="30" colspan="9" align="right">
<table width="786" align="center">
	<tr>
    <td width="786" height="30" colspan="9" align="right">
        ��<%=pagecount%>ҳ&nbsp;&nbsp;
        <a href="goods_select.jsp?topage=<%=1%>">��һҳ</a>&nbsp;&nbsp;
        <a href="goods_select.jsp?topage=<%=showpage-1%>">��һҳ</a>&nbsp;&nbsp;
        <a href="goods_select.jsp?topage=<%=showpage+1%>">��һҳ</a>&nbsp;&nbsp;
        <a href="goods_select.jsp?topage=<%=pagecount%>">���һҳ</a>       
</td>
</tr>
</table>
</td>
  </tr>
<%
}
}catch(Exception e)
{e.printStackTrace();}
%>
</table>
</body><jsp:include page="down.jsp"/>
</html>
