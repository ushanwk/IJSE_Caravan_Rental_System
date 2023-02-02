DROP DATABASE IF EXISTS caravan_rent;
CREATE DATABASE IF NOT EXISTS caravan_rent;
USE caravan_rent;

CREATE TABLE customer(
	cust_id VARCHAR(6) NOT NULL,
	name VARCHAR(30) NOT NULL,
	dob DATE,
	salary decimal(10,2) not null,
	address TEXT,
	city VARCHAR(20),
	province VARCHAR(20),
	postal_code VARCHAR(9),
	CONSTRAINT PRIMARY KEY (cust_id)
);

CREATE TABLE booking(
	booking_id VARCHAR(6) NOT NULL,
	date DATE NOT NULL,
	customer_id VARCHAR(6) NOT NULL,
	CONSTRAINT PRIMARY KEY (booking_id),
	CONSTRAINT FOREIGN KEY(customer_id) REFERENCES customer(cust_id)
	ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE vehicle(
	reg_id VARCHAR(6) NOT NULL,
	vehicle_type VARCHAR(20) NOT NULL,
	description TEXT NOT NULL,
	price_per_day DECIMAL(10,2) NOT NULL,
	price_per_excess_mileage DECIMAL(6,2) NOT NULL,
	vehicle_qty_on_hand INT(5) NOT NULL,
	CONSTRAINT PRIMARY KEY (reg_id)
);

CREATE TABLE booking_detail(
	booking_id VARCHAR(6) NOT NULL,
	reg_id VARCHAR(6) NOT NULL,
	vehicle_qty INT(11) NOT NULL,
	discount INT(2),
	CONSTRAINT FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FOREIGN KEY (reg_id) REFERENCES vehicle(reg_id)
	ON UPDATE CASCADE ON DELETE CASCADE
);



INSERT INTO customer VALUES('C001', 'Danapala', '1981-2-6', 40000, 'No. 20, Walana', 'Panadura', 'Western', 12500);
INSERT INTO customer VALUES('C002', 'Gunapala', '1982-8-12', 40000, 'No. 200, Thalpitiya', 'Wadduwa', 'Western', 12500);
INSERT INTO customer VALUES('C003', 'Amarapala', '1988-1-2', 34000, 'No. 100, Horawala', 'Matugama', 'Western', 13400);
INSERT INTO customer VALUES('C004', 'Somapala', '1952-1-2', 67000, 'No. 10, Ginigama', 'Galle', 'Southern', 12213);
INSERT INTO customer VALUES('C005', 'Jinapala', '1974-1-8', 32000, 'No. 34, Ginthota', 'Aluthgama', 'Southern', 24333);
INSERT INTO customer VALUES('C006', 'Gnanawathee', '1982-1-3', 78000, 'No. 230, Galle Road', 'Panadura', 'Western', 12500);
INSERT INTO customer VALUES('C007', 'Amarawathee', '1984-5-7', 98000, 'No. 45, Galle Road', 'Ambalangoda', 'Southern', 43343);
INSERT INTO customer VALUES('C008', 'Leelawathee', '1950-4-8', 57000,'No. 12, Rathnapura Road', 'Madampe', 'Sabaragamuwa', 32312);
INSERT INTO customer VALUES('C009', 'Gunawathee', '1972-3-9', 76000, 'No. 122, Anuradhapura Road', 'Kurunegala','Wayamba', 23233);
INSERT INTO customer VALUES('C010', 'Dayapala', '1983-4-9', 40000, 'No. 234, Attidiya Road', 'Dehiwala','Western',23434);


INSERT INTO vehicle VALUES('P001', 'Car', 'Perodua Axia', 12000.00, 120.00, 5);
INSERT INTO vehicle VALUES('P002', 'Car', 'Perodua Bezza Prime Sedan (2017)', 13500.00, 135.00, 2);
INSERT INTO vehicle VALUES('P003', 'Car', 'Toyota Corolla Axio NKR 165', 15500.00, 155.00, 1);
INSERT INTO vehicle VALUES('P004', 'Luxury Car', 'BMW 320 - White', 30500.00, 300.00, 3);
INSERT INTO vehicle VALUES('P005', 'Luxury Car', 'Chrysler 300C - White (Rolls Royce Facelift)', 35000.00,350.00,2);
INSERT INTO vehicle VALUES('P006', 'Luxury Car', 'Mercedes Benz New C Class', 35000.00, 350.00, 3);
INSERT INTO vehicle VALUES('P007', 'Luxury Car', 'Jaguar XF 3.0 V6',35000.00, 350.00, 1);
INSERT INTO vehicle VALUES('P008', 'Luxury Car', 'Mercedes Benz S-Class AMG (Long Wheel Base', 55450.00, 550.00, 2);
INSERT INTO vehicle VALUES('P009', 'Standard Vans', 'Mitsubishi L300 6-9 Seater - Dual A/C - Basic Model', 14500.00, 145.00, 2);
INSERT INTO vehicle VALUES('P010', 'Luxury Vans', 'Toyota Regius 9 Seater - Dual A/c', 16500.00, 165.00, 1);
INSERT INTO vehicle VALUES('P011', 'Luxury Vans', 'Toyota Hiace Commuter 09 Seater - Line A/c', 17500.00, 175.00, 1);
INSERT INTO vehicle VALUES('P012', 'Luxury Vans', 'Toyota Grand Cabin 13 Seater - Line A/c', 18,500.00, 185.00, 3);
INSERT INTO vehicle VALUES('P013', 'Luxury Buses', 'Toyota Coaster 29 Seater Luxury (22 +7 Reclining) 2017', 22500.00, 225.00, 4);
INSERT INTO vehicle VALUES('P014', 'Luxury Buses', 'Toyota Coaster 29 Seater (22 +7 Reclining)', 19500.00,195.00, 1);
INSERT INTO vehicle VALUES('P015', 'SUV & 4WD', 'Daihatsu Terios 4WD', 23500.00, 235.00, 1);



INSERT INTO booking VALUES('D001', '2008-2-5', 'C001');
INSERT INTO booking VALUES('D002', '2008-2-15', 'C001');
INSERT INTO booking VALUES('D003', '2008-4-10', 'C001');
INSERT INTO booking VALUES('D004', '2008-2-6', 'C002');
INSERT INTO booking VALUES('D005', '2008-2-16', 'C002');
INSERT INTO booking VALUES('D006', '2008-2-20', 'C002');
INSERT INTO booking VALUES('D007', '2008-2-16', 'C003');
INSERT INTO booking VALUES('D008', '2008-3-26', 'C003');
INSERT INTO booking VALUES('D009', '2008-6-11', 'C003');
INSERT INTO booking VALUES('D010', '2008-9-11', 'C004');
INSERT INTO booking VALUES('D011', '2008-11-11', 'C005');
INSERT INTO booking VALUES('D012', '2008-12-14', 'C005');
INSERT INTO booking VALUES('D013', '2008-12-28', 'C005');
INSERT INTO booking VALUES('D014', '2008-11-29', 'C005');
INSERT INTO booking VALUES('D015', '2008-11-30', 'C005');
INSERT INTO booking VALUES('D016', '2008-3-23', 'C006');
INSERT INTO booking VALUES('D017', '2008-12-22', 'C006');
INSERT INTO booking VALUES('D018', '2008-12-29', 'C006');
INSERT INTO booking VALUES('D019', '2008-2-21', 'C007');
INSERT INTO booking VALUES('D020', '2008-5-12', 'C007');
INSERT INTO booking VALUES('D021', '2008-6-13', 'C008');
INSERT INTO booking VALUES('D022', '2008-7-13', 'C008');
INSERT INTO booking VALUES('D023', '2008-7-11', 'C009');
INSERT INTO booking VALUES('D024', '2008-8-12', 'C009');
INSERT INTO booking VALUES('D025', '2008-9-12', 'C010');


INSERT INTO booking_detail VALUES('D001',	'P001', 3, 0);
INSERT INTO booking_detail VALUES('D001',	'P002', 1, 0);
INSERT INTO booking_detail VALUES('D001',	'P003', 1, 0);
INSERT INTO booking_detail VALUES('D001',	'P006', 2, 0);
INSERT INTO booking_detail VALUES('D002',	'P002', 2, 0);
INSERT INTO booking_detail VALUES('D002',	'P003', 1, 0);
INSERT INTO booking_detail VALUES('D002',	'P008', 2, 0);
INSERT INTO booking_detail VALUES('D002',	'P010', 1, 0);
INSERT INTO booking_detail VALUES('D003',	'P001', 9, 0);
INSERT INTO booking_detail VALUES('D003',	'P004', 6, 0);
INSERT INTO booking_detail VALUES('D003',	'P002', 2, 0);
INSERT INTO booking_detail VALUES('D004',	'P002', 2, 0);
INSERT INTO booking_detail VALUES('D004',	'P005', 1, 0);
INSERT INTO booking_detail VALUES('D004',	'P008', 1, 0);
INSERT INTO booking_detail VALUES('D004',	'P013', 2, 0);
INSERT INTO booking_detail VALUES('D004',	'P015', 3, 0);
INSERT INTO booking_detail VALUES('D005',	'P004', 6, 0);
INSERT INTO booking_detail VALUES('D005',	'P002', 2, 0);
INSERT INTO booking_detail VALUES('D005',	'P005', 1, 0);
INSERT INTO booking_detail VALUES('D005',	'P008', 1, 0);
INSERT INTO booking_detail VALUES('D006',	'P003', 1, 0);
INSERT INTO booking_detail VALUES('D006',	'P006', 2, 0);
INSERT INTO booking_detail VALUES('D006',	'P002', 2, 0);
INSERT INTO booking_detail VALUES('D007',	'P003', 1, 0);
INSERT INTO booking_detail VALUES('D008',	'P013', 2, 0);
INSERT INTO booking_detail VALUES('D008',	'P015', 3, 0);
INSERT INTO booking_detail VALUES('D008',	'P004', 1, 0);
INSERT INTO booking_detail VALUES('D009',   'P002', 1, 0);
INSERT INTO booking_detail VALUES('D009',	'P005', 1, 0);
INSERT INTO booking_detail VALUES('D009',	'P008', 1, 0);
INSERT INTO booking_detail VALUES('D010',	'P001', 9, 0);
INSERT INTO booking_detail VALUES('D010',	'P004', 6, 0);
INSERT INTO booking_detail VALUES('D010',	'P002', 2, 0);
INSERT INTO booking_detail VALUES('D011',	'P013', 2, 0);
INSERT INTO booking_detail VALUES('D011',	'P015', 3, 0);
INSERT INTO booking_detail VALUES('D011',	'P004', 6, 0);
INSERT INTO booking_detail VALUES('D012',	'P013', 2, 0);
INSERT INTO booking_detail VALUES('D013',	'P015', 3, 0);
INSERT INTO booking_detail VALUES('D013',	'P004', 1, 0);
INSERT INTO booking_detail VALUES('D014',   'P002', 1, 0);
INSERT INTO booking_detail VALUES('D015',	'P005', 1, 0);
INSERT INTO booking_detail VALUES('D015',	'P001', 9, 0);
INSERT INTO booking_detail VALUES('D016',	'P006', 2, 0);
INSERT INTO booking_detail VALUES('D016',	'P002', 2, 0);
INSERT INTO booking_detail VALUES('D016',	'P003', 1, 0);
INSERT INTO booking_detail VALUES('D017',	'P008', 2, 0);
INSERT INTO booking_detail VALUES('D017',	'P010', 1, 0);
INSERT INTO booking_detail VALUES('D018',	'P001', 9, 0);
INSERT INTO booking_detail VALUES('D019',	'P004', 6, 0);
INSERT INTO booking_detail VALUES('D019',	'P002', 2, 0);
INSERT INTO booking_detail VALUES('D020',	'P005', 1, 0);
INSERT INTO booking_detail VALUES('D020',	'P008', 1, 0);
INSERT INTO booking_detail VALUES('D021',	'P013', 2, 0);
INSERT INTO booking_detail VALUES('D022',	'P015', 3, 0);
INSERT INTO booking_detail VALUES('D022',	'P004', 6, 0);
INSERT INTO booking_detail VALUES('D023',	'P002', 2, 0);
INSERT INTO booking_detail VALUES('D023',	'P005', 1, 0);
INSERT INTO booking_detail VALUES('D024',	'P008', 1, 0);
INSERT INTO booking_detail VALUES('D024',	'P003', 1, 0);
INSERT INTO booking_detail VALUES('D024',	'P006', 2, 0);
INSERT INTO booking_detail VALUES('D025',	'P002', 2, 0);
INSERT INTO booking_detail VALUES('D025',	'P003', 1, 0);
INSERT INTO booking_detail VALUES('D025',	'P013', 2, 0);
INSERT INTO booking_detail VALUES('D025',	'P015', 3, 0);
