package com.pj.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pj.pet.reservation.ReservationVO;
import com.pj.pet.user.UserVO;
import com.pj.pet.util.FileManager;

@Service
public class ServiceService {

	@Autowired
	private ServiceMapper serviceMapper;
	@Autowired
	private FileManager fileManager;
	
//	public ServiceFileVO getFileDetail(ServiceVO serviceVO) throws Exception{
//		return serviceMapper.getFileDetail(serviceVO);
//	}
	
	public int setDelete(ServiceVO serviceVO)throws Exception{
		ServiceFileVO serviceFileVO= serviceMapper.getFileDetail(serviceVO);
		int result = serviceMapper.setDelete(serviceVO);
		
		boolean fileResult= fileManager.remove(serviceFileVO.getFileName(), "resources/upload/service/");
		
		return result;
	}
	
	public ServiceVO getService(ServiceVO serviceVO)throws Exception{
		return serviceMapper.getService(serviceVO);
	}
	
	public ReservationSettingVO getAllReservationSetting(ServiceVO serviceVO)throws Exception{
		return serviceMapper.getAllReservationSetting(serviceVO);
	}
	
	//reservation 세팅 등록 
	public int setReservationSetting(ReservationSettingVO reservationSettingVO)throws Exception{
		return serviceMapper.setReservationSetting(reservationSettingVO);
	}
	
	//운영시간 등록 
	public int setReservationTime(ReservationTimeVO reservationTimeVO)throws Exception{
		return serviceMapper.setReservationTime(reservationTimeVO);
	}
	
	public ServiceVO getDetail(ServiceVO serviceVO)throws Exception{
		return serviceMapper.getDetail(serviceVO);
	}
	
	//service update 
	public int setUpdate(ServiceVO serviceVO,MultipartFile file)throws Exception{
		int result= serviceMapper.setUpdate(serviceVO);
		System.out.println("file?:"+file.isEmpty());
		System.out.println("file:"+file);
		if(!file.isEmpty()) {
			
			String fileName = fileManager.fileSave(file, "resources/upload/service/");
			ServiceFileVO serviceFileVO = new ServiceFileVO();
			serviceFileVO.setSerNum(serviceVO.getSerNum());
			serviceFileVO.setFileName(fileName);
			serviceFileVO.setOriName(file.getOriginalFilename());
			int fileResult= serviceMapper.setUpdateFile(serviceFileVO);
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			System.out.println(fileResult);
		}
		return result;
	}
	
	public int setService(ServiceVO serviceVO, MultipartFile file)throws Exception{
		int result= serviceMapper.setService(serviceVO);
		
		if(!file.isEmpty()) {
			String fileName = fileManager.fileSave(file, "resources/upload/service/");
			
			ServiceFileVO serviceFileVO = new ServiceFileVO();
			serviceFileVO.setSerNum(serviceVO.getSerNum());
			serviceFileVO.setFileName(fileName);
			serviceFileVO.setOriName(file.getOriginalFilename());
			
			result = serviceMapper.setFileAdd(serviceFileVO);
		}
		
		return result;
	}
	
	public List<ReservationVO> getList(UserVO userVO)throws Exception{
		return serviceMapper.getList(userVO);
	}
}
