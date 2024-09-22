use ooredoo;
create table employee (
 emp_id int primary key,
 first_name varchar(40),
 last_name varchar(40),
 birth_date date,
 sex varchar(1),
 salary int,
 super_id int,
 branch_id int
);
alter table employee
add foreign key (branch_id) references branch(branch_id) on delete set null,
add foreign key (super_id) references employee(emp_id) on delete cascade;

create table branch
(
    branch_id   int primary key,
    branch_name    varchar(40),
    mgr_id         int,
    mgr_start_date DATE,
    foreign key (mgr_id) references employee (emp_id) on delete set null
);

create table client (
    client_id int primary key,
    client_name varchar(40),
    branch_id INT,
    foreign key (branch_id) references branch(branch_id) on delete set null
);
create table works_with(
  emp_id int,
  client_id int,
  total_sales int,
 primary key (emp_id,client_id),
 foreign key (emp_id) references employee(emp_id) on delete cascade,
 foreign key (client_id) references client(client_id) on delete cascade
);
CREATE TABLE branch_supplier (
                                 branch_id INT,
                                 supplier_name VARCHAR(40),
                                 supply_type VARCHAR(40),
                                 PRIMARY KEY(branch_id, supplier_name),
                                 FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);
-- corporate
insert into employee values(100,"David","Wallace","1967-11-17","M",250000,null,null);
insert into branch values(1,"Corporate",100,"2006-02-09");
UPDATE employee
set branch_id =1
where emp_id =100;
replace into employee values(101,"jan","levenson","1961-05-11","F",110000,100,1);

-- scranton
insert into employee values(102,"micheal","scoot","1964-03-15","M",75000,100,2);
insert into branch value(2,"scranton",102,"1992-04-06");

update employee
set branch_id =2
where emp_id=102;

insert into employee values(103,"angela","martin","1971-06-25","F",63000,102,2);
insert into employee values(104,"kelly","kapoor","1980-02-05","F",55000,102,2);
insert into employee values(105,"stanley","hudson","1958-02-19","M",69000,102,2);

-- stamford
insert into employee values(106,"josh","porter","1969-09-05","M",78000,100,3);
insert into branch value(3,"stamford",106,"1998-02-13");

update employee
set branch_id =3
where emp_id=106;
insert into employee values(107,"andy","bernard","1973-07-22","M",65000,106,3);
insert into employee values(108,"jim","halpert","1978-10-01","M",71000,106,3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Labels', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);


