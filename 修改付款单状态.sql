

select approvestatus, billstatus         /*approvestatus  ����״̬   -1=����̬��0=δͨ��̬��1=ͨ��̬��2=������̬��3=�ύ̬*/
  from ap_paybill                                 /* billstatus  ����״̬     9=δȷ�ϣ�-1=���棬1=����ͨ����2=�����У�-99=�ݴ棬8=ǩ��*/
 where billno = '80100FK18050141'
   for update



--������Ϣ
select busistatus, aduitstatus
  from cmp_settlement
 where billcode = '80100FK18050141' /* busistatus  ҵ�񵥾�״̬           -99=�ݴ棬-1=���棬1=���ͨ����8=ǩ�֣�0=����ʧ�ܣ�2=�����У�9=δȷ�� */
                                                                 /* aduitstatus  ҵ�񵥾�����״̬   0=����ͨ����1=�����У�3=����δͨ����4=û������������*/
   for update
