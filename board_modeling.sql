CREATE TABLE members(
    id NUMBER(5) PRIMARY KEY,
    name VARCHAR2(20) NOT NULL,
    age NUMBER(5) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    pw VARCHAR2(20) NOT NULL
);

CREATE SEQUENCE members_id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999;

SELECT *
FROM members;

INSERT INTO members(id, name, age, email, pw)
VALUES(members_id_seq.NEXTVAL, 'kim', 43, 'kim@naver.com', 1234);

INSERT INTO members(id, name, age, email, pw)
VALUES(members_id_seq.NEXTVAL, 'lee', 27, 'lee@naver.com', 1234);

INSERT INTO members(id, name, age, email, pw)
VALUES(members_id_seq.NEXTVAL, 'park', 12, 'park@naver.com', 1234);

INSERT INTO members(id, name, age, email, pw)
VALUES(members_id_seq.NEXTVAL, 'choi', 55, 'choi@naver.com', 1234);





CREATE TABLE categories(
    id NUMBER(5) PRIMARY KEY,
    name VARCHAR2(20) NOT NULL
);

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999;

SELECT *
FROM categories;

INSERT INTO categories(id, name)
VALUES(categories_id_seq.NEXTVAL, '자유 게시판');

INSERT INTO categories(id, name)
VALUES(categories_id_seq.NEXTVAL, '정보 게시판');





CREATE TABLE hashtags(
    id NUMBER(5) PRIMARY KEY,
    name VARCHAR2(20) NOT NULL
);

CREATE SEQUENCE hashtags_id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999;

SELECT *
FROM hashtags;

INSERT INTO hashtags(id, name)
VALUES(hashtags_id_seq.NEXTVAL, '공부');

INSERT INTO hashtags(id, name)
VALUES(hashtags_id_seq.NEXTVAL, '운동');

INSERT INTO hashtags(id, name)
VALUES(hashtags_id_seq.NEXTVAL, '취미');





CREATE TABLE posts(
    id NUMBER(5) PRIMARY KEY,
    title VARCHAR2(50) NOT NULL,
    content VARCHAR2(200) NOT NULL,
    category_id NUMBER(5)NOT NULL,
    member_id NUMBER(5) NOT NULL,
    reg_date DATE DEFAULT SYSTIMESTAMP,
    CONSTRAINT fk_posts_categories FOREIGN KEY(category_id) REFERENCES categories(id),
    CONSTRAINT fk_posts_members FOREIGN KEY(member_id) REFERENCES members(id)
);

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999;

SELECT *
FROM posts;

INSERT INTO posts(id, title, content, category_id, member_id)
VALUES(posts_id_seq.NEXTVAL, '어제 공부', '어제는 공부 집중이 잘 되더라', 1, 4);

INSERT INTO posts(id, title, content, category_id, member_id)
VALUES(posts_id_seq.NEXTVAL, '야구 시작', '곧 있으면 야구 개막합니다.', 2, 2);

INSERT INTO posts(id, title, content, category_id, member_id)
VALUES(posts_id_seq.NEXTVAL, '목 톡증 방지', '어렸을 때 자세를 똑바로 합시다.', 1, 1);





CREATE TABLE views(
    id NUMBER(5) PRIMARY KEY,
    member_id NUMBER(5) NOT NULL,
    post_id NUMBER(5) NOT NULL,
    CONSTRAINT fk_views_members FOREIGN KEY(member_id) REFERENCES members(id),
    CONSTRAINT fk_views_posts FOREIGN KEY(post_id) REFERENCES posts(id)
);

CREATE SEQUENCE views_id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999;
    
SELECT *
FROM views;

INSERT INTO views(id, member_id, post_id)
VALUES(views_id_seq.NEXTVAL, 2, 3);

INSERT INTO views(id, member_id, post_id)
VALUES(views_id_seq.NEXTVAL, 4, 2);

INSERT INTO views(id, member_id, post_id)
VALUES(views_id_seq.NEXTVAL, 1, 1);





CREATE TABLE likes(
    id NUMBER(5) PRIMARY KEY,
    member_id NUMBER(5) NOT NULL,
    post_id NUMBER(5) NOT NULL,
    CONSTRAINT fk_likes_members FOREIGN KEY(member_id) REFERENCES members(id),
    CONSTRAINT fk_likes_posts FOREIGN KEY(post_id) REFERENCES posts(id)
);

CREATE SEQUENCE likes_id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999;
    
SELECT *
FROM likes;

INSERT INTO likes(id, member_id, post_id)
VALUES(likes_id_seq.NEXTVAL, 2, 1);

INSERT INTO likes(id, member_id, post_id)
VALUES(likes_id_seq.NEXTVAL, 4, 2);

INSERT INTO likes(id, member_id, post_id)
VALUES(likes_id_seq.NEXTVAL, 1, 1);

INSERT INTO likes(id, member_id, post_id)
VALUES(likes_id_seq.NEXTVAL, 1, 2);

INSERT INTO likes(id, member_id, post_id)
VALUES(likes_id_seq.NEXTVAL, 3, 1);

INSERT INTO likes(id, member_id, post_id)
VALUES(likes_id_seq.NEXTVAL, 3, 3);





CREATE TABLE posts_hashtags(
    id NUMBER(5)PRIMARY KEY, 
    post_id NUMBER(5) NOT NULL,
    hashtag_id NUMBER(5)NOT NULL,
    CONSTRAINT fk_posts_hashtags_posts FOREIGN KEY(post_id) REFERENCES posts(id),
    CONSTRAINT fk_posts_hashtags_hashtags FOREIGN KEY(hashtag_id) REFERENCES hashtags(id)
);

CREATE SEQUENCE posts_hashtags_id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999;

SELECT *
FROM posts_hashtags;

INSERT INTO posts_hashtags(id, post_id, hashtag_id)
VALUES(posts_hashtags_id_seq.NEXTVAL, 1, 1);

INSERT INTO posts_hashtags(id, post_id, hashtag_id)
VALUES(posts_hashtags_id_seq.NEXTVAL, 2, 2);

INSERT INTO posts_hashtags(id, post_id, hashtag_id)
VALUES(posts_hashtags_id_seq.NEXTVAL, 2, 3);

INSERT INTO posts_hashtags(id, post_id, hashtag_id)
VALUES(posts_hashtags_id_seq.NEXTVAL, 3, 2);

INSERT INTO posts_hashtags(id, post_id, hashtag_id)
VALUES(posts_hashtags_id_seq.NEXTVAL, 3, 1);





CREATE TABLE declare_type(
    id NUMBER(5) PRIMARY KEY,
    name VARCHAR2(20) NOT NULL
);

CREATE SEQUENCE declare_type_id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999;

SELECT *
FROM declare_type;

INSERT INTO declare_type(id, name)
VALUES(declare_type_id_seq.NEXTVAL, '욕설');

INSERT INTO declare_type(id, name)
VALUES(declare_type_id_seq.NEXTVAL, '선정성');

INSERT INTO declare_type(id, name)
VALUES(declare_type_id_seq.NEXTVAL, '뒷광고');

INSERT INTO declare_type(id, name)
VALUES(declare_type_id_seq.NEXTVAL, '기타');





CREATE TABLE declare_status(
    id NUMBER(5) PRIMARY KEY,
    code VARCHAR2(20) NOT NULL
);

CREATE SEQUENCE declare_status_id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999;

SELECT *
FROM declare_status;

INSERT INTO declare_status(id, code)
VALUES(declare_status_id_seq.NEXTVAL, '접수');

INSERT INTO declare_status(id, code)
VALUES(declare_status_id_seq.NEXTVAL, '수용');

INSERT INTO declare_status(id, code)
VALUES(declare_status_id_seq.NEXTVAL, '기각');





CREATE TABLE declare(
    id NUMBER(5) PRIMARY KEY,
    reason VARCHAR2(200) NOT NULL,
    declare_type_id NUMBER(5) NOT NULL,
    post_id NUMBER(5) NOT NULL,
    declare_status_id NUMBER(5) NOT NULL,
    CONSTRAINT fk_declare_declare_type FOREIGN KEY(declare_type_id) REFERENCES declare_type(id),
    CONSTRAINT fk_declare_posts FOREIGN KEY(post_id) REFERENCES posts(id),
    CONSTRAINT fk_declare_declare_status FOREIGN KEY(declare_status_id) REFERENCES declare_status(id)
);

CREATE SEQUENCE declare_id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999;
    
SELECT *
FROM declare;

INSERT INTO declare(id, reason, declare_type_id, post_id, declare_status_id)
VALUES(declare_id_seq.NEXTVAL, '게시글에 욕설이 있어요.', 1, 2, 1);

INSERT INTO declare(id, reason, declare_type_id, post_id, declare_status_id)
VALUES(declare_id_seq.NEXTVAL, '선정적이라 삭제 부탁드려요', 2, 1, 2);

INSERT INTO declare(id, reason, declare_type_id, post_id, declare_status_id)
VALUES(declare_id_seq.NEXTVAL, '비매너 행동을 합니다.', 4, 2, 1);





CREATE TABLE follows(
    id NUMBER(5) PRIMARY KEY,
    follower_id NUMBER(5) NOT NULL,
    followee_id NUMBER(5) NOT NULL,
    CONSTRAINT fk_follows_members1 FOREIGN KEY(follower_id) REFERENCES members(id),
    CONSTRAINT fk_follows_members2 FOREIGN KEY(followee_id) REFERENCES members(id)
);

CREATE SEQUENCE follows_id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999;
    
SELECT *
FROM follows;

INSERT INTO follows(id, follower_id, followee_id)
VALUES(follows_id_seq.NEXTVAL, 3, 1);

INSERT INTO follows(id, follower_id, followee_id)
VALUES(follows_id_seq.NEXTVAL, 1, 2);

INSERT INTO follows(id, follower_id, followee_id)
VALUES(follows_id_seq.NEXTVAL, 1, 3);

INSERT INTO follows(id, follower_id, followee_id)
VALUES(follows_id_seq.NEXTVAL, 2, 4);

INSERT INTO follows(id, follower_id, followee_id)
VALUES(follows_id_seq.NEXTVAL, 4, 1);





-- 각 회원의 팔로워 수
SELECT m.id, m.name, COUNT(*) AS 팔로워수 
FROM members m, follows f
WHERE m.id = f.followee_id
GROUP BY m.id, m.name;

-- 자유 게시판에 있는 게시글의 좋아요 수
SELECT p.id, p.title, count(*) AS 좋아요수
FROM categories c, posts p, likes l
WHERE c.id = p.category_id AND p.id = l.post_id AND c.id = 1
GROUP BY p.id, p.title;