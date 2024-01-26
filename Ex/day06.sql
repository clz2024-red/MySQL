-- 작가 테이블 만들기
create table author (
    author_id   int          primary key, -- not null + unique
    author_name varchar(100) not null,
    author_desc varchar(500)
);

-- 책 테이블 만들기
create table book (
    book_id int primary key,
    title varchar(100) not null,
    pubs varchar(100),
    pub_date datetime,
    author_id int,
    constraint book_fk foreign key(author_id)
    references author(author_id)
);


-- 작가 등록
-- 묵지적 방법
insert into author 
values(1, '박경리', '토지작가' );

-- 명시적 방법
insert into author(author_id, author_name)
values(2, '이문열');

insert into author(author_name, author_id)
values('황일영', 3);

insert into author(author_id, author_name)
values(4, '정우성');

insert into author(author_name)
values('박명수');

insert into author 
values(5, '김종국', null);

-- 작가 수정
update author 
set author_name = '기안84', 
    author_desc = '웹툰작가'
where author_id = 3
;

update author
set author_desc = '영화배우'
where author_id = 4
;

-- 작가 삭제
delete from author
where author_id = 5;

commit;

delete from author
where author_name = '이문열';


select * from author;

select * from book;

insert into book
values(1, '우리들의', '다림', '1998-02-02', 2 );

insert into book
values(2, '삼국지', '민음사', '2002-03-01', 2 );


insert into book
values(3, '토지', '마로니에북스', '2012-08-15', 1 );

insert into book
values(4, '오직두사람', '문학동네', '2017-05-04', 6 );

select  b.book_id,
        b.title,
        b.pubs,
        b.pub_date,
        a.author_id,
        a.author_name,
        a.author_desc
from book b, author a
where b.author_id = a.author_id
;

alter table author 
modify author_id int auto_increment primary key;

drop table author;
drop table book;


-- 작가 테이블 auto_increment
create table author(
    author_id int auto_increment primary key,
    author_name varchar(100) not null,
    author_desc varchar(500)
);

insert into author(author_name, author_desc)
values('이문열', '경북 영양');

insert into author(author_name, author_desc)
values('박경리', '경상남도 통영');

insert into author
values(null, '유시민', '17대 국회의원');

select last_insert_id();
