
--youtube 영상과 썸네일을 DB에 저장
--영상마다 DB내부의 고유번호를 부여
--쿠키를 활용하여 최근 선택한 영상이
--우측에 별도로 표기되어야 함
-------------------------------------------------------------------------------------------------------
set define off;

drop table youtube_list purge;
drop sequence youtube_list_seq;

create sequence youtube_list_seq
    start with 1
    maxvalue 99999
    increment by 1
    nocache
    nocycle;

create table youtube_list (
    idx		nubmer		default youtube_list_seq.nextval primary key,
    title	varchar2(500)	not null,
    channel	varchar2(100)	not null,
    thumbnail	varchar2(500)	not null,    
    iframe	varchar2(500) 	not null
);

insert into youtube_list (title,channel,thumbnail,iframe)
    values (
	'나폴리탄 괴담이란?',
	'침착맨',
	'https://i.ytimg.com/vi/8ApNfUJwobs/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBHxL440ij_VqKcDsM-DVjdvYO_7w',
	'<iframe width="704" height="396" src="https://www.youtube.com/embed/8ApNfUJwobs" title="나폴리탄 괴담이란?" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
);

insert into youtube_list (title, channel, thumbnail, iframe)
    values (
	'[자막뉴스] 코로나 특수 끝났다... ',
	'JTBC News',
	'https://i.ytimg.com/vi/GH9--zGwqbo/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAwKh0_I0s_5AyjtBez4dGR82Y-mw',
	'<iframe width="704" height="396" src="https://www.youtube.com/embed/GH9--zGwqbo" title="[자막뉴스] 코로나 특수 끝났다…도 넘은 가격에 고객들 &#39;손절&#39; 확산 / JTBC News" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
);

