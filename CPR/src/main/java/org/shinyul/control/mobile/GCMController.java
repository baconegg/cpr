package org.shinyul.control.mobile;

import java.io.IOException;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.shinyul.domain.ReserveVO;
import org.shinyul.domain.mobile.GCMVO;
import org.shinyul.service.mobile.GCMService;
import org.shinyul.util.Constant;
import org.shinyul.util.mobile.GCMUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;

@Controller
@RequestMapping(Constant.ControllerName.DEFALT + Constant.ControllerName.GCM)
public class GCMController {

	private static final Logger logger = Logger.getLogger(GCMController.class);

	@Inject
	GCMService gcm;
	
	// ////////////////////////////////////////////////////////////////////////////////////
	// gcm regiId add
	// /////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = Constant.ControllerAction.ADD_REG_ID, method = RequestMethod.POST)
	public @ResponseBody int addregId(String regId, String memberIdx, String phoneNumber) {

		logger.info("addRegId");
		logger.info("regId : " + regId);
		logger.info("memberIdx : " + memberIdx);
		
		StringBuilder builder = new StringBuilder();
		builder.append("0").append(phoneNumber.substring(3));
		phoneNumber = builder.toString();
		
		logger.info("phoneNumber : " + phoneNumber);
		
		GCMVO vo = new GCMVO();
		vo.setRegId(regId);
		vo.setMemberIdx(Integer.valueOf(memberIdx).intValue());
		vo.setMemberTel(phoneNumber);
		return Integer.parseInt(gcm.control(Constant.GCM.ADD_REG_ID, vo));
	}

	// ////////////////////////////////////////////////////////////////////////////////////////////////
	// gcm alert
	// ////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = Constant.ControllerAction.ALERT, method = RequestMethod.POST)
	public @ResponseBody String alertReserve(ReserveVO vo) {

		logger.info("into the alertReserve");
		logger.info(vo);
//		System.out.println("into the alertReserve");
				
		int totalPrice = (vo.getProductPrice() * vo.getReserveQty());
		int reserveQty = vo.getReserveQty();
		Sender sender = new Sender(GCMUtil.API_KEY);
		Message message = null;
		// 입력받은 번호가 존재하는지를 확인할 쿼리
		
		GCMVO deviceNo = new GCMVO();
		deviceNo.setSelIdx(vo.getSelIdx());
		String device = gcm.control(Constant.GCM.ALERT_RESERVE, deviceNo);
//		if(device.equls("100")){	};
		Result result = null;
		try {
			// 메세지, 디바이스, 재시도 횟수
			message = new Message.Builder()
					.collapseKey("1")
					.timeToLive(3)
					.delayWhileIdle(true)
					.addData(Constant.GCM.PROTOCOL, GCMUtil.CONFIRM_RESERVE)
					.addData(Constant.GCM.CONTENT, Constant.GCM.CONTENT_VAL)
					.addData(Constant.GCM.MEBER_NAME, vo.getMemberName())
					.addData(Constant.GCM.PRODUCT_NAME, vo.getProductName())
					.addData(Constant.GCM.RESERVE_QTY, String.valueOf(reserveQty))
					.addData(Constant.GCM.RECEIVE_TIME, vo.getReserveReceiveTime())
					.addData(Constant.GCM.RECEIVE_MEMO, vo.getReserveMemo())
					.addData(Constant.GCM.TOTAL_PRICE, String.valueOf(totalPrice))
					.addData(Constant.GCM.PRODUCT_INFO, vo.getProductInfo())
					.build();
			 //String regId= "APA91bGfhIzotixtQqyB_IvEWmCdIjORP5ZNnGXj2l-EFMNoGT863KenWkbemIc0jLnO9IMPB95XiffjM9az4pDjfw2K1NSIhjAWBRJRfm77fRfMtW48GtQwKMS9ZpNaC-3mpqHf9ff_2ZzFacfi5xLz3Y4dYIJiqQ";
			 //			String regId = "APA91bEi_bdbAeLqQ24BNm_CDHdXwIgXgD0Hkw5aOYqD_2e2gi-zg5uiKe46QDU14zKixr19bg3tZagwammXvC9YTZqWF8V3e5z921Z4cVonQw_NXfv18kEBFzQd3rOaNxHh2A6lM3lGXuWSpcIhWiquQ8Qf08gjJw";
			// List<String> devices = new ArrayList<String>();
			// devices.add(regId);
			 result = sender.send(message, device, 5);
			// sender.send(message, regId, 5);
			logger.info(result);
		} catch (IOException e) {
			e.printStackTrace();
		}

		String check = null;
		// 결과 처리
		if (result.getMessageId() != null) {
			// 푸시 전송 성공
			check = result.getMessageId();
			logger.info("성공");
		} else {
			String error = result.getErrorCodeName(); // 에러 내용 받기
			logger.info("실패");
			logger.info(error);
			check = "실패";
			// 에러 처리
			// if(Constants.ERROR_INTERNAL_SERVER_ERROR.equlas(error)) {
			// //구글 푸시 서버 에러
			// }
			// else {
			//
			// };
		}
		
		return check;
	}
}
