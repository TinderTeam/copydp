
package cn.fuego.eshoping.ui.widget;

import android.app.Activity;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.PopupWindow;
import android.widget.PopupWindow.OnDismissListener;
import antistatic.spinnerwheel.AbstractWheel;
import antistatic.spinnerwheel.OnWheelChangedListener;
import antistatic.spinnerwheel.adapters.NumericWheelAdapter;
import cn.fuego.common.log.FuegoLog;

public class NumberSelectWindow
{
	private FuegoLog log = FuegoLog.getLog(NumberSelectWindow.class);

	private View targetView;
	private Context context;
	private PopupWindow popupWindow=null;  
	private Window window;
	private View view;  
	private Button sure_btn;
	AbstractWheel num;
	private int popWindowLayout;
	private int titleID;
	private  int  curNum= 1;
	private int abstractWheelID;
	/**
	 * 
	 * @param context
	 * @param targetView
	 * @param popWindowLayout
	 * @param popTitleID
	 * @param abstractWheelID
	 */
	public NumberSelectWindow (Context context ,View targetView,int popWindowLayout,int popTitleID,int abstractWheelID){
		this.context=context;
		this.popWindowLayout=popWindowLayout;
		this.titleID=popTitleID;
		this.targetView=targetView;
		this.abstractWheelID=abstractWheelID;
		onCreate();
		setListener();
		
	}
	

	private void onCreate()
	{
		 LayoutInflater layoutInflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);  
         view = layoutInflater.inflate(this.popWindowLayout, null);  
        //TextView  title= (TextView) view.findViewById(this.titleID);
        // title.setText("测试");
        //sure_btn = (Button) view.findViewById(R.id.pop_window_sure_btn);
         popupWindow = new PopupWindow(view, ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
         // 使其聚集  
         popupWindow.setFocusable(true);  
         //点击外部消失
         popupWindow.setOutsideTouchable(true);  
         popupWindow.setBackgroundDrawable(new ColorDrawable(0x90000000));
         final AbstractWheel num = (AbstractWheel)view.findViewById(abstractWheelID);
         NumericWheelAdapter numAdapter = new NumericWheelAdapter(context, 1, 20);
         num.setViewAdapter(numAdapter);
         num.setCurrentItem(0);
         num.setVisibleItems(5);
	}

	private void setListener()
	{
		num.addChangingListener(new OnWheelChangedListener()
		{
			@Override
			public void onChanged(AbstractWheel wheel, int oldValue, int newValue)
			{
				//Toast.makeText(ctx, "newValue:"+String.valueOf(newValue), Toast.LENGTH_SHORT).show();
				curNum = newValue+1;
				
			}
		});
		//监听popwindow消失事件，并对radioGroup清零
        popupWindow.setOnDismissListener(new OnDismissListener(){
			@Override
			public void onDismiss()
			{
				WindowManager.LayoutParams lp=window.getAttributes();
			    lp.alpha = 1f;
			    window.setAttributes(lp);
			    popupWindow=null;
			}
       	
        });
	}

	public void showWindow(){
		changeBlackboard();        
		popupWindow.showAtLocation(targetView, Gravity.BOTTOM, 0, 0);//在屏幕居中，无偏移
	}

	private void changeBlackboard()
	{
		//设置背景变暗
        WindowManager.LayoutParams lp=window.getAttributes();
        lp.alpha = 0.4f;
        ((Activity) context).getWindow().setAttributes(lp);
	}
}
