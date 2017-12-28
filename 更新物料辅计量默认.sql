select count( *)  from bd_materialconvert where isstockmeasdoc='N';


--更新物料辅计量默认

update bd_materialconvert
   set ispumeasdoc    = 'Y',--采购默认单位
       isprodmeasdoc  = 'Y',--生产默认单位
       isstockmeasdoc = 'Y',--库存默认单位
       issalemeasdoc  = 'Y'--销售默认单位
 where ispumeasdoc = 'N';
 
 
 
 
