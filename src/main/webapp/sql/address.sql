
use moviedb;

-- Address
CREATE TABLE address (
    addr_idx INT NOT NULL AUTO_INCREMENT,
    mem_idx int NOT NULL,
    zipcode INT NOT NULL,
    addr_street VARCHAR(255) NOT NULL,
    addr_detail VARCHAR(255) NULL,
    PRIMARY KEY (addr_idx)
);

-- 주소 테이블에 mem_idx 열에 대한 외래 키 추가
ALTER TABLE address
ADD CONSTRAINT FK_member_TO_address
FOREIGN KEY (mem_idx)
REFERENCES member(mem_idx);


