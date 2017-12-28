
SELECT *
  FROM pam_alter_sheet
 WHERE pk_alter_b IN
       (SELECT pk_alter_b
          FROM pam_alter_b
         WHERE pk_alter = (SELECT pk_alter
                             FROM pam_alter
                            WHERE bill_code = 'ZCBD201710130003' --变动单号
                              AND dr = 0)) --变动项目明细表
