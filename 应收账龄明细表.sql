  --gcl_aragedetail          Ӧ��������ϸ������
--gcl_aragedetail_b      Ӧ��������ϸ���ӱ�


select * from gcl_aragedetail a left join gcl_aragedetail_b b on a.pk_bill=b.pk_bill
