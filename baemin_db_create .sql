-- 유저 로그인 이력
CREATE TABLE baemin_db.user_login_log (
 logIdn      INT NOT NULL AUTO_INCREMENT,
 email     VARCHAR(50),
 regIp VARCHAR(50),
 regDate   DATETIME,
  PRIMARY KEY(logIdn)
) ENGINE=MYISAM CHARSET=utf8;