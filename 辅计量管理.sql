select count(*) from bd_materialconvert where fixedflag = 'N';

select pk_material from bd_materialconvert where fixedflag = 'N';

select code,name 
  from bd_material
 where pk_material in
       (select pk_material from bd_materialconvert where fixedflag = 'N');  --Œ¥πÃ∂®ªªÀ„
       
 update bd_materialconvert set fixedflag='Y' where fixedflag = 'N';   
