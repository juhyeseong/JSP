drop table upload1;
drop sequence upload1_seq;

create sequence upload1_seq
    start with 1
    maxvalue 99999
    increment by 1
    nocache
    nocycle;

create table upload1 (
    idx         number          default upload1_seq.nextval primary key,
    title       varchar2(100)   not null,
    uploadFile  varchar2(255)   not null,
    uploadDate  date            default sysdate
);

insert into upload1 (title, uploadFile) values ('´Üºñ', 'danbi.jpg');
select * from upload1 order by idx;
delete upload1 where idx=1;