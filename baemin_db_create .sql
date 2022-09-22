-- 유저 로그인 이력
CREATE TABLE baemin_db.user_login_log (
 logIdn      INT NOT NULL AUTO_INCREMENT,
 userEmail     VARCHAR(100) NOT NULL,
 regIp VARCHAR(100) NOT NULL,
 regDate   DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY(logIdn)
) ENGINE=MYISAM CHARSET=utf8;

-- 유저 정보
CREATE TABLE baemin_db.user_info (
 userIdn      INT NOT NULL AUTO_INCREMENT,
 userNickname     VARCHAR(100) NOT NULL,
 userEmail     VARCHAR(100) NOT NULL,
 userPw     VARCHAR(100) NOT NULL,
 userPhonenum    VARCHAR(100) NOT NULL,
 userPoint    INT(11),
 regDate   DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY(userIdn)
) ENGINE=MYISAM CHARSET=utf8;


