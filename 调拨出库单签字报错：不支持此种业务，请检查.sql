select * from to_settlerule where csettleruleid='0001A110000000002G76'

--�������ⵥǩ�ֱ�����֧�ִ���ҵ������
select *
  from to_settlerule_b
 where csettleruleid = '0001A110000000002G76' --0001A110000000002G7C

/*�ڲ�������Ϣ�ӱ�����ֻ�н������������Ϣ��û���ӱ���Ϣ
���º���ǩ�ֵ������ڲ����״����㵥��ʱ����Ϊû�н�������ӱ�pk������
�ղ�ִ�е���䣬�ǰ��ڲ������ӱ������������ӱ���Ϣȱʧ�ĸ�������
������ȱ��

*/

select *
  from to_businessinfo_b
 where csettleruleid = '0001A110000000002G76'
   and dr = 0
   and csettlerule_bid != '0001A110000000002G7C'

update to_businessinfo_b
   set csettlerule_bid = '0001A110000000002G7C'
 where csettleruleid = '0001A110000000002G76'
   and dr = 0
   and csettlerule_bid != '0001A110000000002G7C'
   and csettlerule_bid = '~'; --1001D110000000G3GZ0A   1001D110000000G0YZ38
