-- 여기는 관리자 화면입니다.

-- 사용자 생성
CREATE USER user2 IDENTIFIED BY 1234
DEFAULT TABLESPACE myTs;

-- 접속 권한 부여
GRANT CREATE SESSION TO user2;
-- TABLESPACE 사용 권한
GRANT RESOURCE TO user2;
-- TABLE 생성할수있는 권한 부여
GRANT CREATE TABLE TO user2;

-- 기존사용자의 TABLESPACE를 다시 지정
-- 기본사용자 생성을 실행하면
-- 사용자는 default tablespace를 
--         SYSTEM(오라클 기본) tablespace로 설정한다.
-- 이 SYSTEM ts는 DBA 권한을 가진 사용자만 접근이 가능해서
-- 기본적으로 CREATE TABLE 등의 권한 만으로는 TABLE을 생성하기가 어렵다.
-- 그래서 별도로 사용자용 TABLESPACE를 생성하고
-- 이미 생성된 사용자를 새로 만든 TABLESPACE에 연결해 주는것이 좋다.
-- 원칙은 TS를 먼저 생성하고, 사용자를 생성해서
-- DEFAULT TABLE SPACE 로 설정하는 것이 좋으나
-- 사용자를 먼저 등록하게 되면 나중에 다시 변경을 해서
-- 사용자 TS를 지정 할 수 있다.
-- DCL 명령어에서 DREATE DROP 과 함께 사용할수 있는
-- ALTER 명령을 이용해서 변경을 수행한다.
ALTER USER user2 DEFAULT TABLESPACE myts;

-- 비밀번호 변경
ALTER USER user2 IDENTIFIED BY 1111 ;