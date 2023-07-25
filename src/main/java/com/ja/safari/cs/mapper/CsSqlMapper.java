package com.ja.safari.cs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ja.safari.dto.CsAttendanceLogDto;
import com.ja.safari.dto.CsCategoryDto;
import com.ja.safari.dto.CsChatCombinedDto;
import com.ja.safari.dto.CsChatListDto;
import com.ja.safari.dto.CsChatResponseDto;
import com.ja.safari.dto.CsChatResponseDto2;
import com.ja.safari.dto.CsEmpDto;
import com.ja.safari.dto.CsEmpRatingResponseDto;
import com.ja.safari.dto.CsLiveChatCountResponseDto;
import com.ja.safari.dto.CsLiveChatDto;
import com.ja.safari.dto.CsLiveChatMsgDto;
import com.ja.safari.dto.CsLiveChatRating;
import com.ja.safari.dto.CsQnaDto;
import com.ja.safari.dto.CsQnaRating;
import com.ja.safari.dto.CsQnaCombinedDto;
import com.ja.safari.dto.CsQnaCountResponseDto;
import com.ja.safari.dto.CsScheduleDto;
import com.ja.safari.dto.CsTodayStatsDto;
import com.ja.safari.dto.CsWeeklyEmpWorkCountDto;
import com.ja.safari.dto.UserDto;

public interface CsSqlMapper {

	// 로그인 - 아이디 비번으로 유저 찾기
	public CsEmpDto getEmpDtoByUserNameAndPw(CsEmpDto empDto);
	
	// 직원 아이디로 직원 찾기 
	public CsEmpDto getEmpDtoById(Integer id);

	// 직원 등록 
	public void registerEmployee(CsEmpDto csEmpDto);

	// 직원 리스트 
	public List<CsEmpDto> getEmployeeList();
	
	// 직원 출근 최근 
	public List<CsAttendanceLogDto> getRecentAttendanceLogDtos(Integer empId);

	// 기존 스케줄 지우기 
	public void deleteScheduleByEmpId(Integer empId);
	
	// 새로운 스케줄 저장 
	public void insertScheduleByEmpId(CsScheduleDto csScheduleDto);

	// 직원 아이디로 스케줄 가져오기 
	public List<CsScheduleDto> getScheduleByEmpId(int empId);
	
	// 스케줄 가져오기 - 캘린더 
	public List<CsScheduleDto> getScheduleList();

	// 출근 
	public void insertTimeInByEmpId(int empId);

	// 퇴근 
	public void updateTimeOutByLogId(int empId);
	
	// 현재 출근했고 일 적은 직원 가져오기
	public CsEmpDto getEmployeeWithLeastWorkload();
	
	// 1대1문의 저장  
	public void insertQnaPost(CsQnaDto csQnaDto);
	
	// 카테고리 가져오기
	public CsCategoryDto getCategoryById(int id);

	// 1대1 문의 가져오기 - 유저아이디로 
	public List<CsQnaDto> getInquiryListByUserId(int userId);

	// 1대1 문의 가져오기 - 직원  
	public List<CsQnaDto> getInquiryListByEmpId(int empId);
	
	// 미답변 문의 개수 가져오기 - 직원  
	public Integer getUnansweredInquiryCount(int empId);
	
	// 1대1 문의 가져오기 - id로  
	public CsQnaDto getQnaDtoById(int id);
	
	// 1대1 문의 CombinedDto 가져오기 - id로  
	public CsQnaCombinedDto getQnaCombinedDtoById(Integer id);
	
	// 1대1 문의 답변 후기 카운트 
	public int getQnaReplyRateCount(Integer id);


	// 1대1 문의 답변 저장 - 업데이트 
	public void saveQnaReply(CsQnaDto qnaDto);
	
	// 실시간 채팅 pk 가져오기 
	public int getLiveChatPk();

	// 실시간 채팅 시작 
	public void insertLiveChat(CsLiveChatDto csLiveChatDto);

	// 실시간 채팅 메세지 입력 
	public void insertLiveChatMsg(CsLiveChatMsgDto csLiveChatDto);

	// 실시간 채팅 메세지 리스트 가져오기 - 유저 
	public List<CsLiveChatMsgDto> getLiveChatMsgListByChatId(Integer chatId);

	// 종료되지 않은 실시간 문의 카운트 가져오기 
	public Integer getUnfinishedChatCountByEmpId(int empId);

	// 실시간 채팅방 리스트 가져오기 - 직원 아이디로 
	public List<CsChatListDto> getLiveChatListByEmpId(Integer empId);
	
	// 메세지 리스트 가져오기 
	public List<CsLiveChatMsgDto> getMsgListByChatId(Integer chatId);
	
	// 안 읽은 메세지 카운트  
	public Integer getUnreadMsgCountByChatId(Integer chatId);
	
	// 실시간 채팅방 마지막 메시지 가져오기 
	public CsLiveChatMsgDto getLastMsgByChatId(Integer chatId);
	
	// resultMap | 실시간 채팅방 리스트 가져오기 - 직원 아이디로 
	public List<CsChatCombinedDto> getLiveChatCombinedListByEmpId(Integer empId);
	
	// resultMap | 실시간 채팅방 리스트 가져오기 - 직원 아이디로 ResponseDto
	public List<CsChatResponseDto> getCsChatResponseDtoListByEmpId(Integer empId);
	
	// resultMap | 실시간 채팅방 리스트 가져오기 - 직원 아이디로 ResponseDto - 안 읽은 메세지 개수 추가 
	public List<CsChatResponseDto2> getCsChatResponseDtoList2ByEmpId(Integer empId);
	
	// resultMap | 실시간 채팅방 리스트 가져오기 - 필요한 것만 
	public List<CsChatResponseDto2> getCsChatListDtosByEmpId(Integer empId);

	// 직원이 채팅방 누르면 읽음 처리 
	public void markMsgAsReadByEmp(Integer chatId);
	
	// 유저 읽음 처리 
	public void markMsgAsReadByUser(Integer chatId);

	// 1대1 문의 답변 후기 저장 
	public void insertQnaReplyRating(CsQnaRating csQnaRating);
	
	// 1대1 문의 후기 가져오기 
	public int getQnaRatingByQnaId(int qnaId);

	// 실시간 메세지 저장 - 직원 
	public void insertLiveChatMsgByEmp(CsLiveChatMsgDto chatMsgDto);
	
	// 실시간 문의 종료 
	public void endLiveChatById(Integer chatId);
	
	// 실시간 문의 종료 여부 확인 
	public int isChatEnded(Integer chatId);

	// 실시간 문의 가져오기  
	public CsLiveChatDto getChatById(Integer chatId);

	// 실시간 문의 후기 저장 
	public void saveLiveChatRating(CsLiveChatRating liveChatRating);

	// 채팅 아이디로 유저 찾아오기 
	public UserDto getUserDtoByChatId(Integer chatId);

	// 채팅 아이디로 직원 찾아오기 
	public CsEmpDto getEmpDtoByChatId(Integer chatId);
	
	
	// 오늘 출근 직원 리스트 
	public List<CsEmpDto> getEmpListForToday(String weekday);
	
	// 오늘 1대1문의 현황 
	public List<CsQnaCountResponseDto> getQnaCountForTodayByEmpId(int empId);
	
	// 오늘 실시간문의 현황 
	public List<CsLiveChatCountResponseDto> getLiveChatCountForTodayByEmpId(int empId);
	
	// 오늘 1대1문의 응답시간  
	public double getAvgReplyTimeTodayByEmpId(@Param("empId") int empId);
	
	// 오늘 실시간문의 응답시간  
	public double getAvgChatEndTimeTodayByEmpId(@Param("empId") int empId);
	
	// 지난주 1대1문의 현황 
	public CsQnaCountResponseDto getWeeklyQnaCountByEmpId(int empId);
	
	// 지난주 실시간문의 현황 
	public CsLiveChatCountResponseDto getWeeklyLiveChatCountByEmpId(int empId);

	// 직원 아이디와 요일로 스케줄 찾아오기 
	public CsScheduleDto getScheduleByEmpIdAndWeekday(@Param("empId") int empId, @Param("weekday") String weekday);
	
	// 직원 아이디로 평점 가져오기 
	public CsEmpRatingResponseDto getRatingsByEmpId(int empId);
	
	// 직원 아이디로 주간 근무 시간 
	public int getWeeklyHoursByEmpId(int empId);
	
	// 오늘 현황 통계
	public CsTodayStatsDto getStatsToday();
	
	// 지난주 직원별 문의 처리수 리스트 
	public List<CsWeeklyEmpWorkCountDto> getWeeklyEmpWorkCountList();
	
	// 지난주 직원별 문의 처리수 리스트 
	public List<CsWeeklyEmpWorkCountDto> getWeeklyEmpTaskCountList();
	
	
	
	

	
	
	
	
	
	

}
