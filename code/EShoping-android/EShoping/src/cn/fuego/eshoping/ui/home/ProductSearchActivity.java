package cn.fuego.eshoping.ui.home;

import java.util.ArrayList;
import java.util.List;

import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.PopupWindow.OnDismissListener;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.misp.service.http.MispHttpMessage;

public class ProductSearchActivity extends BaseActivtiy implements OnCheckedChangeListener
{
	//父节点显示列表,测试用
	private  static final String[] strs= new String[]{"全部分类","餐饮美食","汽车服务","摄影写真","教育培训","休闲娱乐","酒店旅游","都市丽人","生活服务"	};
	

	private ListView fatherList,childList;
	private GroupAdapter fatherAdapter,childAdapter;
	
	private PopupWindow popupWindow=null;  
  
    private View view;  

    private List<String> fatherListData = new ArrayList<String>();
    private List<String> childListData = new ArrayList<String>() ; 
    //用于标记radiogroup点击次数
    private int checkFlag=0;
    private RadioGroup searchGroup;
    private RadioButton typeRadioBtn,areaRadioBtn;
	@Override
	public void initRes()
	{
		this.activityRes.setAvtivityView(R.layout.product_search);
	} 
	
    
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.product_search);
		
	    searchGroup = (RadioGroup) findViewById(R.id.product_serch_radio_group);   
		searchGroup.setOnCheckedChangeListener(this);		

		//监听radiobutton,再次点击取消选中状态
		typeRadioBtn = (RadioButton) searchGroup.findViewById(R.id.product_serch_radio_type);
		typeRadioBtn.setOnClickListener(typeBtnClickListener);

		areaRadioBtn = (RadioButton) searchGroup.findViewById(R.id.product_serch_radio_area);
		areaRadioBtn.setOnClickListener(areaBtnClickListener);



	}
	private RadioButton.OnClickListener typeBtnClickListener = new OnClickListener()
	{
		@Override
		public void onClick(View v)
		{
			clearCheck();
		
		}
	};
	 private RadioButton.OnClickListener areaBtnClickListener = new OnClickListener()
	{
		
		@Override
		public void onClick(View v)
		{
			
			clearCheck();
		}
	};
    private void clearCheck()
    {
		if(checkFlag==0)
		{

			checkFlag=1;
		}
		else
		{
			searchGroup.clearCheck();			
			checkFlag=0;
		}
    }
	@Override
	public void handle(MispHttpMessage message)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onCheckedChanged(RadioGroup group, int checkedId)
	{

		int radioButtonId = group.getCheckedRadioButtonId();
		if (radioButtonId == R.id.product_serch_radio_type)
		{   

			
			if(typeRadioBtn.isChecked())
			{
				showWindow(group);
			}
			else
			{
				return;
			}
			
		}
		if(radioButtonId == R.id.product_serch_radio_area)
		{
			
			if(areaRadioBtn.isChecked())
			{
				showWindow(group);
			}
			else
			{
				return;
			}
		}

		
	}
	private void showWindow(View parent) {  
		  
        if (popupWindow == null) {  
            LayoutInflater layoutInflater = (LayoutInflater) getSystemService(Context.LAYOUT_INFLATER_SERVICE);  
  
            view = layoutInflater.inflate(R.layout.pop_window, null);  
  
            fatherList = (ListView) view.findViewById(R.id.search_father_list); 
            childList = (ListView) view.findViewById(R.id.search_child_list);

			 
            
			//fatherListData = new ArrayList<String>();  
            for(int i=0;i<strs.length;i++)
            {
            	fatherListData.add(strs[i]);
            }

            fatherAdapter = new GroupAdapter(this, fatherListData);  
            fatherList.setAdapter(fatherAdapter);  
           

            // 创建一个PopuWidow对象  
            //popupWindow = new PopupWindow(view, 300, 350);
            popupWindow = new PopupWindow(view,
			getWindowManager().getDefaultDisplay().getWidth(),
			getWindowManager().getDefaultDisplay().getHeight());
        }  
  
        // 使其聚集  
        popupWindow.setFocusable(true);  
        // 设置允许在外点击消失  
        popupWindow.setOutsideTouchable(true);  

        //实例化一个ColorDrawable颜色为半透明 
        ColorDrawable dw = new ColorDrawable(0xb0000000);  
        popupWindow.setBackgroundDrawable(dw);
        //点击底部页面消失pop
        View bottomview = view.findViewById(R.id.pop_window_bottom);
        bottomview.setOnClickListener(new OnClickListener()
		{
			
			@Override
			public void onClick(View v)
			{
				popupWindow.dismiss(); 
				
			}
		});
       
        WindowManager windowManager = (WindowManager) getSystemService(Context.WINDOW_SERVICE);  
        // 显示的位置为:屏幕的宽度的一半-PopupWindow的高度的一半  
        int xPos = windowManager.getDefaultDisplay().getWidth() / 2  
                - popupWindow.getWidth() / 2;  
  
        popupWindow.showAsDropDown(parent, xPos, 0); 
        //监听popwindow消失事件，并对radioGroup清零
        popupWindow.setOnDismissListener(new OnDismissListener()
		{		
			@Override
			public void onDismiss()
			{
				searchGroup.clearCheck();			
				checkFlag=0;			
			}
		});
        fatherList.setOnItemClickListener(new OnItemClickListener(){  
  
            @Override  
            public void onItemClick(AdapterView<?> adapterView, View view, int position, long id) {  
               //使item为选中状态
                fatherAdapter.setSelectedPosition(position);
                fatherAdapter.notifyDataSetInvalidated();
                
                childListData.clear();
                //for test
                childListData.add(strs[position]);
                childAdapter = new GroupAdapter(adapterView.getContext(), childListData);
                childList.setAdapter(childAdapter);
                //childAdapter.notifyDataSetChanged();
                
/*                if (popupWindow != null) 
                {  
                    popupWindow.dismiss();  
                }  */
            }  
        });  
    }

	

}
