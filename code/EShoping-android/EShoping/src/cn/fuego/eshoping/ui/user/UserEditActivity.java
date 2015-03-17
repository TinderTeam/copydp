package cn.fuego.eshoping.ui.user;

import java.util.Date;

import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.format.DateUtil;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.eshoping.webservice.up.model.ModifyCustomerReq;
import cn.fuego.eshoping.webservice.up.model.base.CustomerJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.tool.MispLocationService;
import cn.fuego.misp.ui.pop.MispDataSelector;
import cn.fuego.misp.ui.pop.MispDatePicker;
import cn.fuego.misp.ui.pop.MispPopWindowListener;

public class UserEditActivity extends BaseActivtiy    
{
	private FuegoLog log = FuegoLog.getLog(getClass());
	private CustomerJson customer;
 	private TextView userName;
	private TextView sex;

	private TextView birthday;
	private TextView phone;
	private TextView email;
	private TextView addr;
	

	@Override
	public void handle(MispHttpMessage message)
	{
		super.showMessage(message);
		if(message.isSuccess())
		{
			AppCache.getInstance().update(customer);
			this.finish();
			
		}
		
		
	}

	@Override
	public void initRes()
	{
		this.activityRes.setName("用户信息修改");
		this.activityRes.setAvtivityView(R.layout.user_info_edit);
		this.activityRes.getButtonIDList().add(R.id.misp_title_save);
 
		
		
		
	}
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		
		CustomerJson customer = AppCache.getInstance().getCustomer();
		if(null != customer)
		{
 

			phone = (TextView) findViewById(R.id.user_user_phone_text);
			phone.setText(customer.getCellphone());

			email = (TextView) findViewById(R.id.user_user_email_text);
			email.setText(customer.getEmail());
 
		}
 
		
	}

	@Override
	public void onClick(View v)
	{
		switch (v.getId())
		{
			case R.id.misp_title_save:
			{
				ModifyCustomerReq req = new ModifyCustomerReq();
				customer = AppCache.getInstance().getCustomer().clone();
 
				String phoneStr = phone.getText().toString().trim();

				if(ValidatorUtil.isEmpty(phoneStr))
				{
					showMessage("电话为必填项");
					return;
				}
				if(!ValidatorUtil.isPhone(phoneStr))
				{
					showMessage("电话格式不正确");
					return;
				}
				customer.setCellphone(phoneStr);
				
				String emailStr = email.getText().toString().trim();
				
				if(ValidatorUtil.isEmpty(emailStr))
				{
					showMessage("邮箱为必填项");
					return;
				}
				if(!ValidatorUtil.isEmpty(emailStr))
				{
					if(!ValidatorUtil.isEmail(emailStr))
					{
						showMessage("邮箱格式不正确");
						return;
					}
				}

				customer.setEmail(emailStr);

 
				req.setCustomer(customer);
				
			    WebServiceContext.getInstance().getUserManageRest(this).modifyCustomer(req);
			}
			
			break;
 
				
 		default:
			break;
		}

	}
	
	public void showDatePickerDialog(final TextView view)
	{  
		String str = view.getText().toString();
 
		
		Date date = DateUtil.shortStrToDate(str);
		MispDatePicker datePicker = new MispDatePicker(new MispPopWindowListener()
		{
			
			@Override
			public void onConfirmClick(String value)
			{
				view.setText(value);
				
			}
		},date);  
	    datePicker.show(getFragmentManager(), "datePicker");
  	}
 


}
