     
     --�ʽ��ڴ���
     select * from v_htcl;
     select * from v_maxhtll;      
     
    select *
      from v_htcl a
      left join v_maxhtll b
        on a.pk_contractrate = b.pk_contractrate
     --where a. contractcode = '���ջ���8ǧ���ʽ���'
    
    
