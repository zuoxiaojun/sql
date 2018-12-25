select top_billtype from ap_payitem where nvl(dr,0)=0  and  billno ='80100FK18120066' for update

update ap_payitem set top_billtype='36D1' where dr='0' and billno ='80100FK18120066'
