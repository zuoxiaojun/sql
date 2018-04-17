select cbillid,dr from ia_iibill where vbillcode='80900II2018030138' for update;
select cbill_bid,dr from ia_iibill_b where cbillid=(select cbillid from ia_iibill where vbillcode='80900II2018030138') for update 

select cbillid, cbill_bid, dr
  from ia_detailledger
 where vbillcode = '80900II2018030138' for update  --1001D1100000009H082R  1001D1100000009H082S

