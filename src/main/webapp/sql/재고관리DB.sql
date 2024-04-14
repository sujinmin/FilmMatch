use moviedb;


-- 입고
-- create sequence seq_product_in_idx
create table inventory_in
(
   idx   int primary key auto_increment,-- 일련번호
   name  varchar(255),   				-- 상품명 
   cnt   int,			  				-- 입고수량	
   regdate date           				-- 입고일자
);

-- 출고
-- create sequence seq_product_out_idx

create table inventory_out
(
   idx   int primary key auto_increment,-- 일련번호
   name  varchar(255),   				-- 상품명 
   cnt   int,			  				-- 출고수량	
   regdate date           				-- 출고일자
);

-- 재고
-- create sequence seq_product_remain_idx

create table inventory_remain
(
   idx   int primary key auto_increment,-- 일련번호
   name  varchar(255),   				-- 상품명 
   cnt   int,			  				-- 재고수량	
   regdate date          				-- 재고일자
);

-- uniqe 제약 : 같은 상품이 있으면 안된다.
alter table inventory_remain
   add constraint unique_inventory_remain_name unique(name);
 commit;
   
   
-- 모든 데이터 삭제
   delete from inventory_in;
   delete from inventory_out;
   delete from inventory_remain;