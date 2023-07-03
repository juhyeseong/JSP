select idx, fileName from board order by idx desc;

select * from board;

-- 댓글 더미 데이터

desc reply;

select * from board_member;

insert into reply(board, writer, content, ipaddr, userAgent)
    values(28, 4, '댓글 테스트1', '1.1.1.1', '-');

insert into reply(board, writer, content, ipaddr, userAgent)
    values(28, 4, '댓글 테스트2', '1.1.1.2', '-');

insert into reply(board, writer, content, ipaddr, userAgent)
    values(21, 4, '댓글 테스트1', '1.1.1.1', '-');

insert into reply(board, writer, content, ipaddr, userAgent)
    values(21, 4, '댓글 테스트2', '1.1.1.2', '-');
    
select M.userId, R.* from reply R
    join board_member M
        on M.idx = R.writer
where board=28 order by R.idx;

delete reply where idx between 9 and 13;

select * from reply;