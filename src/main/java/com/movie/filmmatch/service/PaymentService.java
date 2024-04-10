package com.movie.filmmatch.service;



import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.movie.filmmatch.vo.PaymentVo;
import com.movie.filmmatch.vo.TossPayVo;


@Service
public interface PaymentService {

    /** 결제정보 데이터처리 
     * @throws JsonProcessingException 
     * @throws JsonMappingException */
    public TossPayVo convertJsonToPaymentVo(String jsonStr) throws JsonMappingException, JsonProcessingException;

    /**
     * 결제성공시 db에 해당정보 저장
     * @param map
     * @return
     */
    public int insert_payment_success(Map<String, Object> map);

    /**
     * 결제 리스트
     * @param mem_idx
     * @return
     */
    public List<TossPayVo> select_list(int mem_idx);

    /**
     * 결제 상세보기
     * @param orderId
     * @return
     */
    public List<PaymentVo> payment_select_orderid(String orderId);

    /**
     * 결제상세 금액
     * @param orderId
     * @return
     */
    public PaymentVo payment_select_orderid_amount(String orderId);
}
