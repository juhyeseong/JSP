drop table reply purge;
drop sequence reply_seq;
drop table board purge;
drop sequence board_seq;
drop table board_member purge;
drop sequence board_member_seq;

create sequence board_seq
    start with 1
    maxvalue 9999999
    increment by 1
    nocache
    nocycle;
    
create sequence board_member_seq
    start with 1
    maxvalue 999999
    increment by 1
    nocache
    nocycle;
    
create sequence reply_seq
    start with 1
    maxvalue 999999
    increment by 1
    nocache
    nocycle;
    
create table board_member(
    idx         number          default board_member_seq.nextval primary key,
    userId      varchar2(100)   unique,
    userPw      varchar2(255)   not null,
    userName    varchar2(100)   ,
    email       varchar2(100)   
);

create table board(
    idx         number          default board_seq.nextval primary key,
    title       varchar2(100)   not null,
    writer      number          not null,
    content     varchar2(2000)  not null,
    fileName    varchar2(255)   ,
    writeDate   Date            default sysdate,
    ipaddr      varchar2(50)    not null,
    userAgent   varchar2(500)   not null,
    
    constraint board_member_fk
        foreign key (writer)
        references board_member(idx)
        on delete cascade
);

create table reply(
    idx         number          default reply_seq.nextval primary key,
    board       number          not null,
    writer      number          not null,
    content     varchar2(1500)  not null,
    writeDate   date            default sysdate,
    ipaddr      varchar2(50)    not null,
    userAgent   varchar2(500)   not null,
    
    constraint reply_member_fk
        foreign key(writer)
        references board_member(idx)
        on delete cascade,
        
    constraint reply_board_fk
        foreign key(board)
        references board(idx)
        on delete cascade
);

commit;

desc board_member;
desc board;

select * from board_member;

insert into board_member(userId, userPw, userName, email) values('root', 'qwe', '관리자', 'root@itbank.com');
insert into board_member(userId, userPw, userName, email) values('itbank', 'it', '아뱅', 'itbank@gmail.com');
insert into board_member(userId, userPw, userName, email) values('user1', '111', '김유저', 'user1@naver.com');

insert into board(title, writer, content, fileName, ipaddr, userAgent)
    values('게시글 더미 데이터 1', 1, '내용1', null, '1.1.1.1', '-');
insert into board(title, writer, content, fileName, ipaddr, userAgent)
    values('게시글 더미 데이터 2', 2, '내용2', null, '1.1.1.2', '-');
insert into board(title, writer, content, fileName, ipaddr, userAgent)
    values('게시글 더미 데이터 3', 3, '내용3', null, '1.1.1.3', '-');
insert into board(title, writer, content, fileName, ipaddr, userAgent)
    values('게시글 더미 데이터 4', 2, '내용4', null, '1.1.1.4', '-');
    
select
    board.idx,
    board.title,
    board_member.userName as writerName,
    board.writeDate,
    board.content,
    board.fileName,
    board.ipaddr,
    board.userAgent
    from board
    join board_member
        on board.writer = board_member.idx;