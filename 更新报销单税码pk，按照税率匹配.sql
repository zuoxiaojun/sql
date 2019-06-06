select distinct(djlxbm)  from er_bxzb 

--���÷ѱ���������ѯ��˰����ֵ��˰���ֶ�Ϊ�յ����ݣ�
select defitem24, defitem25, pk_jkbx, ts
  from er_busitem
 where to_number(defitem25) in (select to_number(taxrate) from t_smsl)
   and defitem24 = '~'
   and pk_jkbx in (select pk_jkbx from er_bxzb where djlxbm = '2641')
   and ts > '2019-01-01 00:00:00'


--��ͨ�ѱ���������ͨס�ޣ�ͨ�÷��ã�����ѯ��˰����ֵ��˰���ֶ�Ϊ�յ����ݣ�
select defitem20, defitem21, pk_jkbx, ts
  from er_busitem
 where to_number(defitem21) in (select to_number(taxrate) from t_smsl)
   and defitem20 = '~'
   and pk_jkbx in
       (select pk_jkbx
          from er_bxzb
         where djlxbm in ('264X-Cxx-002', '264X-Cxx-001', '2642'))
   and ts > '2019-01-01 00:00:00'
   
   --��ֵ˰˰��˰��
   select a.pk_taxcode, a.code, b.taxrate
     from bd_taxcode a
     left join bd_taxrate b
       on a. pk_taxcode = b. pk_taxcode
    where a.code like 'CN%'

--����˰��˰��˰�ʶ��ձ�
create table t_smsl as (select a.pk_taxcode, a.code, b.taxrate
     from bd_taxcode a
     left join bd_taxrate b
       on a. pk_taxcode = b. pk_taxcode
    where a.code like 'CN%')
    
    
    select * from t_smsl  order by taxrate for update

/*���±�����˰��pk������˰��ƥ��  */

--���÷ѱ�����
merge into er_busitem a
       using t_smsl b
       on (to_number(a.defitem25) = to_number(b.taxrate))
       when matched then
         update
            set a.defitem24 = b.pk_taxcode
          where a.pk_busitem in
                (select pk_busitem
                   from er_busitem
                  where to_number(defitem25) in
                        (select to_number(taxrate) from t_smsl)
                    and defitem24 = '~'
                    and pk_jkbx in
                        (select pk_jkbx from er_bxzb where djlxbm = '2641')
                    and ts > '2018-01-01 00:00:00');
           
           
--ʣ�౨����
 merge into er_busitem a
 using t_smsl b
 on (to_number(a.defitem21) = to_number(b.taxrate))
 when matched then
   update
      set a.defitem20 = b.pk_taxcode
    where a.pk_busitem in
          (select pk_busitem
             from er_busitem
            where to_number(defitem21) in
                  (select to_number(taxrate) from t_smsl)
              and defitem20 = '~'
              and pk_jkbx in
                  (select pk_jkbx
                     from er_bxzb
                    where djlxbm in ('264X-Cxx-002', '264X-Cxx-001', '2642'))
              and ts > '2019-01-01 00:00:00')
           
           
   --�����洢���̣���̨������ҵ����ʱִ��  
 
 create or replace procedure update_er_busitem_tax
 --���±�����˰��pk������˰��ƥ��
  is
 begin
   update er_busitem set defitem21 = '' where defitem21 = '~';
   update er_busitem set defitem25 = '' where defitem25 = '~';
   commit;
   --���÷ѱ�����
   merge into er_busitem a
   using t_smsl b
   on (to_number(a.defitem25) = to_number(b.taxrate))
   when matched then
     update
        set a.defitem24 = b.pk_taxcode
      where a.pk_busitem in
            (select pk_busitem
               from er_busitem
              where to_number(defitem25) in
                    (select to_number(taxrate) from t_smsl)
                and defitem24 = '~'
                and pk_jkbx in
                    (select pk_jkbx from er_bxzb where djlxbm = '2641')
                and ts > '2018-01-01 00:00:00');
 
   --ʣ�౨����
   merge into er_busitem a
   using t_smsl b
   on (to_number(a.defitem21) = to_number(b.taxrate))
   when matched then
     update
        set a.defitem20 = b.pk_taxcode
      where a.pk_busitem in
            (select pk_busitem
               from er_busitem
              where to_number(defitem21) in
                    (select to_number(taxrate) from t_smsl)
                and defitem20 = '~'
                and pk_jkbx in
                    (select pk_jkbx
                       from er_bxzb
                      where djlxbm in
                            ('264X-Cxx-002', '264X-Cxx-001', '2642'))
                and ts > '2019-01-01 00:00:00');
 
   commit;
 end;



