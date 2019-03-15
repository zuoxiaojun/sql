
select *
  from (select code , count(code ) a
          from bd_bankaccsub
         where dr = 0
         group by code )
 where a > 1



--���������˻��ظ�

select accnum from (
select accnum, count(accnum)
  from (select *
          from bd_bankaccsub
         where pk_bankaccbas IN
               (select pk_bankaccbas
                  from bd_bankaccbas
                 where accclass in ('1', '3'))
           and dr = 0)
 group by accnum
having count(accnum) > 1
)

--�߼�ɾ�������˻��ӻ��ظ�ֵ
update bd_bankaccsub
   set dr = 0
 where accnum in (select accnum
                    from (select accnum, count(accnum)
                            from (select *
                                    from bd_bankaccsub
                                   where pk_bankaccbas IN
                                         (select pk_bankaccbas
                                            from bd_bankaccbas
                                           where accclass in ('1', '3'))
                                     and dr = 1)
                           group by accnum
                          having count(accnum) > 1))
                          

--���������˻��ظ�
select code, count(code)
  from (select *
          from bd_bankaccsub
         where pk_bankaccbas IN (select pk_bankaccbas
                                   from bd_bankaccbas
                                  where accclass in ('2'))
           and dr = 0)
 group by code
having count(code) > 1



select accclass from bd_bankaccbas where code = '323899991010003112814'




