--�������ѱ������������ã��������½ű���ѯ���滻���ѯ�ĵ��ݺţ�
select pk_flow,vbillcode from ic_flow where vsourcebillcode = '80501FR20181123001'
union 
select pk_flow,vbillcode from ic_flowaccount_his where vsourcebillcode = '80501FR20181123001';
