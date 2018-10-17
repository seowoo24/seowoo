 -- 테이블 생성
 create table board (
 	seq number not null,						-- 글번호
 	id varchar2(20) not null,					-- 아이디
 	name varchar2(40) not null,				-- 이름
 	subject varchar2(255) not null,			-- 제목
 	content varchar2(4000) not null,		-- 내용
 	hit number default 0,						-- 조회수
 	logtime date default sysdate				-- 작성일
 );
 
 -- 테이블 삭제
 drop table board purge;
 -- 테이블 구조 확인
 desc board;
 -- 시퀀스 객체 생성
 create sequence seq_board nocache nocycle;
 -- 시퀀스 객체 삭제
 drop sequence seq_board;
 
 -- 데이터 저장하기
 insert into board values (seq_board.nextval, 'num1', '홍길동', '내일은', '웃으리', 0, sysdate);
 -- 테이블 내용 확인
 select * from board;
 select * from board where seq = 31;
 select count(*) from board;            -- 전체 목록수 구하기
 -- 조회수 증가
 update board set hit = hit + 1 where seq = 31;
 -- 데이터 수정하기
 update board set subject = '오늘도', content = '열심히 살았다...' where seq = 30;
 -- 데이터 삭제하기
 delete board where seq = 35;
 -- DB 저장
 commit;
 
 -- 인덱스 뷰
 -- hidden column - rownum
 select * from 
 (select rownum rn, tt. * from
 (select * from board order by seq desc) tt)
 where rn >= 6 and rn <= 10;
 -- logtime 수정한 코드
 select seq, id, name, subject, content, hit, to_char(logtime, 'YYYY.MM.DD') as logtime from 
 (select rownum rn, tt. * from
 (select * from board order by seq desc) tt)
 where rn >= 6 and rn <= 10;        -- 6 <= rn <= 10 번의 게시물 표시
 
 -- TEST
 select * from board order by seq desc;
 -- tt = select * from board order by seq desc : 별명짓기
 select rownum rn, tt. * from (select * from board order by seq desc) tt;