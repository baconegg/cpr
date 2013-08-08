package org.shinyul.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

@Component
public class GetAddressUtil {
	
	/*public GetAddressUtil getAddressUtil;*/
	
	public static String mapXmlParser(String lng, String lat) {
		Logger logger = Logger.getLogger("parsing");
		String apiKey =  "a429e57f79873d7391d339b97a77c52dcc64144f";
	    String result = "";
	    try {
	    	
	    	/*  String[] maps = new String[2];	
	      	maps = mapAddr.split(",");*/
	    	
	      String uri = "http://apis.daum.net/local/geo/coord2addr?apikey="
	          + apiKey + "&longitude=" + lng + "&latitude="
	          + lat + "&format=simple&output=xml&inputCoordSyst";
	      DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	      DocumentBuilder builder = factory.newDocumentBuilder();
	      Document document = builder.parse(uri);
	      NodeList rcodes = document.getElementsByTagName("rcode");
	     
	      for (int i = 0; i < rcodes.getLength(); i++) {
	        Node rcode = rcodes.item(i);
	        NamedNodeMap Attrs = rcode.getAttributes();
	       	        
	        for (int j = 1; j < Attrs.getLength(); j++) {
	          Node attr = Attrs.item(j);
	          result += (attr.getNodeValue() + (i < Attrs.getLength() - 1 ? " " : ""));
	        }
	      }
//	      result = new String(result.getBytes("UTF-8"));
	      System.out.println(result);
	      
	    } catch (UnsupportedEncodingException e) {
	    	logger.error("GetAddressUtil encode error~~~~~~~!!!!");	    
	    } catch (ParserConfigurationException e) {
	    	logger.error("GetAddressUtil ParserConfiguration error~~~~~~~!!!!");
	    } catch (SAXException e) {
	    	logger.error("GetAddressUtil SAXException error~~~~~~~!!!!");
	    } catch (IOException e) {
	    	logger.error("GetAddressUtil IOException error~~~~~~~!!!!");
	    }
	    return result;
	  } 
	
	/*public static void main(String[] args) {
		mapXmlParser( );
	}*/

}
