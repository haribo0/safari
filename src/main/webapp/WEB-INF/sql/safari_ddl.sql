----- Safari Project DB -----

---------------- 공통 ------------------
-- common user table
drop table user_table;
create table user_table(
    id number primary key,
    email varchar2(50),
    pw varchar2(20),
    nickname varchar2(20),
    phone varchar2(15) ,
    gender varchar2(1),
    birth date,
    profile_img_link varchar2(4000),
    reg_date date
);
-- user table sequence
drop sequence user_table_seq;
create sequence user_table_seq;


-- coin 테이블 ddl
-- coin_table
drop table coin_table;
CREATE TABLE coin_table (
    id	number	primary key,
	user_id	number,
	coin_transaction number,
	transaction_operand	varchar2(1),
	transaction_detail	varchar2(500),
	reg_date date
);
-- coin_table sequence
drop sequence coin_table_seq;
create sequence coin_table_seq;


-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--  USER 주소 T (O)
DROP TABLE user_address_table;
CREATE TABLE user_address_table(
  id NUMBER PRIMARY KEY,
  user_id NUMBER,
  addressee VARCHAR2(100),
  address VARCHAR2(1000),
  address_name VARCHAR2(1000),
  phone VARCHAR2(15)
  );
DROP SEQUENCE user_address_table_seq;
CREATE SEQUENCE user_address_table_seq;  




-- 상품 대분류 카테고리
DROP TABLE product_main_category;
CREATE TABLE product_main_category(
	id NUMBER PRIMARY KEY,
	main_category_name varchar2(100)
);

drop sequence product_main_category_seq;
create sequence product_main_category_seq;

INSERT INTO product_main_category values(
	product_main_category_seq.nextval,
	'패션의류'
);
INSERT INTO product_main_category values(
	product_main_category_seq.nextval,
	'패션잡화'
);
INSERT INTO product_main_category values(
	product_main_category_seq.nextval,
	'IT용품'
);
INSERT INTO product_main_category values(
	product_main_category_seq.nextval,
	'생활용품'
);
SELECT * FROM PRODUCT_MAIN_CATEGORY ORDER BY id;
SELECT * FROM product_sub_category WHERE product_main_category_id=1;

-- 상품 소분류 카테고리
DROP TABLE product_sub_category;
CREATE TABLE product_sub_category(
	id NUMBER PRIMARY KEY,
	product_main_category_id NUMBER,
	sub_category_name varchar2(100)
);

drop sequence product_sub_category;
create sequence product_sub_category_seq;

INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	1,
	'상의'
);	
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	1,
	'하의'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	1,
	'언더웨어'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	2,
	'신발'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	2,
	'가방'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	2,
	'액세서리'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	3,
	'PC/노트북'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	3,
	'휴대폰'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	3,
	'태블릿'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	3,
	'카메라'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	4,
	'가구'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	4,
	'가전제품'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	4,
	'뷰티'
);


--------------------------------------------
-------------------- 중고 --------------------

--  상품 대분류 카테고리
DROP TABLE product_main_category;
CREATE TABLE product_main_category(
	id NUMBER PRIMARY KEY,
	main_category_name varchar2(100)
);

drop sequence product_main_category_seq;
create sequence product_main_category_seq;

INSERT INTO product_main_category values(
	product_main_category_seq.nextval,
	'패션의류'
);
INSERT INTO product_main_category values(
	product_main_category_seq.nextval,
	'패션잡화'
);
INSERT INTO product_main_category values(
	product_main_category_seq.nextval,
	'IT용품'
);
INSERT INTO product_main_category values(
	product_main_category_seq.nextval,
	'생활용품'
);
SELECT * FROM PRODUCT_MAIN_CATEGORY ORDER BY id;
SELECT * FROM product_sub_category WHERE product_main_category_id=1;

-- 상품 소분류 카테고리
DROP TABLE product_sub_category;
CREATE TABLE product_sub_category(
	id NUMBER PRIMARY KEY,
	product_main_category_id NUMBER,
	sub_category_name varchar2(100)
);

drop sequence product_sub_category;
create sequence product_sub_category_seq;

INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	1,
	'상의'
);	
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	1,
	'하의'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	1,
	'언더웨어'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	2,
	'신발'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	2,
	'가방'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	2,
	'액세서리'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	3,
	'PC/노트북'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	3,
	'휴대폰'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	3,
	'태블릿'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	3,
	'카메라'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	4,
	'가구'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	4,
	'가전제품'
);
INSERT INTO product_sub_category values(
	product_sub_category_seq.nextval,
	4,
	'뷰티'
);

-- 상품 
DROP TABLE product;
CREATE TABLE product(
	id NUMBER PRIMARY KEY,
	user_id NUMBER,
	product_sub_category NUMBER,
	title varchar2(2000),
	price NUMBER,
	content varchar2(4000),
	location varchar2(100),
	views NUMBER,
	reg_date DATE,
	product_town_id number
);

drop sequence product_seq;
create sequence product_seq;

-- 도시 위치 
DROP TABLE product_city;
CREATE TABLE product_city(
	id NUMBER PRIMARY KEY,
	product_city_name varchar2(100)
);

drop sequence product_city_seq;
create sequence product_city_seq;

INSERT INTO PRODUCT_CITY VALUES(
	product_city_seq.nextval,
	'서울특별시'
); 

INSERT INTO PRODUCT_CITY VALUES(
	product_city_seq.nextval,
	'경기도'
);

INSERT INTO PRODUCT_CITY VALUES(
	product_city_seq.nextval,
	'인천광역시'
);
SELECT * FROM PRODUCT_CITY;

-- 동네 위치 
DROP TABLE product_town;
CREATE TABLE product_town(
	id NUMBER PRIMARY KEY,
	product_city_id NUMBER,
	product_town_name varchar2(100)
);

drop sequence product_town_seq;
create sequence product_town_seq;

INSERT INTO PRODUCT_TOWN VALUES(
	product_town_seq.nextval,
	1,
	'강남구'
); 
INSERT INTO PRODUCT_TOWN VALUES(
	product_town_seq.nextval,
	1,
	'마포구'
); 
INSERT INTO PRODUCT_TOWN VALUES(
	product_town_seq.nextval,
	1,
    '용산구'
); 
INSERT INTO PRODUCT_TOWN VALUES(
	product_town_seq.nextval,
	2,
	'구리시'
); 
INSERT INTO PRODUCT_TOWN VALUES(
	product_town_seq.nextval,
	2,
	'양평군'
); 
INSERT INTO PRODUCT_TOWN VALUES(
	product_town_seq.nextval,
	2,
	'하남시'
); 
INSERT INTO PRODUCT_TOWN VALUES(
	product_town_seq.nextval,
	3,
	'강화군'
); 
INSERT INTO PRODUCT_TOWN VALUES(
	product_town_seq.nextval,
	3,
	'부평구'
); 
INSERT INTO PRODUCT_TOWN VALUES(
	product_town_seq.nextval,
	3,
	'서구'
); 

-- 상품 이미지
DROP TABLE product_img;
CREATE TABLE product_img(
	id NUMBER PRIMARY KEY,
	product_id NUMBER,
	product_img_link varchar2(4000)
);

drop sequence product_img_seq;
create sequence product_img_seq;
-- 상품찜
DROP TABLE product_like;
CREATE TABLE product_like(
	id NUMBER PRIMARY KEY,
	product_id NUMBER,
	user_id NUMBER,
	reg_date DATE
);

drop sequence product_like_seq;
create sequence product_like_seq;

-- 상품 거래 요청
DROP TABLE product_request;
CREATE TABLE product_request(
	id NUMBER PRIMARY KEY,
	product_id NUMBER,
	user_id NUMBER,
	status varchar2(100),
	reg_date DATE
);

drop sequence product_request_seq;
create sequence product_request_seq;

-- 채팅방 
DROP TABLE product_chat;
CREATE TABLE product_chat(
	id NUMBER PRIMARY KEY,
	purchase_request_id NUMBER,
	sender_id NUMBER,
	receiver_id NUMBER,
	content varchar2(4000),
	read_unread varchar2(1),
	reg_date DATE
);

drop sequence product_chat_seq;
create sequence product_chat_seq;

-- 중고거래리뷰
DROP TABLE used_purchase_review;
CREATE TABLE used_purchase_review(
	id NUMBER PRIMARY KEY,
	purchase_request_id NUMBER,
	sender_id NUMBER,
	receiver_id NUMBER,
	review_comment varchar2(100),
	review_img_link varchar2(4000),
	reg_date DATE
);

drop sequence used_purchase_review_seq;
create sequence used_purchase_review_seq;

-- 리뷰 만족도 카테고리 
DROP TABLE used_review_rate_category;
CREATE TABLE used_review_rate_category(
	id NUMBER PRIMARY KEY,
	content varchar2(100),
	question varchar2(100),
	img_title varchar2(500),
	textarea_content varchar2(100)
);

drop sequence used_review_rate_category_seq;
create sequence used_review_rate_category_seq;

INSERT INTO used_review_rate_category values(
	used_review_rate_category_seq.nextval,
	'별로예요',
	'어떤 점이 별로였나요?',
	'soso1',
	'아쉬웠던 점을 알려주세요.'
);
INSERT INTO used_review_rate_category values(
	used_review_rate_category_seq.nextval,
	'좋아요',
	'어떤 점이 좋았나요?',
	'good1',
	'따뜻한 거래 경험을 알려주세요.'
);
INSERT INTO used_review_rate_category values(
	used_review_rate_category_seq.nextval,
	'최고예요',
	'어떤 점이 최고였나요?',
	'best1',
	'따뜻한 거래 경험을 알려주세요.'
);

-- 리뷰 체크박스 카테고리
DROP TABLE used_review_checkbox_category;
CREATE TABLE used_review_checkbox_category(
	id NUMBER PRIMARY KEY,
	review_rate_category_id NUMBER,
	content varchar2(100)
);
drop sequence used_review_checkbox_kind_seq;
create sequence used_review_checkbox_kind_seq;

SELECT * FROM used_review_checkbox_category;

INSERT INTO used_review_checkbox_category values(
	used_review_checkbox_kind_seq.nextval,
	1,
	'시간약속을 안 지켜요.'
);
INSERT INTO used_review_checkbox_category values(
	used_review_checkbox_kind_seq.nextval,
	1,
	'원하지 않는 가격을 계속 요구해요.'
);
INSERT INTO used_review_checkbox_category values(
	used_review_checkbox_kind_seq.nextval,
	1,
	'거래 시간과 장소를 정한 후 연락이 안돼요.'
);
INSERT INTO used_review_checkbox_category values(
	used_review_checkbox_kind_seq.nextval,
	1,
	'불친절해요.'
);
INSERT INTO used_review_checkbox_category values(
	used_review_checkbox_kind_seq.nextval,
	2,
	'제가 있는 곳까지 와서 거래했어요.'
);
INSERT INTO used_review_checkbox_category values(
	used_review_checkbox_kind_seq.nextval,
	2,
	'응답이 빨라요.'
);
INSERT INTO used_review_checkbox_category values(
	used_review_checkbox_kind_seq.nextval,
	2,
	'친절하고 매너가 좋아요.'
);
INSERT INTO used_review_checkbox_category values(
	used_review_checkbox_kind_seq.nextval,
	2,
	'시간 약속을 잘 지켜요.'
);
INSERT INTO used_review_checkbox_category values(
	used_review_checkbox_kind_seq.nextval,
	3,
	'제가 있는 곳까지 와서 거래했어요.'
);
INSERT INTO used_review_checkbox_category values(
	used_review_checkbox_kind_seq.nextval,
	3,
	'응답이 빨라요.'
);
INSERT INTO used_review_checkbox_category values(
	used_review_checkbox_kind_seq.nextval,
	3,
	'친절하고 매너가 좋아요.'
);
INSERT INTO used_review_checkbox_category values(
	used_review_checkbox_kind_seq.nextval,
	3,
	'시간 약속을 잘 지켜요.'
);



— 거래리뷰&체크박스 선택
DROP TABLE used_checkbox_selected_review;
CREATE TABLE used_checkbox_selected_review(
	id NUMBER PRIMARY KEY,
	product_review_id NUMBER,
	review_checkbox_category_id NUMBER
);
drop sequence used_select_review_seq;
create sequence used_select_review_seq;






-------------------- 대여 -----------------------
------------------- rental ----------------------


-- rental main category table 
create table rental_main_category_table(
    id number primary key,
    main_category_name varchar2(100)
);
-- rental main category table sequence
drop sequence rental_main_category_table_seq;
create sequence rental_main_category_table_seq;



-- rental sub category table 
create table rental_sub_category_table(
    id number primary key,
    main_category_id number,
    sub_category_name varchar2(100)
);
-- rental sub category table sequence
drop sequence rental_sub_category_table_seq;
create sequence rental_sub_category_table_seq;



-- rental buisness table 
drop table rental_buisness_table;
create table rental_buisness_table(
    id number primary key,
    business_userid varchar2(20),
    pw varchar2(20),
    reg_num number,
    reg_img_link varchar2(4000),
    business_owner varchar2(50),
    business_name varchar2(100),
    business_address varchar2(100),
    phone varchar2(20),
    reg_date date,
    permission varchar2(1)
);
-- rental buisness table sequence
drop sequence rental_buisness_table_seq;
create sequence rental_buisness_table_seq;



-- rental item like table
drop table rental_item_like_table;
create table rental_item_like_table(
    id number primary key,
    user_id number,
    item_id number,
    reg_date date
);
-- rental sub category table sequence
drop sequence rental_item_like_table_seq;
create sequence rental_item_like_table_seq;




-- rental item img table 
drop table rental_item_img_table;
create table rental_item_img_table(
    id number primary key,
    item_id number,
    img_link varchar2(4000)
);
-- rental item img table sequence
drop sequence rental_item_img_table_seq;
create sequence rental_item_img_table_seq;



-- rental review table
drop table rental_review_table;
create table rental_review_table(
    id number primary key,
    user_id number,
    rental_id number,
    rental_review_title varchar2(500),
    rental_review_content varchar2(4000),
    rental_review_rating number,
    rental_review_views number,
    rental_reply_review varchar2(2000),
    rental_reply_reg_date DATE,
    reg_date DATE
);
-- rental review like table sequence
drop sequence rental_review_table_seq;
create sequence rental_review_table_seq;



-- rental review like table
create table rental_review_like_table(
    id number primary key,
    user_id number,
    review_id number,
    review_like number
);
-- rental review like table sequence
drop sequence rental_review_like_table_seq;
create sequence rental_review_like_table_seq;



-- rental review img table
drop table rental_review_img_table;
create table rental_review_img_table(
    id number primary key,
    review_id number,
    rental_review_img varchar2(1000)
);
-- rental review img table sequence
drop sequence rental_review_img_table_seq;
create sequence rental_review_img_table_seq;



-- rental order table
drop table rental_order_table;
create table rental_order_table(
    id number primary key,
    user_id number,
    item_id number,
    start_date date,
    end_date date,
    address varchar2(100),
    price number,
    original_price number,
    deposit number,
    reg_date date,
    is_shipped varchar2(1),
    name varchar(10)
);
-- rental order table sequence
drop sequence rental_order_table_seq;
create sequence rental_order_table_seq;


-- rental item table(¿Ï)
drop table rental_item_table;
create table rental_item_table(
    id number primary key,
    business_id number,
    sub_category_id number,
    title varchar2(100),
    item_description varchar2(100),
    main_img_link varchar2(4000),
    deposit number,
    price number,
    quantity number,
    reg_date date
);
-- rental review img table sequence
drop sequence rental_item_table_seq;
create sequence rental_item_table_seq;

SELECT * FROM rental_item_table rot 
ORDER BY id desc;

ALTER TABLE rental_item_table
MODIFY item_description varchar2(1000);
COMMIT;


-- rental_surcharge_bill table
drop table rental_surcharge_bill_table;
create table rental_surcharge_bill_table(
    id number primary key,
    rental_return_id number,
    condition_check_charge number,
    is_completed varchar2(1)
);
-- rental_surcharge_bill sequence
drop sequence rental_surcharge_bill_seq;
create sequence rental_surcharge_bill_seq;




-- rental_item_return table
drop table rental_item_return_table;
create table rental_item_return_table(
    id number primary key,
    rental_order_id number,
    is_item_returned varchar2(1),
    discount_revocation NUMBER,
    is_completed varchar2(1),
    reg_date date
);
-- rental_item_return_table sequence
drop sequence rental_item_return_table_seq;
create sequence rental_item_return_table_seq;


-- rental_main_category table
drop table rental_main_category_table;
create table rental_main_category_table(
    id number primary key,
    main_category_name varchar2(100)
);
-- rental_main_category_table sequence
drop sequence rental_main_category_table_seq;
create sequence rental_main_category_table_seq;


-- rental_return_extra_charge table
drop table rental_return_extra_charge;
create table rental_return_extra_charge(
    id number primary key,
    return_id NUMBER,
    reason varchar2(1000),
    charge number
);
-- rental_return_extra_charge sequence
drop sequence rental_return_extra_charge_seq;
create sequence rental_return_extra_charge_seq;





DROP TABLE rental_order_kakaopay_table;
CREATE TABLE rental_order_kakaopay_table (
    id number primary key,
    partner_user_id number,
    cid VARCHAR2(1000),
    tid VARCHAR2(1000),
    amount number,
    pg_token varchar2(1000),
    payment_method_type varchar2(1000),
    partner_order_id number,
    item_name varchar2(1000),
    next_redirect_pc_url varchar2(1000),
    reg_date DATE
);

DROP SEQUENCE rental_order_kakaopay_seq;
CREATE SEQUENCE rental_order_kakaopay_seq;


DROP TABLE rental_order_kakaopay_approve;
create table rental_order_kakaopay_approve(
    id number primary key,
    aid varchar2(1000),
    tid varchar2(1000),
    cid varchar2(1000),
    sid varchar2(1000),
    partner_order_id varchar2(1000),
    partner_user_id varchar2(1000),
    payment_method_type varchar2(1000),
    item_name varchar2(1000),
    quantity number,
    created_at date,
    approve_at date
);

DROP SEQUENCE rental_ord_kakaopay_apprv_seq;
CREATE SEQUENCE rental_ord_kakaopay_apprv_seq;

DROP TABLE rental_order_kakaopay_amount;
create table rental_order_kakaopay_amount(
    id number primary key,
    total number,
    tax_free number,
    vat number,
    point number,
    discount number,
    green_deposit number
);



create table rental_order_kakaopay_inactv(
    id number primary key,
    cid varchar2(1000),
    sid varchar2(1000),
    status varchar2(1000),
    created_at DATE,
    last_approved_at DATE,
    inactivated_at DATE
);


DROP SEQUENCE rental_ord_kakaopay_inactv_seq;
CREATE SEQUENCE rental_ord_kakaopay_inactv_seq;

   

DROP TABLE rental_ads_table;
CREATE TABLE rental_ads_table (
	id NUMBER PRIMARY KEY,
	item_id NUMBER,
	price NUMBER,
	period varchar2(20),
	reg_date DATE,
	end_date DATE
);
DROP SEQUENCE rental_ads_table_seq;
CREATE SEQUENCE rental_ads_table_seq;




DROP TABLE rental_return_kakaopay_approve;
create table rental_return_kakaopay_approve(
    id number primary key,
    aid varchar2(1000),
    tid varchar2(1000),
    cid varchar2(1000),
    partner_order_id varchar2(1000),
    partner_user_id varchar2(1000),
    payment_method_type varchar2(1000),
    item_name varchar2(1000),
    quantity number,
    created_at date,
    approve_at date
);

DROP SEQUENCE rental_rtn_kakaopay_apprv_seq;
CREATE SEQUENCE rental_rtn_kakaopay_apprv_seq;

DROP TABLE rental_return_kakaopay_amount;
create table rental_return_kakaopay_amount(
    id number primary key,
    total number,
    tax_free number,
    vat number,
    point number,
    discount number,
    green_deposit number
);


DROP TABLE rental_order_kakaopay_table;
CREATE TABLE rental_order_kakaopay_table (
    id number primary key,
    partner_user_id number,
    cid VARCHAR2(1000),
    tid VARCHAR2(1000),
    amount number,
    pg_token varchar2(1000),
    payment_method_type varchar2(1000),
    partner_order_id number,
    item_name varchar2(1000),
    next_redirect_pc_url varchar2(1000),
    reg_date DATE
);

DROP SEQUENCE rental_order_kakaopay_seq;
CREATE SEQUENCE rental_order_kakaopay_seq;


DROP TABLE rental_order_kakaopay_approve;
create table rental_order_kakaopay_approve(
    id number primary key,
    aid varchar2(1000),
    tid varchar2(1000),
    cid varchar2(1000),
    sid varchar2(1000),
    partner_order_id varchar2(1000),
    partner_user_id varchar2(1000),
    payment_method_type varchar2(1000),
    item_name varchar2(1000),
    quantity number,
    created_at date,
    approve_at date
);
DROP SEQUENCE rental_ord_kakaopay_apprv_seq;
CREATE SEQUENCE rental_ord_kakaopay_apprv_seq;

DROP TABLE rental_order_kakaopay_amount;
create table rental_order_kakaopay_amount(
    id number primary key,
    total number,
    tax_free number,
    vat number,
    point number,
    discount number,
    green_deposit number
);



DROP TABLE rental_order_kakaopay_inactv;
create table rental_order_kakaopay_inactv(
    id number primary key,
    cid varchar2(1000),
    sid varchar2(1000),
    status varchar2(1000),
    created_at DATE,
    inactivated_at DATE
);

DROP SEQUENCE rental_ord_kakaopay_inactv_seq;
CREATE SEQUENCE rental_ord_kakaopay_inactv_seq;




------------------------------------------------------------
----------------------- 경매  시작 ---------------------------

-- 경매 T (O)
DROP TABLE auction_item CASCADE CONSTRAINTS;
CREATE TABLE auction_item (
	id	number	primary key,
	user_seller_id	number,
	auction_sub_category_id	number,
	title	varchar2(200),
	description	varchar2(4000),
    start_price	number,
	max_price number,
	auction_status	varchar2(10),
	start_date	timestamp,
    end_date	timestamp,
	reg_date	date	
);
drop sequence auction_item_seq;
create sequence auction_item_seq;

-- 경매 : 이미지 T (O)
DROP TABLE auction_item_img CASCADE CONSTRAINTS;
CREATE TABLE auction_item_img (
	id	number	primary key,
	auction_item_id	number,
	auction_item_img_link	varchar2(4000) NULL
);
drop sequence auction_item_img_seq;
create sequence auction_item_img_seq;

-- 경매 : 찜 T (O)
DROP TABLE auction_item_like CASCADE CONSTRAINTS;
CREATE TABLE auction_item_like (
	id	number	primary key,
  auction_item_id	number,
	user_buyer_id	number,
	reg_date	date	
);
drop sequence auction_item_like_seq;
create sequence auction_item_like_seq;


-- 경매 : 채팅 T (O)
DROP TABLE auction_item_chatroom CASCADE CONSTRAINTS;
  CREATE TABLE auction_item_chatroom (
	id	number	primary key,
	auction_item_id	number,
	user_id number	NOT NULL,
	content	varchar2(1000),
	reg_date	date	
);
drop sequence auction_item_chatroom_seq;
create sequence auction_item_chatroom_seq;

-- 경매 : 입찰 T (O)
DROP TABLE auction_item_bid_request CASCADE CONSTRAINTS;
CREATE TABLE auction_item_bid_request (
	id	number	primary key, 
	auction_item_id	number, 
	user_buyer_id	number, 
	bid_price number, 
	reg_date	date	
);
drop sequence auction_item_bid_request_seq;
create sequence auction_item_bid_request_seq;



-- 경매 : 카카오 결제 정보 저장 T (O)
DROP TABLE auction_kakao_payment;
CREATE TABLE auction_kakao_payment(
  id NUMBER PRIMARY KEY,
  partner_order_id NUMBER,
  cid VARCHAR2(1000),
  tid VARCHAR2(1000),
  partner_user_id NUMBER,
  pg_token VARCHAR2(1000),
  item_name VARCHAR2(1000),
  amount NUMBER,
  payment_method_type VARCHAR2(1000),
  reg_date DATE
  );
DROP SEQUENCE auction_kakao_payment_seq;
CREATE SEQUENCE auction_kakao_payment_seq;


-- 경매 : 배송 T (O)
DROP TABLE auction_delivery_after_payment;
CREATE TABLE auction_delivery_after_payment(
  id NUMBER PRIMARY KEY,
  partner_order_id NUMBER,
  delivery_status VARCHAR2(1000),
  reg_date DATE
  );
DROP SEQUENCE delivery_seq; 
CREATE SEQUENCE delivery_seq;


-- 경매 : 구매 확정 T (O)
DROP TABLE auction_purchase_confirmed;
CREATE TABLE auction_purchase_confirmed(
    partner_order_id NUMBER,
    delivery_payment_id NUMBER,
    reg_date DATE
);


-- 경매 : 문의 T (O)
DROP TABLE auction_item_inquiry;
CREATE TABLE auction_item_inquiry(
    id NUMBER PRIMARY KEY,
    auction_item_id NUMBER,
    user_buyer_id NUMBER,
    content VARCHAR2(4000),
    reg_date DATE
    );
DROP SEQUENCE auction_item_inquiry_seq;
CREATE SEQUENCE auction_item_inquiry_seq;
    
-- 경매 : 문의에 대한 답변 T (O)
DROP TABLE auction_item_reply;
CREATE TABLE auction_item_reply(
    id NUMBER PRIMARY KEY,
    auction_item_inquiry_id NUMBER,
    user_seller_id NUMBER,
    content VARCHAR2(4000),
    reg_date DATE
    );    
DROP SEQUENCE auction_item_reply_seq;
CREATE SEQUENCE auction_item_reply_seq; 


-- 경매 : 주문 정보 저장 T (배송) (O)
DROP TABLE auction_item_order_address;
CREATE TABLE auction_item_order_address(
  id NUMBER PRIMARY KEY,
  address VARCHAR2(4000),
  phone VARCHAR2(15),
  delivery_message VARCHAR2(4000)
);  




----------------------- 경매 끝 ---------------------------









------------------- 고객지원팀 -------------------
--------------- Customer Support ---------------

SELECT * FROM cs_schedule;
DROP TABLE cs_schedule;
CREATE TABLE cs_schedule (
    id number PRIMARY KEY,
    emp_id number,
    weekday varchar2(20),
    start_time number,
    end_time number
);
DROP SEQUENCE cs_schedule_seq;
CREATE SEQUENCE cs_schedule_seq;



SELECT * FROM cs_emp;
WHERE username = 'kimjiyoung'
AND password = '1234';

UPDATE  cs_emp
SET username = 'k',
	password = '1'
WHERE id = 1;

COMMIT;

SELECT * FROM  cs_emp ;
DELETE FROM cs_emp WHERE id BETWEEN 2 AND 9;
COMMIT;
DROP TABLE cs_emp ;
CREATE TABLE cs_emp (
    id number PRIMARY KEY,
    master number,
    department varchar2(30),
    job_position varchar2(20),
    name varchar2(20),
    nickname varchar2(30),
    username varchar2(30),
    password varchar2(30),
    reg_date date
);
DROP SEQUENCE cs_emp_seq;
CREATE SEQUENCE cs_emp_seq;




SELECT * FROM  cs_attendance_log;
DROP TABLE cs_attendance_log;
CREATE TABLE cs_attendance_log (
    id number PRIMARY KEY,
    emp_id number,
    time_in date,
    time_out date
);
DROP SEQUENCE cs_attendance_log_seq;
CREATE SEQUENCE cs_attendance_log_seq;




SELECT * FROM  cs_qna;
DROP TABLE cs_qna;
CREATE TABLE cs_qna (
    id number PRIMARY KEY,
    user_id number,
    category_id number,
    emp_id number,
    qna_title varchar2(100),
    qna_content varchar2(4000),
    reg_date date,
    qna_reply varchar2(4000),
    reply_date date
);
DROP SEQUENCE cs_qna_seq;
CREATE SEQUENCE cs_qna_seq;



SELECT * FROM  cs_live_chat;
CREATE TABLE cs_live_chat (
    id number PRIMARY KEY,
    user_id number,
    category_id number,
    emp_id number,
    reg_date date,
    end_date date
);
DROP SEQUENCE cs_live_chat_seq;
CREATE SEQUENCE cs_live_chat_seq;



SELECT * FROM  cs_live_chat_msg;
DROP TABLE cs_live_chat_msg;
CREATE TABLE cs_live_chat_msg (
    id number PRIMARY KEY,
    chat_id number,
    sender number,
    msg varchar2(4000),
    reg_date date,
    is_read number
);
DROP SEQUENCE cs_live_chat_msg_seq;
CREATE SEQUENCE cs_live_chat_msg_seq;



SELECT * FROM  cs_live_chat_rating;
DROP TABLE cs_live_chat_rating;
CREATE TABLE cs_live_chat_rating (
    id number PRIMARY KEY,
    chat_id number,
    rating number,
    text_review varchar2(4000)
);
DROP SEQUENCE cs_live_chat_rating_seq;
CREATE SEQUENCE cs_live_chat_rating_seq;




SELECT * FROM  cs_qna_rating;
DROP TABLE cs_qna_rating;
CREATE TABLE cs_qna_rating (
    id number PRIMARY KEY,
    qna_id number,
    rating number,
    text_review varchar2(4000)
);
DROP SEQUENCE cs_qna_rating_seq;
CREATE SEQUENCE cs_qna_rating_seq;



SELECT * FROM  cs_category;
DROP TABLE cs_category;
CREATE TABLE cs_category (
    id number PRIMARY KEY,
    category varchar2(20)
);
DROP SEQUENCE cs_category_seq;
CREATE SEQUENCE cs_category_seq;



SELECT * FROM  cs_live_chat_rating;
DROP TABLE cs_live_chat_rating;
CREATE TABLE cs_live_chat_rating (
    id number PRIMARY KEY,
    chat_id number,
    rating number,
    text_review varchar2(4000) NULL
);
DROP SEQUENCE cs_live_chat_rating_seq;
CREATE SEQUENCE cs_live_chat_rating_seq;




SELECT * FROM  cs_qna_rating;
DROP TABLE cs_qna_rating;
CREATE TABLE cs_qna_rating (
    id number PRIMARY KEY,
    qna_id number,
    rating number,
    text_review varchar2(4000) NULL
);
DROP SEQUENCE cs_qna_rating_seq;
CREATE SEQUENCE cs_qna_rating_seq;




---------- emp 팀장 insert ----------

SELECT * FROM cs_emp;

INSERT INTO cs_emp values(
	cs_emp_seq.nextval,
    1,
    '고객관리',
    '팀장',
    '김지영',
    'young',
    'k',
    '1',
    sysdate
);


---------- 카테고리 insert ----------

SELECT * FROM cs_category;

INSERT INTO cs_category values(
	cs_category_seq.nextval,
	'중고'
);

INSERT INTO cs_category values(
	cs_category_seq.nextval,
	'대여'
);

INSERT INTO cs_category values(
	cs_category_seq.nextval,
	'경매'
);

INSERT INTO cs_category values(
	cs_category_seq.nextval,
	'커뮤니티'
);

INSERT INTO cs_category values(
	cs_category_seq.nextval,
	'기타'
);





-------------------------------------
--------------- 커뮤니티 ---------------

--커뮤니티 골라줘요, 구인구직 테이블 DDL--                                                         
---- 구인구직
--공고게시물 테이블
DROP TABLE recruit_table;
CREATE TABLE recruit_table (
   id number primary key,
   user_id   number,
   position_category_id   number,
   title   varchar2(2000),
   content   varchar2(4000),
   phone   varchar2(20),
   email   varchar2(50),
   salary   number,
   location   varchar2(100),
   opening   number,
   gender   varchar2(1),
   career   number,
   views   number,
   recruit_status   varchar2(50),
   end_date   date,
   reg_date   date
);

DROP SEQUENCE recruit_table_seq;
CREATE SEQUENCE recruit_table_seq;

--직업카테고리 테이블
DROP TABLE position_category_table;
CREATE TABLE position_category_table (
   id number primary key,
   category_name   varchar2(20)
);

DROP SEQUENCE position_category_table_seq;
CREATE SEQUENCE position_category_table_seq;


--공고게시물이미지링크 테이블
DROP TABLE recruit_img_link_table;
CREATE TABLE recruit_img_link_table (
   id number primary key,
   recruit_id   number,
    img_name   varchar2(4000),
   img_link   varchar2(4000)
);

DROP SEQUENCE recruit_img_link_table_seq;
CREATE SEQUENCE recruit_img_link_table_seq;

--공고 좋아요 테이블
DROP TABLE recruit_like_table;
CREATE TABLE recruit_like_table(
    id number primary key,
    user_id   number,
    recruit_id   number,
    reg_date DATE
);
DROP SEQUENCE recruit_like_table_seq;
CREATE SEQUENCE recruit_like_table_seq;
-------------------------------------------------------
--골라줘요--
--골라줘요 게시물 테이블
DROP TABLE pick_table;
CREATE TABLE pick_table(
    id number primary key,
    user_id number,
    title varchar2(4000),
    content varchar2(4000),
    views number,
    reg_date date
);
DROP SEQUENCE pick_table_seq;
CREATE SEQUENCE pick_table_seq;

--골라줘요 게시물 좋아요 테이블
DROP TABLE pick_like_table;
CREATE TABLE pick_like_table(
    id number primary key,
    user_id number,
    pick_id number,
    reg_date date
);
DROP SEQUENCE pick_like_table_seq;
CREATE SEQUENCE pick_like_table_seq;

--골라줘요 게시물 댓글 테이블
DROP TABLE pick_comment_table;
CREATE TABLE pick_comment_table(
    id number primary key,
    user_id number,
    pick_id number,
    content varchar2(4000),
    reg_date date
);
DROP SEQUENCE pick_comment_table_seq;
CREATE SEQUENCE pick_comment_table_seq;

--(나중에 추가.)
--골라줘요 게시물 옵션 테이블
DROP TABLE pick_option_table;
CREATE TABLE pick_option_table(
    id number primary key,
    pick_id number,
    product_id number
);
DROP SEQUENCE pick_option_table_seq;
CREATE SEQUENCE pick_option_table_seq;

--골라줘요 옵션 투표 테이블
DROP TABLE pick_option_vote_table;
CREATE TABLE pick_option_vote_table(
    id number primary key,
    user_id number,
    pick_option_id number,
    reg_date date
);
DROP SEQUENCE pick_option_vote_table_seq;
CREATE SEQUENCE pick_option_vote_table_seq;


--골라줘요 게시물 해쉬태그 테이블
DROP TABLE pick_hashtag_table;
CREATE TABLE pick_hashtag_table(
    id number primary key,
    user_id number,
    pick_id number,
    hashtag_category number,
    content varchar2(1000),
    reg_date date
);
DROP SEQUENCE pick_hashtag_table_seq;
CREATE SEQUENCE pick_hashtag_table_seq;


-- 리워드 리뷰 table
DROP TABLE promotion_review;
CREATE TABLE promotion_review (
   id NUMBER PRIMARY KEY,
   user_id NUMBER,
   rental_item_id NUMBER,
   promotion_review_title VARCHAR2(500),
   promotion_review_content VARCHAR2(4000),
   promotion_review_rating NUMBER,
   promotion_review_views NUMBER,
   reg_date DATE
);
DROP SEQUENCE promotion_review_seq;
CREATE SEQUENCE promotion_review_seq;

-- 리워드 리뷰 게시글 이미지 table
DROP TABLE promotion_review_img;
CREATE TABLE promotion_review_img (
   id NUMBER PRIMARY KEY,
   promotion_review_id NUMBER,
   rental_review_img VARCHAR2(4000)
);
DROP SEQUENCE promotion_review_img_seq;
CREATE SEQUENCE promotion_review_img_seq;

-- 리워드 리뷰 게시글 댓글 table
DROP TABLE promotion_review_comment;
CREATE TABLE promotion_review_comment (
   id NUMBER PRIMARY KEY,
   promotion_review_id NUMBER,
   user_id NUMBER,
   promotion_review_comment VARCHAR2(4000),
   private_comment varchar2(1),
   reg_date DATE
);
DROP SEQUENCE promotion_review_comment_seq;
CREATE SEQUENCE promotion_review_comment_seq;

-- 리워드 리뷰 좋아요
DROP TABLE promotion_review_like;
CREATE TABLE promotion_review_like (
   id NUMBER PRIMARY KEY,
   review_id NUMBER,
   user_id NUMBER,
   review_like_date DATE
);
DROP SEQUENCE promotion_review_like_seq;
CREATE SEQUENCE promotion_review_like_seq;


-- 리워드 리뷰 table
DROP TABLE promotion_review;
CREATE TABLE promotion_review (
   id NUMBER PRIMARY KEY,
   user_id NUMBER,
   rental_item_id NUMBER,
   promotion_review_title VARCHAR2(500),
   promotion_review_content VARCHAR2(4000),
   promotion_review_rating NUMBER,
   promotion_review_views NUMBER,
   reg_date DATE
);
DROP SEQUENCE promotion_review_seq;
CREATE SEQUENCE promotion_review_seq;

-- 리워드 리뷰 게시글 이미지 table
DROP TABLE promotion_review_img;
CREATE TABLE promotion_review_img (
   id NUMBER PRIMARY KEY,
   promotion_review_id NUMBER,
   rental_review_img VARCHAR2(4000)
);
DROP SEQUENCE promotion_review_img_seq;
CREATE SEQUENCE promotion_review_img_seq;

-- 리워드 리뷰 게시글 댓글 table
DROP TABLE promotion_review_comment;
CREATE TABLE promotion_review_comment (
   id NUMBER PRIMARY KEY,
   promotion_review_id NUMBER,
   user_id NUMBER,
   promotion_review_comment VARCHAR2(4000),
   private_comment varchar2(1),
   reg_date DATE
);
DROP SEQUENCE promotion_review_comment_seq;
CREATE SEQUENCE promotion_review_comment_seq;

-- 리워드 리뷰 좋아요
DROP TABLE promotion_review_like;
CREATE TABLE promotion_review_like (
   id NUMBER PRIMARY KEY,
   review_id NUMBER,
   user_id NUMBER,
   review_like_date DATE
);
DROP SEQUENCE promotion_review_like_seq;
CREATE SEQUENCE promotion_review_like_seq;


--커뮤니티 
--해주세요 테이블(게시물)
drop table help_table;
CREATE TABLE help_table (
   id   number   primary key,
   user_id number,
   title   varchar2(2000),
   content   varchar2(4000),   
   views number   NOT NULL,
   points number   NOT NULL,
   status   varchar2(50),   
   location  varchar2(100),
   reg_date date   
);

--해주세요 시퀀스
drop sequence help_table_seq;
create sequence help_table_seq;

--해주세요 게시물 댓글 테이블 
drop table help_comment_table;
CREATE TABLE help_comment_table(
    id   number   primary key,
    user_id number,
    help_id number,
    content varchar2(4000),
    status varchar2(50),
    reg_date date
);

--해주세요 게시물 댓글 시퀀스
drop sequence help_comment_table_seq;
create sequence help_comment_table_seq;

--해주세요 게시물 이미지 테이블
drop table help_img_table;
create table help_img_table(
    id   number   primary key,
    help_id number,
    help_img_link varchar2(4000),
    help_original_filename varchar2(4000)
    );
 --해주세요 게시물 이미지 테이블 시퀀스   
drop sequence help_img_table_seq;
create sequence help_img_table_seq;

--해주세요 게시물 좋아요 테이블 
drop table help_like_table;
create table help_like_table(
    id   number   primary key,
    user_id number,
    help_id number,
    reg_date date
);

--해주세요 게시물 좋아요 테이블 시퀀스
drop sequence help_like_table_seq;
create sequence help_like_table_seq;

---------------------------------------------------
--궁금해요
drop table question_category_table;
create table question_category_table(
    id number primary key,
    category_name varchar2(20)
    );

drop sequence question_category_table_seq;
create sequence question_category_table_seq;


--궁금해요 게시물 
drop table question_table;
create table question_table (
    id number primary key, 
    user_id number,
    question_category_id number,
    title varchar2(2000),
    content varchar2(4000),
    views number,
    points number,
    status varchar2(50),
    reg_date date
    );
    
drop sequence question_table_seq;
create sequence question_table_seq;



--궁금해요 게시물 답변
drop table question_reply_table;
create table question_reply_table(
    id number primary key, 
    user_id number,
    question_id number,
    content varchar2(4000),
    status varchar2(1),
    reg_date date
);

drop sequence question_reply_table_seq;
create sequence question_reply_table_seq;

--궁금해요 게시물 이미지 
drop table question_img_table;
create table question_img_table(
    id number primary key,
    question_id number,
    question_img_link varchar2(4000),
    question_original_filename varchar2(4000)
);
--궁금해요 게시물 이미지 시퀀스
drop sequence question_img_table_seq;
create sequence question_img_table_seq;

--궁금해요 게시물 좋아요
drop table question_like_table;
create table question_like_table(
    id number primary key,
    user_id number,
    question_id number,
    reg_date date
);

drop sequence question_like_table_seq;
create sequence question_like_table_seq;

--궁금해요 채택
drop table question_reply_complete;
create table question_reply_complete(
    id number primary key,
    question_id number,
    reg_date date
);

drop sequence question_reply_complete_seq;
create sequence question_reply_complete_seq;



---------------------------------------------------

















