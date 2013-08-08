package org.shinyul.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import org.apache.log4j.Logger;
import org.json.JSONException;
import org.shinyul.domain.*;
import org.shinyul.service.SchedulerSevice;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


@Component
public class SchedulerUtil {
	
	private static final int DEVIDENUM = 1000;
	
	private Logger logger = Logger.getLogger(SchedulerUtil.class);
	@Inject
	private SchedulerSevice service;	
	

	//@Scheduled(fixedRate = 10000000)
	@Scheduled(cron="0 0 3 ? * SAT")
	public void apiDown()  {
		  
		// 파일 어드레스
		  String marketType ="market";
		  String marketUrl = "http://openAPI.seoul.go.kr:8088/756e696f6e31313632313634/json/ListTraditionalMarket/1/1000";
		  
		  String superstoreType = "superstore";
		  
		  List<String> list = new ArrayList<String>();
		  
		  for (int i = 0; i < 10; i++) {
			  list.add(i, "http://openAPI.seoul.go.kr:8088/756e696f6e31313632313634/json/ListNecessariesPricesService/"+((i*DEVIDENUM)+1)+"/"+((i+1)*DEVIDENUM)); 
		  }		 

		  // 각 url 제이슨 페이지 링크 연결
		  try {
				service.deleteAPIMarket();
				logger.info("====market 지움====~~~~~~~!!");
				seoulAPI(marketUrl, marketType, 0);
				logger.info("====market 갱신끝====~~~~~~~!!");
				
				Thread.sleep(10000);
				
				service.deleteAPISuperstore();
				logger.info("====superStore 지움====~~~~~~~!!");
				for (int i = 0; i < 10; i++) {				
					seoulAPI(list.get(i),superstoreType, i);
					logger.info("====superStore  갱신 중... page====~~~~~~~!! : " + i);
					Thread.sleep(5000);
				}
				logger.info("====superStore  갱신 끝... ====~~~~~~~!! : ");				
			} catch (InterruptedException e) {
				logger.error("====apiDown=error====~~~~~~~!!");	
			}
	}

	public void seoulAPI(String url,String type, int page)  {
		
		  	/*  org.json.JSONObject json;*/
			try {	
				logger.info("====seoulAPI json=들어왔어====");			    
			    
			    if (type.equals("market")) {	
			    	
			    	org.json.JSONObject jsonM = readJsonFromUrl(url);

			    	logger.info("========seoulAPI=market=if=들어옴=========");
			    	System.out.println("========seoulAPI=market=if=들어옴=========");
			    	
			    	org.json.JSONObject market = jsonM.getJSONObject("ListTraditionalMarket");
				    
				    org.json.JSONArray rows = market.getJSONArray("row");
				 
				    int num = ((int)((page * DEVIDENUM + 1)/DEVIDENUM)*DEVIDENUM + 1);
				    logger.info("========seoulAPI=market=if=arraylangth()=확인========"+ rows.length() + num);
				    
				    for (int i = 0; i < rows.length(); i++) {
				    		
				    	MarketVO vo= new MarketVO();
				    	
						org.json.JSONObject oneRow = (org.json.JSONObject)rows.get(i);
						
						vo.setMarIdx(num++);
						vo.setmCode(Integer.parseInt(oneRow.get("M_CODE").toString()));	
				    	vo.setGuname(oneRow.get("GUNAME").toString());	
				    	vo.setMarId(oneRow.get("M_NAME").toString());	
					    vo.setmAddr(oneRow.get("M_ADDR").toString());	
				        vo.setmTel(oneRow.get("M_TEL").toString());
				        vo.setLat(oneRow.get("LAT").toString());
				        vo.setLng(oneRow.get("LNG").toString());				    
				      
				        String check =  service.registerAPIMarket(vo);
				    }
					
				}else if (type.equals("superstore")) {
					
					org.json.JSONObject jsonS = readJsonFromUrl(url);
					
					System.out.println("========seoulAPI=superstore=if=들어옴=========");
			    	
					org.json.JSONObject superstore = jsonS.getJSONObject("ListNecessariesPricesService");
				    
				    org.json.JSONArray rows = superstore.getJSONArray("row");
				 
				    int num = ((int)((page * DEVIDENUM + 1)/DEVIDENUM)*DEVIDENUM + 1);
				    System.out.println("========seoulAPI=superstore=if=arraylangth()=확인========" + rows.length() + num);
				    
				    for (int i = 0; i < rows.length(); i++) {				    	
						
				    	SuperstoreVO vo= new SuperstoreVO();
				    	
						org.json.JSONObject oneRow = (org.json.JSONObject)rows.get(i);
				    	
						vo.setPriceIdx(num++);
						vo.setpSeq(oneRow.get("P_SEQ").hashCode());
						vo.setmSeq(oneRow.get("M_SEQ").hashCode());	
						vo.setmName(oneRow.get("M_NAME").toString());	
						vo.setaSeq(oneRow.get("A_SEQ").hashCode());
						vo.setaName(oneRow.get("A_NAME").toString());
						vo.setaUnit(oneRow.get("A_UNIT").toString());
						vo.setaPrice(oneRow.get("A_PRICE").toString());
						vo.setpYearMonth(oneRow.get("P_YEAR_MONTH").toString());	
						vo.setAddCol(oneRow.get("ADD_COL").toString());
						vo.setpDate(oneRow.get("P_DATE").toString());
						vo.setmTypeCode(oneRow.get("M_TYPE_CODE").toString());
						vo.setmTypeName(oneRow.get("M_TYPE_NAME").toString());
						vo.setmGuCode(Integer.parseInt(oneRow.get("M_GU_CODE").toString()));	
						vo.setmGuName(oneRow.get("M_GU_NAME").toString());

						String check = service.registerAPISuperstore(vo);					
				    }
				}
			} catch (IOException e) {
				logger.error("seoulAPI() IOException~~~error~~~~~!!");					
			} catch (JSONException e) {
				logger.error("seoulAPI() JSONException~~~error~~~~~!!");				
			}		    
	 }

	  public org.json.JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
		    InputStream is = new URL(url).openStream();
		    try {
		      BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
		      String jsonText = readAll(rd);
		      
		     /* System.out.println(jsonText);*/
		      
		      org.json.JSONObject json = new org.json.JSONObject(jsonText);
		      return json;
		    } finally {
		    	try { is.close();} catch (Exception e) {} 
		    }
	  }
	  
	  private String readAll(Reader rd) throws IOException {
		    StringBuilder sb = new StringBuilder();
		    int cp;
		    while ((cp = rd.read()) != -1) {
		      sb.append((char) cp);
		    }
		    return sb.toString();
		  }
}


