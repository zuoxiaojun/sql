--创建表
create table code(
Ccode varchar2(20),
Cname varchar2(30)
);
create table DATA
(
  ccode  VARCHAR2(20),
  imoney NUMBER(10,2)
);
--插入数据
--code
insert into code (CCODE, CNAME) values ('101', '北京市');
insert into code (CCODE, CNAME) values ('10101', '海淀区');
insert into code (CCODE, CNAME) values ('1010101', '海淀区医院');
insert into code (CCODE, CNAME) values ('1010102', '海淀区银行');
insert into code (CCODE, CNAME) values ('10102', '丰台区');
insert into code (CCODE, CNAME) values ('1010201', '丰台区医院');
insert into code (CCODE, CNAME) values ('1010202', '丰台区银行');
insert into code (CCODE, CNAME) values ('102', '天津市');
insert into code (CCODE, CNAME) values ('10201', '塘沽区');
insert into code (CCODE, CNAME) values ('1020101', '塘沽区医院');
insert into code (CCODE, CNAME) values ('1020102', '塘沽区银行');
insert into code (CCODE, CNAME) values ('10202', '滨海新区');
insert into code (CCODE, CNAME) values ('1020201', '滨海新区医院');

--data
insert into data (CCODE, IMONEY) values ('1010101', 248476.58);
insert into data (CCODE, IMONEY) values ('1010102', 354126.12);
insert into data (CCODE, IMONEY) values ('1010201', 2548.15);
insert into data (CCODE, IMONEY) values ('1010202', 35481.61);
insert into data (CCODE, IMONEY) values ('1020101', 12348.29);
insert into data (CCODE, IMONEY) values ('1020102', 549315.85);
insert into data (CCODE, IMONEY) values ('1020201', 46831.52);

--1、请写出一个SQL语句，实现按照北京和天津两个城市来统计金额（Imoney）

select b.cname 城市, a.imoney 总收入
  from (select substr(ccode, 1, 3) ccode, sum(imoney) imoney
          from data
         group by substr(ccode, 1, 3)) a
  left join code b
    on a.ccode = b.ccode

--2、请再写一条SQL语句，实现CODE表和DATA表的合并，合并后效果如下表

  select a.cname 城市, a.diqu 区域, b.cname 单位, a.imoney 金额
    from (select a.cname, b.cname diqu, a.dw, a.imoney
            from (select cname, diqu, dw, imoney
                    from (select substr(ccode, 1, 3) city,
                                 substr(ccode, 1, 5) diqu,
                                 substr(ccode, 1, 7) dw,
                                 imoney
                            from data) a
                    left join code b
                      on a.city = b.ccode) a
            left join code b
              on a.diqu = b.ccode) a
    left join code b
      on a.dw = b.ccode
