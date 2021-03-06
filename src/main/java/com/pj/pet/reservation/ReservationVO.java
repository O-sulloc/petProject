package com.pj.pet.reservation;

import java.sql.Date;
import lombok.Data;

import java.util.List;

import com.pj.pet.service.ReservationSettingVO;
import com.pj.pet.service.ServiceVO;


@Data
public class ReservationVO {


	
	 private Long resNum;
	 private String id;
	 private Long serNum;
	 private String resDate;
	 private String resTime;
	 private String resMemo;
	 private Long resState;
	 
	 //월별 예약리스트 정보 확인시 필요해서 추가 
	 private Long count;
	 //예약승인 메일 보낼때 필요해서 추가 
	 private String serName;
	 
	 
	 private ServiceVO serviceVO;

	 private List<ReservationSettingVO> reservationSettingVO;
	 

}
