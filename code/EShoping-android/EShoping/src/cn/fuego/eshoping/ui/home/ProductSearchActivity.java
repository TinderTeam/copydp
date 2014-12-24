package cn.fuego.eshoping.ui.home;

import java.util.ArrayList;
import java.util.List;

import android.content.Context;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;
import android.widget.Toast;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.misp.service.http.MispHttpMessage;

public class ProductSearchActivity extends BaseActivtiy implements OnCheckedChangeListener
{
	//父节点显示列表,测试用
	private  static final String[] strs= new String[]{"全部分类","餐饮美食","汽车服务","摄影写真","教育培训","休闲娱乐","酒店旅游","都市丽人","生活服务"	};
	

	private ListView fatherList,childList;
	ArrayAdapter<String> fatherAdapter,childAdapter;
	
	private PopupWindow popupWindow;  
  
    private View view;  

    private List<String> fatherListData = new ArrayList<String>();
    private List<String> childListData = new ArrayList<String>() ; 
    
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.product_search);
		
		RadioGroup searchGroup = (RadioGroup) findViewById(R.id.product_serch_radio_group);
		searchGroup.setOnCheckedChangeListener(this);
		//监听radiobutton,再次点击取消选中状态
		final RadioButton typeRadioBtn = (RadioButton) findViewById(R.id.product_serch_radio_type);
		typeRadioBtn.setOnClickListener(new OnClickListener()
		{
			
			@Override
			public void onClick(View v)
			{
				if(typeRadioBtn.isChecked())
				{
					typeRadioBtn.setChecked(false);
				}
				else
				{
					typeRadioBtn.setChecked(true);
				}
				
			}
		});

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
			//listID=0;
			//updateFatherType();
			//fatherList.setVisibility(View.VISIBLE);
			//newsViewList.setVisibility(View.INVISIBLE);
			Toast.makeText(ProductSearchActivity.this, "radio"+radioButtonId, Toast.LENGTH_LONG).show();
			//initpopupwindow();
			showWindow(group);
			
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

            GroupAdapter fatherAdapter = new GroupAdapter(this, fatherListData);  
            fatherList.setAdapter(fatherAdapter);  
            

            // 创建一个PopuWidow对象  
            //popupWindow = new PopupWindow(view, 300, 350);
            popupWindow = new PopupWindow(view,
			getWindowManager().getDefaultDisplay().getWidth(),
			getWindowManager().getDefaultDisplay().getHeight() / 2);
        }  
  
        // 使其聚集  
        popupWindow.setFocusable(true);  
        // 设置允许在外点击消失  
        popupWindow.setOutsideTouchable(true);  
  
        // 这个是为了点击“返回Back”也能使其消失，并且并不会影响你的背景  
       // popupWindow.setBackgroundDrawable(new BitmapDrawable());  
        ColorDrawable dw = new ColorDrawable(-00000);
        popupWindow.setBackgroundDrawable(dw);
        WindowManager windowManager = (WindowManager) getSystemService(Context.WINDOW_SERVICE);  
        // 显示的位置为:屏幕的宽度的一半-PopupWindow的高度的一半  
        int xPos = windowManager.getDefaultDisplay().getWidth() / 2  
                - popupWindow.getWidth() / 2;  
        Log.i("coder", "xPos:" + xPos);  
  
        popupWindow.showAsDropDown(parent, xPos, 0);  
  
        fatherList.setOnItemClickListener(new OnItemClickListener(){  
  
            @Override  
            public void onItemClick(AdapterView<?> adapterView, View view, int position, long id) {  
  
                Toast.makeText(ProductSearchActivity.this, fatherListData.get(position), 1000).show(); 
                //for test
                childListData.clear();
                childListData.add(strs[position]);
                GroupAdapter childAdapter = new GroupAdapter(adapterView.getContext(), childListData);
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
