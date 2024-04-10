

use.moviedb;
CREATE TABLE `moviedb`.`member` (
  `mem_idx` INT NOT NULL AUTO_INCREMENT,
  `mem_name` VARCHAR(100) NOT NULL,
  `mem_id` VARCHAR(100) NOT NULL,
  `mem_pwd` VARCHAR(100) NOT NULL,
  `mem_birth` VARCHAR(100) NOT NULL,
  `mem_gender` VARCHAR(100) NOT NULL,
  `mem_email` VARCHAR(100) NOT NULL,
  `mem_phone;` VARCHAR(100) NOT NULL,
  `mem_addr` VARCHAR(100) NOT NULL,
  `mem_ip` VARCHAR(100) NOT NULL,
  `mem_regdate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `mem_modifydate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `mem_grade` VARCHAR(100) NULL DEFAULT '일반',
  `mem_zipcode` VARCHAR(100) NOT NULL,
  `policy_a` VARCHAR(100) NOT NULL,
  `policy_b` VARCHAR(100) NOT NULL
  PRIMARY KEY (`mem_idx`),
  UNIQUE INDEX `mem_id_UNIQUE` (`mem_id` ASC) VISIBLE);

-- sample db 관리자=1, 일반=2, 판매자 =3 , 평론가=4
INSERT INTO `moviedb`.`member` (`mem_idx`, `mem_name`, `mem_id`, `mem_pwd`, 'mem_birth' , 'mem_gender' ,  `mem_email`, `mem_phone`, `mem_addr`, `mem_ip`, `mem_regdate`, `mem_modifydate`, `mem_grade`, `mem_zipcode`,`policy_a`,`policy_b`) VALUES ('1', '홍길동', 'one', '1234', '2024-04-08' , '관리자' , 'hong@ictedu.com', '010-0000-0000' '서울시 강남구', '000.000.00.0', '2024-03-19 19:13:40', '2024-03-19 19:13:40', '1', '1111','policy_a_agree','policy_b_agree');

