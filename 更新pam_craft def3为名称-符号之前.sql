--����pam_craft def3Ϊ����-����֮ǰ

select * from pamc;

UPDATE pam_craft A
   SET A . def3 =
       (SELECT b. NAME FROM pamc b WHERE A.CRAFT_CODE = b.CRAFT_CODE)
 WHERE EXISTS (SELECT * FROM pamc b WHERE A.CRAFT_CODE = b.CRAFT_CODE)
