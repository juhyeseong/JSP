drop table board_member purge;
drop sequence board_member_seq;

drop table board purge;
drop sequence board_seq;

drop table reply purge;
drop sequence reply_seq;

create sequence board_member_seq
    start with 1
    maxvalue 99999
    increment by 1
    nocache
    nocycle;

create table board_member(
    idx             number              default member_seq.nextval primary key,
    userid          varchar(100)        unique,
    userpw          varchar(255)        not null,
    username        varchar(100),
    email           varchar(100)
);

create sequence board_seq
    start with 1
    maxvalue 99999
    increment by 1
    nocache
    nocycle;
    
create table board (
    idx             number              default board_seq.nextval primary key,
    title           varchar(100)        not null,
    writer          number              not null,
    content         varchar(2000)       not null,
    fileName        varchar(255),
    writeDate       date                default sysdate,
    ipaddr          varchar(50)         not null,
    userAgent       varchar(500)        not null,
    
    constraint board_member_fk
    foreign key(writer)
    references member(idx)
    on delete cascade 
    
);

create sequence reply_seq
    start with 1
    maxvalue 99999
    increment by 1
    nocache
    nocycle;
    
create table reply (
    idx         number          default reply_seq.nextval primary key,
    board       number          not null,
    writer      number          not null,
    content     varchar2(1500)  not null,
    writeDate   date            default sysdate,
    ipaddr      varchar2(50)    not null,
    userAgent   varchar2(500)   not null,
    
    constraint reply_member_fk
    foreign key(writer)
    references member(idx)
    on delete cascade,
    
    constraint reply_board_fk
    foreign key(board)
    references board(idx)
    on delete cascade
);

select * from member;

insert into board(title, writer, content, fileName, ipaddr, userAgent) values (
        '게시글 더미 데이터 1', 5, '내용1', null, '1.1.1.1', '-'
);
insert into board(title, writer, content, fileName, ipaddr, userAgent) values (
        '게시글 더미 데이터 2', 2, '내용2', null, '1.1.1.2', '-'
);
insert into board(title, writer, content, fileName, ipaddr, userAgent) values (
        '게시글 더미 데이터 3', 3, '내용3', null, '1.1.1.3', '-'
);
insert into board(title, writer, content, fileName, ipaddr, userAgent) values (
        '게시글 더미 데이터 4', 6, '내용4', null, '1.1.1.4', '-'
);

-- writer : member table의 idx 


select * from board order by idx desc;

commit;

desc board;

select * from board where idx=5;

select
    board_member.userId as writerName,
    board.*
    from board
    join board_member
        on board.writer = board_member.idx
    where board.idx=1;
    
-- 제목으로 검색
select
    board.idx,
    board.title,
    board_member.userId as writerName,
    board.writeDate,
    board.fileName,
    board.ipaddr,
    board.userAgent,
    board.content
    from board
    join board_member
        on board.writer = board_member.idx
    where title like '%4%';

-- 내용으로 검색
select
    board.idx,
    board.title,
    board_member.userId as writerName,
    board.writeDate,
    board.fileName,
    board.ipaddr,
    board.userAgent,
    board.content
    from board
    join board_member
        on board.writer = board_member.idx
    where content like '%내용%';

-- id로 검색
select
    board_member.userId,
    board.*
    from board
    join board_member
        on board.writer = board_member.idx
    where userId like '%it%'
    order by board.idx desc;
    