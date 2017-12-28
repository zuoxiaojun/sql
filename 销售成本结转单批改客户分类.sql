
 select ccustomerid ,vdef15  from ia_i5bill where caccountperiod ='2017-11'  and vdef15 ='~';
 
select distinct(ccustomerid) from ia_i5bill where caccountperiod ='2017-11'  and vdef15 ='~';


select pk_customer, pk_custclass
  from bd_customer
 where pk_customer in (select distinct (ccustomerid)
                         from ia_i5bill
                        where caccountperiod = '2017-11'
                          and vdef15 = '~');

update ia_i5bill
   set vdef15 = '1001A110000000000OBN'
 where ccustomerid in ('1001B1100000000209OW',
                       '1001D1100000006C9F66',
                       '1001D11000000019TSZU',
                       '1001D1100000006RBPXA',
                       '1001D1100000001BBRHY',
                       '1001D11000000077DJFP',
                       '1001D110000000572Z7R',
                       '1001D1100000005C13D3',
                       '1001D11000000019X4WL',
                       '1001D11000000029ANM8',
                       '1001D11000000059LPYD')
   and caccountperiod = '2017-11'
   and vdef15 = '~';
