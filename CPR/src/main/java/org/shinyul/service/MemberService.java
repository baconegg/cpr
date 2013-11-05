package org.shinyul.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.shinyul.domain.MarketVO;
import org.shinyul.domain.MemberCommonVO;
import org.shinyul.domain.MemberCustomerVO;
import org.shinyul.domain.MemberSellerVO;
import org.shinyul.mapper.MemberMapper;
import org.shinyul.util.PBKDF2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberService {

	private Logger logger = Logger.getLogger(MemberService.class);
	
	@Inject
	private MemberMapper member;
	
	//판매자
	@Transactional
	public int registSeller(MemberSellerVO vo){
		int check = 1;
		try {
			
			//pbkdf2////////////////////////////////////
			String tmpPw = vo.getMemberPw();
			byte[] salt = PBKDF2.createSalt();
			vo.setMemberSalt(PBKDF2.changeDiget(salt));
			byte[] changePw = PBKDF2.pbkdf2(tmpPw.toCharArray(), salt);
			vo.setMemberPw(PBKDF2.changeDiget(changePw));
			///////////////////////////////////////////
			
			logger.info("service vo check : " + vo);	
			member.createSeller(vo);
		} catch (Exception e) {			
			logger.error("Service ------- registSeller Error~!!!!");
			check = 2;
		}
		return check;
	}
	
	//마켓 정보 읽어오기
	public List<MarketVO> viewSuperstoreInfo(MarketVO vo) {
		try {
			return member.readSuperstoreInfo(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	

	
	//판매자 정보 업뎃
	@Transactional
	public int modifySeller(MemberSellerVO vo){
		int check = 1;
		try {			
			
			//pbkdf2////////////////////////////////////
			String tmpPw = vo.getMemberPw();
			byte[] salt = PBKDF2.createSalt();
			vo.setMemberSalt(PBKDF2.changeDiget(salt));
			byte[] changePw = PBKDF2.pbkdf2(tmpPw.toCharArray(), salt);
			vo.setMemberPw(PBKDF2.changeDiget(changePw));
			///////////////////////////////////////////
			
			member.updateSeller(vo);
			member.updateSellerTwo(vo);
			member.updateSellerThree(vo);
		} catch (Exception e) {
			logger.error("MemberService - modifySeller error~!@");
			check = 2;
		}
		return check;
	}
	
	//판매자 탈퇴
	@Transactional
	public int removeSeller(MemberSellerVO vo){
		int check = 0;
		try {
			member.deleteSeller(vo);
			member.deleteSellerTwo(vo);
			member.deleteSellerThree(vo);
			check = 1;
		} catch (Exception e) {
			logger.error("MemberService - removeSeller error~!@");
			check = 0;
			e.printStackTrace();
		}
		return check;
	}
	
	//////////////////////////////////////////////////////////////////////
	//소비자
	@Transactional
	public void registCustomer(MemberCustomerVO vo){
		try {
			
			//pbkdf2////////////////////////////////////
			String tmpPw = vo.getMemberPw();
			byte[] salt = PBKDF2.createSalt();
			vo.setMemberSalt(PBKDF2.changeDiget(salt));
			byte[] changePw = PBKDF2.pbkdf2(tmpPw.toCharArray(), salt);
			vo.setMemberPw(PBKDF2.changeDiget(changePw));
			///////////////////////////////////////////
			
			logger.info("service vo check : " + vo);			
			member.createCustomer(vo);
		} catch (Exception e) {
			logger.error("Service ------- registCustomer Error~!!!!");
		}
	}
	
	//소비자 정보 읽어 오기
	public MemberCustomerVO viewCustomer(int memberIdx){
		
		MemberCustomerVO mVo = null;
		
		try {
			mVo = member.readCustomer(memberIdx);
			logger.info("service mvo : " + mVo);
		} catch (Exception e) {
			logger.error("MemberService - viewCustomer error~!@");			
		}
		
		return mVo;
	}
	
	//소비자 정보 수정
	@Transactional
	public void modifyCustomer(MemberCustomerVO vo){
		try {
			
			//pbkdf2////////////////////////////////////
			String tmpPw = vo.getMemberPw();
			byte[] salt = PBKDF2.createSalt();
			vo.setMemberSalt(PBKDF2.changeDiget(salt));
			byte[] changePw = PBKDF2.pbkdf2(tmpPw.toCharArray(), salt);
			vo.setMemberPw(PBKDF2.changeDiget(changePw));
			///////////////////////////////////////////
			
			member.updateCustomer(vo);
			member.updateCustomerTwo(vo);
		} catch (Exception e) {
			logger.error("MemberService - modifyCustomer error~!@");
			e.printStackTrace();
		}
	}
	
	//소비자 탈퇴
	@Transactional
	public int removeCustomer(MemberCustomerVO vo){
		int check = 0;
		try {
			member.deleteCustomer(vo);
			member.deleteCustomerTwo(vo);
			check = 1;
		} catch (Exception e) {
			logger.error("MemberService - removeCustomer error~!@");
			check = 0;
			e.printStackTrace();
		}
		return check;
	}
	
	/////소비자 판매자 같이 쓰는 부분//////////////////////////////////////////////////////////////////////////
	//상세페이지..	//판매자 정보 읽어 오기
	public MemberSellerVO viewSeller(int selIdx){
		
		MemberSellerVO mVo = null;
		
		try {
			mVo = member.readSeller(selIdx);
			logger.info("service mvo : " + mVo);
		} catch (Exception e) {
			logger.error("MemberService - viewSeller error~!@");			
		}
		
		return mVo;
	}
	
	//로그인 처리
	public MemberCommonVO loginchk(String memberId){
		MemberCommonVO mCVo = null;
		try {			
			mCVo = member.loginchk(memberId);			
		} catch (Exception e) {
			logger.error("MemberService - loginchk error~!@");
		}
		return mCVo;
	}
	public int getSelIdx(int memberIdx){
		try {			
		 return	member.getSelIdx(memberIdx);			
		} catch (Exception e) {
			logger.error("MemberService - getSelIdx error~!@");
		}
		return 0;
	}
	public int getMarIdx(int memberIdx){
		try {			
		 return	member.getMarIdx(memberIdx);			
		} catch (Exception e) {
			logger.error("MemberService - getMarIdx error~!@");
		}
		return 0;
	}
	public int getCustomerIdx(int memberIdx){
		try {			
		 return	member.getCustomerIdx(memberIdx);			
		} catch (Exception e) {
			logger.error("MemberService - getCustomerIdx error~!@");
		}
		return 0;
	}
}
