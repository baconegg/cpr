<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 

<html>
    <head>
        <tiles:insertAttribute name="meta" />
    </head>
    <body class="single single-portfolio postid-83 chrome wpb-js-composer js-comp-ver-3.3.2" style="margin-left: 1px;">
       
       <div id="content_wrap">
			<!-- <div id="header"> -->
	            <tiles:insertAttribute name="header" />
	        <!-- </div> -->
	        
	        <!-- <div id="body"> -->	            
	            <tiles:insertAttribute name="body" />
	        <!-- </div> -->
	    </div>  
       
        <!-- <div id="footer"> -->
            <tiles:insertAttribute name="footer" />
        <!-- </div> -->
               
    </body>
</html>