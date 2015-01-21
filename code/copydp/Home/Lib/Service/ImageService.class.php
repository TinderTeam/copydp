<?php
	public class ImageService {   
	//参数images为图片的绝对地址     
		function getImagesInfo(images){       
			img_info = getimagesize(images);        
			switch (img_info[2]){        
			case 1:        
			imgtype = "gif";        
			break;        
			case 2:        
			imgtype = "jpg";        
			break;        
			case 3:        
			imgtype = "png";        
			break;        
			}               
			//获取文件大小     
			img_size = ceil(filesize(img)/1000)."k";         
			new_img_info = array (        
				"width"=>img_info[0], //图像宽     
				"height"=>img_info[1], //图像高     
				"type"=>img_type, //图像类型     
				"size"=>img_size //图像大小     
			);       
			return new_img_info;        
		}        

		function resizeImage($im,$maxwidth,$maxheight,$name,$filetype){
			$pic_width = imagesx($im);
			$pic_height = imagesy($im);

			if(($maxwidth && $pic_width > $maxwidth) || ($maxheight && $pic_height > $maxheight))
			{
				if($maxwidth && $pic_width>$maxwidth)
				{
					$widthratio = $maxwidth/$pic_width;
					$resizewidth_tag = true;
				}

				if($maxheight && $pic_height>$maxheight)
				{
					$heightratio = $maxheight/$pic_height;
					$resizeheight_tag = true;
				}

				if($resizewidth_tag && $resizeheight_tag)
				{
					if($widthratio<$heightratio)
						$ratio = $widthratio;
					else
						$ratio = $heightratio;
				}

				if($resizewidth_tag && !$resizeheight_tag)
					$ratio = $widthratio;
				if($resizeheight_tag && !$resizewidth_tag)
					$ratio = $heightratio;

				$newwidth = $pic_width * $ratio;
				$newheight = $pic_height * $ratio;

				if(function_exists("imagecopyresampled"))
				{
					$newim = imagecreatetruecolor($newwidth,$newheight);
				   imagecopyresampled($newim,$im,0,0,0,0,$newwidth,$newheight,$pic_width,$pic_height);
				}
				else
				{
					$newim = imagecreate($newwidth,$newheight);
				   imagecopyresized($newim,$im,0,0,0,0,$newwidth,$newheight,$pic_width,$pic_height);
				}

				$name = $name.$filetype;
				imagejpeg($newim,$name);
				imagedestroy($newim);
			}
			else
			{
				$name = $name.$filetype;
				imagejpeg($im,$name);
			}           
		}
	}
?>
