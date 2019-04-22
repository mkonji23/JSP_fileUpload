<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.File" %>
<%@ page import = "file.FileDTO" %>
<%@ page import = "file.FileDAO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv = "Content-Type" content = "text/html; charset=UTF-8">
	<title>jsp 파일 업로드</title>
</head>
<body>
<%-- 	<%
		String directory = "C:/JSP/upload";
		String files[] =new File(directory).list();
		
		for(String file : files){
			out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file=" +
			URLEncoder.encode(file,"UTF-8")+ "\">" +file +"</a><br>");
		}
	%> --%>
	<%
		ArrayList<FileDTO> fileList = new FileDAO().getList();
	
		for(FileDTO file : fileList)
		{
			out.write("<a href =\"" +request.getContextPath()+"/downloadAction?file="+URLEncoder.encode(file.getFileRealName(),"UTF-8")+
						"\">"+ file.getFileName()+"(다운로드횟수: "+file.getDownloadCount()+")"+"</a><br>");
		}
	
	%>
</body>
</html>