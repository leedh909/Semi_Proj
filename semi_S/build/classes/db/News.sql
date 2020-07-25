DROP SEQUENCE NEWS_SQ;

DROP TABLE NEWS;

CREATE SEQUENCE NEWS_SQ NOCACHE;

CREATE TABLE NEWS(
	NEWS_SEQ NUMBER PRIMARY KEY, 
	TITLE VARCHAR2(2000) NOT NULL,
	IMG VARCHAR2(2000) NOT NULL,
	URL VARCHAR2(1000) NOT NULL
);

SELECT * FROM NEWS order by news_Seq;

/*INSERT INTO NEWS VALUES(NEWS_SQ.NEXTVAL,'[라이브커머스] 2020 상반기 다나와 히트브랜드 기념! 프로젝터매니아의 빔프로젝터와 마이...','http://img.danawa.com/images/attachFiles/5/332/4331988_1.jpeg?shrink=320:*&amp;t=1595588212000','http://dpg.danawa.com/news/view?boardSeq=63&listSeq=4331988');
INSERT INTO NEWS VALUES(NEWS_SQ.NEXTVAL,'Laser 빔프로젝터 MAXELL MP-WU5603(6000안시)풀HD + 그랜드뷰전동매립...',131000,'CPU-02.jpg');
INSERT INTO NEWS VALUES(NEWS_SQ.NEXTVAL,'더 긴 비행을 위해 날개를 버린 드론, V-콥터 팔콘',218000,'CPU-03.jpg');
INSERT INTO NEWS VALUES(NEWS_SQ.NEXTVAL,'리뷰 | 급이 다른 화질, 올레드 TV가 내 방으로.. 진정한 게임 체인저 48형 LG 올...',182000,'CPU-04.jpg');
INSERT INTO NEWS VALUES(NEWS_SQ.NEXTVAL,'커브드 게이밍 모니터의 정점을 찍다 ‘비트엠 Newsync X27FC165 커브드 1500R’',210000,'CPU-05.jpg');
INSERT INTO NEWS VALUES(NEWS_SQ.NEXTVAL,'정갈함의 완.성. - 맥스엘리트 PRISM COMBO 슬리빙 케이블',347000,'CPU-06.jpg');
INSERT INTO NEWS VALUES(NEWS_SQ.NEXTVAL,'동물 좀비의 등장, 스테이트 오브 디케이 3 첫 공개',459000,'CPU-07.jpg');
INSERT INTO NEWS VALUES(NEWS_SQ.NEXTVAL,'스마일게이트 크로스파이어X, 싱글 첫 공개 반응 좋네',553000,'CPU-08.jpg');
INSERT INTO NEWS VALUES(NEWS_SQ.NEXTVAL,'메인보드의 SATA/M.2를 알아보자[브로리퀘스트]',897000,'CPU-09.jpg');
INSERT INTO NEWS VALUES(NEWS_SQ.NEXTVAL,'해무 낀 해변에서 갑자기 낡은 배가 나타났습니다 신고해야하나요?',984000,'CPU-10.jpg');
*/


