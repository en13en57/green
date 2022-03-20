drop table camp_info;

CREATE TABLE `camp_info` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `firstImageUrl` text ,
  `zipcode` char(7) ,
  `addr1` text ,
  `addr2` text ,
  `facltNm` text ,
  `lineIntro` text ,
  `intro` text ,
  `featureNm` text ,
  `lctCl` text ,
  `doNm` text ,
  `sigunguNm` text ,
  `allar` int(11) ,
  `gnrlSiteCo` int(11) ,
  `autoSiteCo` int(11) ,
  `glampSiteCo` int(11) ,
  `caravSiteCo` int(11) ,
  `indvdlCaravSiteCo` int(11) ,
  `glampInnerFclty` text ,
  `caravInnerFclty` text ,
  `trlerAcmpnyAt` char(1) ,
  `caravAcmpnyAt` char(1) ,
  `eqpmnLendCl` text ,
  `sbrsCl` text ,
  `sbrsEtc` text ,
  `posblFcltyCl` text ,
  `posblFcltyEtc` text ,
  `themaEnvrnCl` text ,
  `animalCmgCl` text ,
  `toiletCo` int(11) ,
  `swrmCo` int(11) ,
  `wtrplCo` int(11) ,
  `brazierCl` text ,
  `siteBottomCl1` int(11) ,
  `siteBottomCl2` int(11) ,
  `siteBottomCl3` int(11) ,
  `siteBottomCl4` int(11) ,
  `siteBottomCl5` int(11) ,
  `homepage` text ,
  `resveUrl` text ,
  `tel` varchar(15) ,
  `induty` text ,
  `mapX` double ,
  `mapY` double ,
  PRIMARY KEY (`idx`)
);

drop table camp_member ;
drop table member_role ;
CREATE TABLE `camp_member` (
  `mb_idx` int(11) NOT NULL auto_increment primary key,
  `mb_ID` varchar(12) not NULL,
  `mb_password` varchar(60) not NULL,
  `mb_name` varchar(15) not NULL,
  `mb_nick` varchar(30) NOT NULL,
  `mb_email` varchar(30) not NULL,
  `mb_tel` varchar(13) not NULL,
  `mb_birth` date not null,
  `mb_zipcode` int not null,
  `mb_address1` varchar(200) not NULL,
  `mb_address2` varchar(300) not NULL,
  `mb_use` int(11) default 0,
  `authkey` varchar(200) not null
);

CREATE TABLE `member_role` (
  `gr_idx` int(11) NOT null AUTO_INCREMENT primary key,
   `mb_ID` varchar(12) not NULL,
  `gr_role` varchar(15) not NULL
);
RENAME TABLE campdb.camp_role TO campdb.member_role;

drop table camp_notice;

CREATE TABLE `camp_notice` (
  `mb_nick` varchar(30) NOT NULL,
  nt_idx int not null auto_increment ,
  `mb_idx` int(11) NOT null,
  `nt_title` varchar(100) not NULL,
  `nt_content` text not NULL,
  `nt_regDate` timestamp default now(),
  `nt_modiDate` timestamp default now(),
  `nt_hit` int(11) default 0,
  PRIMARY KEY (`nt_idx`),
  CONSTRAINT `camp_notice_FK` FOREIGN KEY (`mb_idx`) REFERENCES `camp_member` (`mb_idx`) ON UPDATE CASCADE
);


drop table camp_question;

CREATE TABLE `camp_question` (
  `mb_idx` int(11) NOT null ,
  q_idx int not null auto_increment,
  ref int default 0,
  seq int default 0,
  lev int default 0,
  `q_title` varchar(100) not NULL,
  `q_content` text not NULL,
  `mb_nick` varchar(30) NOT NULL,
  `q_regDate` timestamp default now(),
  `q_modiDate` timestamp default now(),
  `q_hit` int(11) default 0,
  del int default 1,
  PRIMARY KEY (`q_idx`),
  CONSTRAINT `camp_question_FK` FOREIGN KEY (`mb_idx`) REFERENCES `camp_member` (`mb_idx`) ON UPDATE CASCADE
);


-- CREATE TABLE `camp_answer` (
--  `mb_nick` varchar(30) NOT NULL,
--  `mb_idx` int(11) NOT NULL,
--  ref int default 0,
--  seq int default 0,
--  `q_title` varchar(100) not NULL,
--  `q_content` text not NULL,
--  `a_idx` int(11) not NULL,
--  `a_title` varchar(100) not NULL,
--  `a_content` text not NULL,
--  `a_regDate` timestamp default now(),
--  `a_modiDate` timestamp default now(),
--  CONSTRAINT `camp_answer_FK` FOREIGN KEY (`mb_idx`) REFERENCES `camp_question` (`mb_idx`)
-- );

drop table camp_review;
CREATE TABLE `camp_review` ( 
  `mb_idx` int(11) NOT NULL,
  rv_idx int not null auto_increment,
  ref int default 0,
  seq int default 0,
  lev int default 0,
  `mb_nick` varchar(30) NOT NULL,
  `rv_title` varchar(100) not NULL,
  `rv_content` text not NULL,
  `rv_regDate` timestamp default now(),
  `rv_modiDate` timestamp default now(),
  `rv_hit` int(11) default 0,
  del int default 1,
  PRIMARY KEY (`rv_idx`),
  CONSTRAINT `camp_review_FK` FOREIGN KEY (`mb_idx`) REFERENCES `camp_member` (`mb_idx`) ON UPDATE CASCADE
);

-- CREATE TABLE `camp_comment` (
--  `idx` int(11) NOT NULL,
--  `mb_nick` varchar(30) NOT NULL,
--  `cm_content` text not NULL,
--  `cm_regDate` timestamp default now(),
--  `cm_modiDate` timestamp default now(),
--  PRIMARY KEY (`idx`),
--  CONSTRAINT `camp_comment_FK` FOREIGN KEY (`idx`) REFERENCES `camp_review` (`idx`) ON UPDATE CASCADE
-- );

INSERT INTO camp_grade values(0,'미인증','user');
INSERT INTO camp_grade values(1,'인증','member');
INSERT INTO camp_grade values(2,'관리자','admin');


CREATE TABLE `sns_member` (
  `mb_idx` int(11) NOT NULL,
  `sns_id` varchar(255) NOT NULL,
  `sns_type` varchar(10)  NULL,
  `sns_name` varchar(255)  NULL,
  `sns_profile` varchar(255)  NULL,
  `sns_connect_date` datetime  NULL,
  CONSTRAINT `mb_idx` FOREIGN KEY (`mb_idx`) REFERENCES `camp_member` (`mb_idx`)
);

		update camp_member a 
			join member_role mr on 
			a.mb_ID = mr.mb_ID
		set 
			mr.gr_role ='ROLE_USER'
		where 
			mr.mb_ID='rkdendh' and a.authkey='b516e506-649a-4ff7-99e7-112088b65491';

alter table camp_member add column sns_email varchar (200);
