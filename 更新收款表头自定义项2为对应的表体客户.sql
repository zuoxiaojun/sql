select def2 from ar_gatherbill where billno ='80100SK18050128'

select billno,def2 from ar_gatherbill where def2 ='~'
--�ʽ�ӿ����ݴ����ͷ��Ӧ�ͻ���ʧ
--�����տ��ͷ�Զ�����2Ϊ��Ӧ�ı���ͻ�

UPDATE ar_gatherbill A
   SET A . def2 =
       (SELECT distinct(b. customer)
          FROM ar_gatheritem b
         WHERE A.pk_gatherbill = b.pk_gatherbill)
 WHERE EXISTS (SELECT 1
          FROM ar_gatheritem b
         WHERE A.pk_gatherbill = b.pk_gatherbill)
   and a.def2 = '~'
