--删除采购合同
update ct_pu set dr=1 where vbillcode='201811';
update ct_pu_b set dr=1 where pk_ct_pu in (select pk_ct_pu from ct_pu where vbillcode='201811');
update ct_pu_change set dr=1 where pk_ct_pu in (select pk_ct_pu from ct_pu where vbillcode='201811');
update ct_pu_exec set dr=1 where pk_ct_pu in (select pk_ct_pu from ct_pu where vbillcode='201811');
update ct_pu_exp set dr=1 where pk_ct_pu in (select pk_ct_pu from ct_pu where vbillcode='201811');
update ct_pu_memora set dr=1 where pk_ct_pu in (select pk_ct_pu from ct_pu where vbillcode='201811');
update ct_pu_term set dr=1 where pk_ct_pu in (select pk_ct_pu from ct_pu where vbillcode='201811');
