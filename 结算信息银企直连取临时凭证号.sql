
select * from fip_operatinglog where SRC_FREEDEF1 = '81300ZS18040067'; --0001D11000000041BZ6Y_1
 
select pk_jkbx
  from er_bxzb
 where djbh = '81300ZS18040067' --0001D1100000003NH2K4
 --����ֱ��֧���ģ�������̱��У���Դ���ݺ�ΪSRC_FREEDEF1  ����Դ������������ԭ���������������һ����ǣ��ӵ���   
    
select DES_FREEDEF1,SRC_FREEDEF1,src_relationid
  from fip_operatinglog
 where SRC_FREEDEF1 is not null 
 
