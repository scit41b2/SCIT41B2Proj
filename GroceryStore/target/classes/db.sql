DROP TABLE pro_tb;
DROP TABLE acc_tb;
DROP TABLE bas_tb;

CREATE TABLE acc_tb
(
    acc_id varchar2(20) PRIMARY KEY
    , acc_pw varchar2(20) NOT NULL
    , acc_name varchar2(50) NOT NULL
    , acc_address varchar2(100) NOT NULL
);

CREATE TABLE pro_tb
(
    pro_id varchar2(20) PRIMARY KEY
    , pro_company varchar2(50) NOT NULL
    , pro_name varchar2(50) NOT NULL
    , pro_note varchar2(500)
    , pro_stock number DEFAULT 0
    , pro_price number NOT NULL
    , pro_saleprice number DEFAULT 0
);

CREATE TABLE bas_tb
(
    acc_id varchar2(20) REFERENCES acc_tb(acc_id)
    , pro_id varchar2(20) REFERENCES pro_tb(pro_id)
    , bas_num number DEFAULT 0
);

INSERT INTO pro_tb
VALUES
(
    'fish_001'
    , '은하수산'
    , '간편손질 국산 꽃게'
    , '(냉동), 500g, 1개'
    , 100
    , 16800
    , 12600
);

INSERT INTO pro_tb
VALUES
(
    'fish_002'
    , '단디프레시'
    , '서해안 갯벌 동죽조개'
    , '직접 손으로 채취, 800g, 1봉'
    , 100
    , 7980
    , 0
);

INSERT INTO pro_tb
VALUES
(
    'fish_003'
    , '이동삼'
    , '안동 간고등어 순살'
    , '(냉동), 100g, 8팩'
    , 100
    , 16500
    , 16000
);

INSERT INTO pro_tb
VALUES
(
    'fish_004'
    , '곰곰'
    , '반건조 오징어'
    , '390g(3미), 1개'
    , 100
    , 19590
    , 19130
);

INSERT INTO pro_tb
VALUES
(
    'fish_005'
    , '엠케이씨푸드'
    , '프라이드 흰다리 새우살'
    , '(냉동), 900g (62~80마리),1개'
    , 100
    , 21010
    , 18900
);

INSERT INTO pro_tb
VALUES
(
    'fish_006'
    , '곰곰'
    , '논우렁살'
    , '(냉장), 300g, 1팩'
    , 100
    , 6900
    , 0
);

INSERT INTO pro_tb
VALUES
(
    'fish_007'
    , '다복수산'
    , 'CAS로 급냉한 자숙 꼬마전복살'
    , '40~50마리, (냉동), 300g, 1개'
    , 100
    , 32000
    , 23100
);

INSERT INTO pro_tb
VALUES
(
    'fish_008'
    , '곰곰'
    , '냉동 흰다리 새우살'
    , '300g, 1개'
    , 0
    , 8590
    , 8320
);

INSERT INTO pro_tb
VALUES
(
    'fish_009'
    , '단디프레시'
    , '국산 데친 문어'
    , '(냉장), 400g, 1팩'
    , 1
    , 17800
    , 16580
);