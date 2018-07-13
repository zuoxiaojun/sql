--修复材料出库单出库数量
select cgeneralbid,
       cmaterialoid,
       nshouldnum,
       nshouldassistnum,
       nnum,
       nassistnum
  from ic_material_b
 where cgeneralhid = (select cgeneralhid
                        from ic_material_h
                       where vbillcode = '80900CC20180629055'
                         and dr = 0) --for update --1001D110000000AWBQXS

select noutnum, noutassistnum
  from ic_flow
 where cgeneralbid = '1001D110000000AWBQXS' --for update 
