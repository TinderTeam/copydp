package cn.fuego.eshoping.ui.home;

import java.util.List;

import cn.fuego.misp.ui.model.CommonItemMeta;


public class ProductCache
{
	private List<CommonItemMeta> newProductData;
	private List<CommonItemMeta> typeProductData;
	private List<CommonItemMeta> allProductData;
	
 	private static ProductCache instance;
	
	 
	public synchronized static ProductCache getInstance()
	{
		if(null == instance)
		{
			instance = new ProductCache();
		}
		return instance;
		
	}


	public List<CommonItemMeta> getNewProductData()
	{
		return newProductData;
	}


	public void setNewProductData(List<CommonItemMeta> newProductData)
	{
		this.newProductData = newProductData;
	}


	public List<CommonItemMeta> getTypeProductData()
	{
		return typeProductData;
	}


	public void setTypeProductData(List<CommonItemMeta> typeProductData)
	{
		this.typeProductData = typeProductData;
	}


	public List<CommonItemMeta> getAllProductData()
	{
		return allProductData;
	}


	public void setAllProductData(List<CommonItemMeta> allProductData)
	{
		this.allProductData = allProductData;
	}
	
	

 
 

}
