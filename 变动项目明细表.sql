
SELECT *
  FROM pam_alter_sheet
 WHERE pk_alter_b IN
       (SELECT pk_alter_b
          FROM pam_alter_b
         WHERE pk_alter = (SELECT pk_alter
                             FROM pam_alter
                            WHERE bill_code = 'ZCBD201710130003' --�䶯����
                              AND dr = 0)) --�䶯��Ŀ��ϸ��
