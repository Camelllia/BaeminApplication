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

-- 매장 정보
CREATE TABLE baemin_db.bm_store (
 storeIdn      INT NOT NULL AUTO_INCREMENT,
 storeName     VARCHAR(100) NOT NULL,
 storeAddress     VARCHAR(100) NOT NULL,
 storePhonenum     VARCHAR(100) NOT NULL,
 storeIntro     VARCHAR(100) NOT NULL,
 minDelevery    INT(11),
 deleveryTime   INT(11),
 deleveryTip    INT(11),
 categoryNum INT(11),
 imgPath VARCHAR(100) NOT NULL,
  PRIMARY KEY(storeIdn)
) ENGINE=MYISAM CHARSET=utf8;

-- 쿠폰 정보
CREATE TABLE baemin_db.bm_coupon (
 couponIdn      INT NOT NULL AUTO_INCREMENT,
 couponName     VARCHAR(100) NOT NULL,
 discountAmount     INT(11) NOT NULL,
 userIdn 	INT(11) NOT NULL,
 useYn INT(11) NOT NULL DEFAULT 0,
 regDate	DATETIME NOT NULL DEFAULT NOW(),
 endDate    DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY(couponIdn)
) ENGINE=MYISAM CHARSET=utf8;

-- 리뷰 테이블
CREATE TABLE baemin_db.bm_review (
 reviewIdn      INT NOT NULL AUTO_INCREMENT,
 reviewTitle     VARCHAR(100) NOT NULL,
 reviewContent    VARCHAR(100) NOT NULL,
 reviewScore    INT(11) NOT NULL,
 imgPath     VARCHAR(100),
 storeIdn    INT(11) NOT NULL,
 userIdn   INT(11) NOT NULL,
 userNickname    VARCHAR(100) NOT NULL,
 regDate DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY(reviewIdn)
) ENGINE=MYISAM CHARSET=utf8;

-- 메뉴 테이블
CREATE TABLE baemin_db.bm_menu (
 menuIdn      INT NOT NULL AUTO_INCREMENT,
 menuName     VARCHAR(100) NOT NULL,
 menuPrice INT(11) NOT NULL,
 imgPath     VARCHAR(100),
 storeIdn    INT(11) NOT NULL,
 regDate DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY(menuIdn)
) ENGINE=MYISAM CHARSET=utf8;

-- 주문 테이블
CREATE TABLE baemin_db.bm_order (
 orderIdn      INT NOT NULL AUTO_INCREMENT,
 orderAddress     VARCHAR(100) NOT NULL,
 orderPrice INT(11) NOT NULL,
 paymentType INT(11) NOT NULL,
 storeIdn    INT(11) NOT NULL,
 userIdn INT(11) NOT NULL,
 regDate DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY(orderIdn)
) ENGINE=MYISAM CHARSET=utf8;

-- 장바구니 테이블
CREATE TABLE baemin_db.bm_basket (
 basketIdn      INT NOT NULL AUTO_INCREMENT,
 menuName     VARCHAR(100) NOT NULL,
 menuPrice INT(11) NOT NULL,
 storeIdn    INT(11) NOT NULL,
 userIdn INT(11) NOT NULL,
 regDate DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY(basketIdn)
) ENGINE=MYISAM CHARSET=utf8;

