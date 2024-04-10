
CREATE TABLE member_address (
    addr_id INT AUTO_INCREMENT PRIMARY KEY,
    mem_idx INT ,
    zipcode VARCHAR(20),
    addr_street VARCHAR(255), 
    addr_detail VARCHAR(255),
    country VARCHAR(100),
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx)
);




use moviedb;

-- 자식 테이블 Address
CREATE TABLE address (
    addr_idx INT NOT NULL AUTO_INCREMENT,
    zipcode INT NOT NULL,
    addr_street VARCHAR(255) NOT NULL,
    addr_detail VARCHAR(255) NULL,
    PRIMARY KEY (addr_idx)
);



-- 부모테이블 member_address 테이블 생성
CREATE TABLE member_address (
    mem_idx INT AUTO_INCREMENT NOT NULL,
    addr_idx INT NOT NULL,
    PRIMARY KEY (mem_idx, addr_idx)
);

-- mem_idx 열에 대한 외래 키 추가
ALTER TABLE member_address
ADD CONSTRAINT FK_member_TO_member_address_1
FOREIGN KEY (mem_idx)
REFERENCES member(mem_idx);

-- addr_idx 열에 대한 외래 키 추가
ALTER TABLE member_address
ADD CONSTRAINT FK_Address_TO_member_address_1
FOREIGN KEY (addr_idx)
REFERENCES address(addr_idx);
