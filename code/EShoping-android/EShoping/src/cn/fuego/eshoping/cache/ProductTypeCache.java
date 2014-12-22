package cn.fuego.eshoping.cache;

import java.util.ArrayList;
import java.util.List;

import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.webservice.up.model.GetProductTypeReq;
import cn.fuego.eshoping.webservice.up.model.GetProductTypeRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductTypeJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.http.MispHttpHandler;
import cn.fuego.misp.service.http.MispHttpMessage;

public class ProductTypeCache
{
	private FuegoLog log = FuegoLog.getLog(getClass());

	private  List<ProductTypeJson> typeList = new ArrayList<ProductTypeJson>();
	private static ProductTypeCache instance;
	private ProductTypeCache()
	{
		
	}
	
	public synchronized static ProductTypeCache getInstance()
	{
		if(null == instance)
		{
			instance = new ProductTypeCache();
		}
		return instance;
		
	}
	
	public void load()
	{
		GetProductTypeReq req = new GetProductTypeReq();
		req.setTypeRoot(0);
	 
		WebServiceContext.getInstance().getProductManageRest(new MispHttpHandler()
		{
			@Override
			public void handle(MispHttpMessage message)
			{
				if(message.isSuccess())
				{
					GetProductTypeRsp rsp = (GetProductTypeRsp) message.getMessage().obj;
					typeList = rsp.getTypeList();
					
				}
				else
				{
					log.error("can not get type list from server,the error code is "+ message.getErrorCode());
				}
				
			}	
		}).getProductType(req);
	}
	 
	public List<ProductTypeJson> getAllRootType()
	{
		List<ProductTypeJson>  rootTypeList = new ArrayList<ProductTypeJson>();
		for(ProductTypeJson json : typeList)
		{
			rootTypeList.add(json);
		}
		return rootTypeList;
	}
	 
	public  List<ProductTypeJson> getTypeList()
	{
		return typeList;
	}

	public  void setTypeList(List<ProductTypeJson> typeList)
	{
		this.typeList = typeList;
	}

	public ProductTypeJson getTypeByID(Integer typeID)
	{
		for(ProductTypeJson json : typeList)
		{
			if(json.getType_id() == typeID)
			{
				return json;
			}
		}
		return null;
	}
}
