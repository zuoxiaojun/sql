--µ£±£±í
create or replace view v_gpm_guacontract as (
select a.pk_org,
       a.guarantor,
       a.vdef8,
       a.contractno,
       a.guastartdate,
       a.guaenddate,
       a.busistatus,
       a.pk_guacurrtype,
       guaamount,
       a.guaamountdivcapital,
       a.gualcamount,
       a.warliability,
       a.guatype,
       a.dr                  adr,
       b.dr                  bdr,
       b.pk_guaproperty,
       b.p_unit,
       b.p_count
--  b.usingamount
  from gpm_guacontract a
  left join gpm_guaproperty b
    on a.contractno = b.PLEDGENO
 where a.dr = 0
 and nvl(b.dr,0)=0 )

