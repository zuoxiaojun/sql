select distinct (contractno)
  from ar_gatheritem
 where dr = 0


--1.��ѯ�����������֮ǰ������
  select contractno
    from ar_gatheritem as of timestamp to_timestamp('2020-05-15 10:11:00', 'yyyy-mm-dd hh24:mi:ss');

--2.���ز���ǰ�������ƶ����ܣ������ò��������أ�
alter table ar_gatheritem enable row movement;

--3.ִ��������䣺
flashback table ar_gatheritem to timestamp TO_TIMESTAMP('2020-05-15 10:11:00','yyyy-mm-dd hh24:mi:ss');


select * from ar_gatheritem where ts >'2020-05-15 10:10:00'
