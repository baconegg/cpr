package org.shinyul.util;

public class Constant {
	
	public class ControllerName{
		public static final String DEFALT = "/";
		public static final String CPR = "/cpr";
		public static final String SPATIAL = "spatial";
		public static final String MEMBER = "member";
		public static final String PRODUCT = "product";
		public static final String REQUEST = "request";
		public static final String RESERVE = "reserve";
		
		//mobile
		public static final String LOGIN = "logIn";
		public static final String WEBVIEW = "webView";
		public static final String GCM = "gcm";
		public static final String SHOP = "shop";
		public static final String WIDGET = "widget";
	}
	
	public class ControllerForm{
		public static final String DEFALT = "/";
		public static final String REGISTER = "/register";
		public static final String VIEW = "/view";
		public static final String MODIFY = "/modify";
		public static final String UPDATE = "/update";
		public static final String REMOVE = "/remove";
		public static final String LIST = "/list";
		public static final String ERROR = "/error";

		//spatial
		public static final String INDEX = "/index";
		public static final String MAP_BY_DISTANCE = "/mapByDistance";
		public static final String PRICE = "/price";
		
		//member
		public static final String JOIN = "/join";
		public static final String SELLER = "/seller";
		public static final String MARKET = "/market";
		public static final String VIEWINFO = "/viewInfo";
		public static final String VIEW_CUSTOMER = "/viewCustomer";
		public static final String VIEW_SELLER = "/viewSeller";
		public static final String CUSTOMER = "/customer";
		
	}
	
	//post method 포함..
	public class ControllerAction{
		public static final String REGISTER = "/registerAction";
		public static final String MODIFY = "/modifyAction";
	
		public static final String REPLY_REGISTER = "/replyRegisterAction";
		public static final String REPLY_REMOVE = "/replyRemove";
		public static final String REPLY_MODIFY = "/replyModify";

		public static final String GET_ADDRESS = "/getAddress";
		
		//spatial
		public static final String POP_MARKET = "/popMarket";
		public static final String GET_MARKET_COORD = "/getMarketCoord";
		public static final String SHOP_INFO = "/shopInfo";
		public static final String DISTANCE_MAP = "/distanceMap";
		public static final String LOAD_SHOP_SLIDE_DATA = "/loadShopSlideData";
		public static final String IS_NEAR_SHOP = "/isNearShop";
		public static final String NEAREST_MARKET = "/nearestMarket";
		public static final String POP_SUPERSTORE = "/popSuperstore";
		public static final String LOAD_PRICE_DATA = "/loadPriceData";
		
		
		//member
		public static final String LOGIN = "/login";
		public static final String LOGOUT = "/logout";
		public static final String SESSION_SET = "/sessionSet";
		public static final String CHECK = "/check";
		public static final String POP_MAP = "/popMap";

		//request
		public static final String REPLY_TENDER = "/replyTender";
		
		//reserve
		public static final String RESERVE_CONFIRM = "/reserveConfirm";
		public static final String RESERVE_CANCEL = "/reserveCancel";
		
		//mobile
		//gcm
		public static final String ADD_REG_ID = "/addRegId";
		public static final String ALERT = "/alert";
		
	}
	
	//멤버
	public class Member{
		public static final String LEV = "memberLev";
		public static final int CUSTOMER = 1;
		public static final int SELLER = 2;

	}
	
	//session 저장값
	public class Session{
		public static final String ID_CHK = "idchk";
		public static final String LOGIN_CHK = "loginchk";
		public static final String MEMBER_IDX = "memberIdx";
		public static final String MEMBER_ID = "memberId";
		public static final String MEMBER_PW = "memberPw";
		public static final String MEMBER_NAME = "memberName";
		public static final String SEL_IDX = "selIdx";
		public static final String MAR_IDX = "marIdx";
		public static final String CUSTOMER_IDX = "customerIdx";

		public static final String CRITERIA = "cri";

		public static final String HPATH = "hpath";
		
		public static final String REQUEST_LIST = "requestList";
		public static final String REQUEST_LIST_VAL = "시장을 선택해 주세요.";

		//mobile login 전용
		public static final String CHK = "chk";
		
		//성공, 실패  여부용 변수
		public static final int ID_OK = 0;
		public static final int PW_OK = 0;
		public static final int PW_FAIL = 1;
		public static final int PW_ETC = 2;

		
		//세션이라기 보단 단순 변수명으로써 사용되는듯... 여기 놔도 되려나??
		public static final String PAGE = "page";
		public static final String KEYWORD = "keyword";
		public static final String SEL_IMG = "selImg";
		public static final String FILE = "file";
		public static final String FILES = "files";
		public static final String PRODUCT_IDX = "productIdx";
		public static final String SELLER_DATA = "sellerData";
		public static final String PRODUCT_DATA = "productData";
		
	}
	
	//modle용 변수 이름
	public class Model{
		public static final String CRITERIA = "cri";
		public static final String LIST = "list";

		//product
		public static final String PRODUCT_VO = "pVo";
		public static final String MEMBER_SELLER_VO = "msVo";
		public static final String PRE_LIST = "preList";
		public static final String TAG_LIST = "tagList";
		
		//request
		public static final String REQUEST_VO = "RequestVO";
		public static final String GUNAME = "guname";
		public static final String REQUEST_ITEMLIST = "requestItemList";
		public static final String REPLY_LIST = "replyList";
		public static final String MARKET_NAME = "marketname";
		
		//reserve
		public static final String RESERVE_VO = "ReserveVO";
	}
	
	//fileIO
	public class File{
		public static final String SELLER = "seller";
		public static final String PRODUCT = "product";
	}
	
	//gcm
	public class GCM{
		public static final String ADD_REG_ID = "addRegId";
		public static final String ALERT_RESERVE = "alertReserve";
		
		public static final String PROTOCOL = "protocol";
		public static final String CONTENT = "content";
		public static final String CONTENT_VAL = "주문이 도착했습니다.";
		public static final String MEBER_NAME = "memberName";
		public static final String PRODUCT_NAME = "productName";
		public static final String RESERVE_QTY = "reserveQty";
		public static final String RECEIVE_TIME = "reserveReceiveTime";
		public static final String RECEIVE_MEMO = "reserveMemo";
		public static final String TOTAL_PRICE = "totalPrice";
		public static final String PRODUCT_INFO = "productInfo";
		
	}
}
