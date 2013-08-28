<%@ page language="java" contentType="image/jpg; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
	response.setContentType("image/jpg");
	out.clear();
	out = pageContext.pushBody();    
	
	String fileName = request.getParameter("file");
	InputStream in = new FileInputStream(fileName);
	BufferedInputStream bin = new BufferedInputStream(in);
	OutputStream bos = response.getOutputStream();

	byte[] arr = new byte[1024];
	try {
		while (true) {
			int count = bin.read(arr, 0, arr.length);
			if (count == -1) {
				break;
			}
			bos.write(arr, 0, count);
		}
	} finally {
		if (bos != null) {
			try {bos.flush();bos.close();} catch (Exception e) {};
		}
		if (bin != null) {
			try {bin.close();} catch (Exception e) {};
		}
	}
%>