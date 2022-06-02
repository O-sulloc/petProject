package com.pj.pet.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pj.pet.cartrefer.CartReferMapper;
import com.pj.pet.cartrefer.CartReferVO;
import com.pj.pet.carts.CartVO;
import com.pj.pet.pay.PayVO;
import com.pj.pet.user.UserVO;

@Mapper
public interface OrderMapper {
	
	public int setAdd(OrderVO orderVO) throws Exception;
	
	public String getOrderName() throws Exception;
	
	public List<OrderVO> orderList(OrderVO orderVO)throws Exception;
	
	public int updateName(String orderName) throws Exception;
	
	public List<CartVO> orderDetailList(PayVO payVO)throws Exception;
}
