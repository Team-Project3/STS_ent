package com.ezen.view;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

public class PayMentController {


	private IamportClient api;
	
	public PayMentController(){		
		//��ū �߱�
		this.api = new IamportClient("REST API Key","REST API Secret");
	}
		
	@ResponseBody
	@RequestMapping(value="/verifyiamport/{imp_uid}", method=RequestMethod.POST)
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{	
		
			return api.paymentByImpUid(imp_uid);
	}
	
	//���� �Ϸ� �� DB�� ���� �Ϸ� ó�� - 02.15
	//������ ������ �ڵ� �߰� - 02.19
	@RequestMapping(value="/paySuccess", method=RequestMethod.POST)
	public void paySuccess(String amount,String ID) {
		int tmp = Integer.parseInt(amount);
		int months = tmp/15000; //���� ���� ġȯ -> �Ⱓ ������ ����
		Map<String, Object> map = new HashMap<>();
		map.put("ID", ID);
		map.put("months", months);
	}
}
