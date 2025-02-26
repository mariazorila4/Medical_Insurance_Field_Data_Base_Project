--drop tables if they exist
DROP TABLE rel_supplier_service CASCADE CONSTRAINTS;
DROP TABLE medical_specialization CASCADE CONSTRAINTS;
DROP TABLE medical_services CASCADE CONSTRAINTS;
DROP TABLE rel_payment_petition CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE petition_for_compensation CASCADE CONSTRAINTS;
DROP TABLE suppliers CASCADE CONSTRAINTS;
DROP TABLE policy CASCADE CONSTRAINTS;
DROP TABLE clients CASCADE CONSTRAINTS;

--create table clients
CREATE TABLE clients (
  id_client INTEGER PRIMARY KEY,
  cnp CHAR(13) UNIQUE,
  first_name CHAR(20),
  last_name CHAR(50),
  birth_date DATE,
  contact CHAR(100)
);

--create table policy
CREATE TABLE policy (
  id_policy INTEGER PRIMARY KEY,
  policy_number CHAR(20) UNIQUE,
  type CHAR(50),
  coverage_value DECIMAL(10, 2),
  start_date DATE,
  expiration_date DATE,
  id_client INTEGER,
  FOREIGN KEY (id_client) REFERENCES clients(id_client)
);

--create table suppliers
CREATE TABLE suppliers (
  supplier_id INTEGER PRIMARY KEY,
  supplier_type CHAR(50),
  supplier_name CHAR(100),
  contact CHAR(100)
);

--create table petition_for_compensation
CREATE TABLE petition_for_compensation (
  petition_id INTEGER PRIMARY KEY,
  id_policy INTEGER,
  requested_amount DECIMAL(10, 2),
  status CHAR(15),
  id_client INTEGER,
  supplier_id INTEGER,
  FOREIGN KEY (id_policy) REFERENCES policy(id_policy),
  FOREIGN KEY (id_client) REFERENCES clients(id_client),
  FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

--create table payment
CREATE TABLE payment (
  id_payment INTEGER PRIMARY KEY,
  id_client INTEGER,
  supplier_id INTEGER,
  payed_amount DECIMAL(10, 2),
  petition_id INTEGER,
  FOREIGN KEY (petition_id) REFERENCES petition_for_compensation(petition_id),
  FOREIGN KEY (id_client) REFERENCES clients(id_client),
  FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

--create table rel_payment_petition
CREATE TABLE rel_payment_petition (
  id_payment INTEGER,
  petition_id INTEGER,
  assigned_amount DECIMAL(10, 2),
  PRIMARY KEY (id_payment, petition_id),
  FOREIGN KEY (id_payment) REFERENCES payment(id_payment),
  FOREIGN KEY (petition_id) REFERENCES petition_for_compensation(petition_id)
);

--create table medical_services
CREATE TABLE medical_services (
  service_id INTEGER PRIMARY KEY,
  service_name CHAR(50),
  service_description CHAR(200)
);

--create table medical_specialization
CREATE TABLE medical_specialization (
  specialization_id INTEGER PRIMARY KEY,
  specialization_name CHAR(50),
  service_id INTEGER,
  FOREIGN KEY (service_id) REFERENCES medical_services(service_id)
);

--create table rel_supplier_service
CREATE TABLE rel_supplier_service (
  supplier_id INTEGER,
  service_id INTEGER,
  PRIMARY KEY (supplier_id, service_id),
  FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
  FOREIGN KEY (service_id) REFERENCES medical_services(service_id)
);

prompt clients_inserts

INSERT INTO clients VALUES (100,'6040504581798', 'Maria Cristina', 'Zorila', TO_DATE('04-05-2004', 'DD-MM-YYYY'), '0738632613');
INSERT INTO clients VALUES (101, '5040122123456', 'Bogdan', 'Zainea', TO_DATE('22-01-2004', 'DD-MM-YYYY'), '0721123456');
INSERT INTO clients VALUES (102, '6020512123457', 'Maria', 'Popescu', TO_DATE('12-05-2002', 'DD-MM-YYYY'), '0745987123');
INSERT INTO clients VALUES (103, '5031104123458', 'Radu', 'Georgescu', TO_DATE('04-11-2003', 'DD-MM-YYYY'), '0765874123');
INSERT INTO clients VALUES (104, '6040321123459', 'Oana', 'Marinescu', TO_DATE('21-03-2004', 'DD-MM-YYYY'), '0789456231');
INSERT INTO clients VALUES (105, '5050723123460', 'Victor', 'Dumitrescu', TO_DATE('23-07-2005', 'DD-MM-YYYY'), '0736123456');
INSERT INTO clients VALUES (106, '6060912123461', 'Andreea', 'Voicu', TO_DATE('12-09-2006', 'DD-MM-YYYY'), '0798234567');
INSERT INTO clients VALUES (107, '5021223123462', 'Stefan', 'Matei', TO_DATE('23-12-2002', 'DD-MM-YYYY'), '0723987456');
INSERT INTO clients VALUES (108, '6010812123463', 'Daria', 'Lupu', TO_DATE('12-08-2001', 'DD-MM-YYYY'), '0756123987');
INSERT INTO clients VALUES (109, '5030419123464', 'Marius', 'Serban', TO_DATE('19-04-2003', 'DD-MM-YYYY'), '0765347892');
INSERT INTO clients VALUES (110, '6040912123465', 'Teodora', 'Filip', TO_DATE('12-09-2004', 'DD-MM-YYYY'), '0789345278');
INSERT INTO clients VALUES (111, '5050312123466', 'Bogdan', 'Gavril', TO_DATE('12-03-2005', 'DD-MM-YYYY'), '0738456123');
INSERT INTO clients VALUES (112, '6060512123467', 'Larisa', 'Anghel', TO_DATE('12-05-2006', 'DD-MM-YYYY'), '0723984567');
INSERT INTO clients VALUES (113, '5031012123468', 'Robert', 'Constantin', TO_DATE('12-10-2003', 'DD-MM-YYYY'), '0745896123');
INSERT INTO clients VALUES (114, '6040612123469', 'Alina', 'Tanase', TO_DATE('12-06-2004', 'DD-MM-YYYY'), '0789234561');
INSERT INTO clients VALUES (115, '5050312123470', 'Sorin', 'Badea', TO_DATE('12-03-2005', 'DD-MM-YYYY'), '0765123984');
INSERT INTO clients VALUES (116, '6010712123471', 'Elisabeta', 'Raducanu', TO_DATE('12-07-2001', 'DD-MM-YYYY'), '0798456123');
INSERT INTO clients VALUES (117, '5031212123472', 'Vlad', 'Pavel', TO_DATE('12-12-2003', 'DD-MM-YYYY'), '0723987124');
INSERT INTO clients VALUES (118, '6060912123473', 'Corina', 'Gheorghiu', TO_DATE('12-09-2006', 'DD-MM-YYYY'), '0745612987');
INSERT INTO clients VALUES (119, '5040812123474', 'Sebastian', 'Trandafir', TO_DATE('12-08-2004', 'DD-MM-YYYY'), '0765347812');
INSERT INTO clients VALUES (120, '6020312123475', 'Natalia', 'Dinu', TO_DATE('12-03-2002', 'DD-MM-YYYY'), '0789456127');
INSERT INTO clients VALUES (121, '5010512123476', 'Cosmin', 'Radu', TO_DATE('12-05-2001', 'DD-MM-YYYY'), '0738456912');
INSERT INTO clients VALUES (122, '6030912123477', 'Monica', 'Cojocaru', TO_DATE('12-09-2003', 'DD-MM-YYYY'), '0723947856');
INSERT INTO clients VALUES (123, '6051212123478', 'Emil', 'Nastase', TO_DATE('12-12-2005', 'DD-MM-YYYY'), '0745897231');
INSERT INTO clients VALUES (124, '6040412123479', 'Silvia', 'Oprea', TO_DATE('12-04-2004', 'DD-MM-YYYY'), '0789235678');
INSERT INTO clients VALUES (125, '6020812123480', 'Cristina', 'Sandu', TO_DATE('12-08-2002', 'DD-MM-YYYY'), '0765123498');
INSERT INTO clients VALUES (126, '5051012123481', 'Razvan', 'Florea', TO_DATE('12-10-2005', 'DD-MM-YYYY'), '0798345612');
INSERT INTO clients VALUES (127, '6010312123482', 'Roxana', 'Neagu', TO_DATE('12-03-2001', 'DD-MM-YYYY'), '0723489651');
INSERT INTO clients VALUES (128, '5030712123483', 'Tudor', 'Voinea', TO_DATE('12-07-2003', 'DD-MM-YYYY'), '0745896127');
INSERT INTO clients VALUES (129, '6040512123484', 'Ana-Maria', 'Zamfir', TO_DATE('12-05-2004', 'DD-MM-YYYY'), '0765123497');
INSERT INTO clients VALUES (130, '6050812123485', 'Daniela', 'Preda', TO_DATE('12-08-2005', 'DD-MM-YYYY'), '0789345619');
INSERT INTO clients VALUES (131, '5020612123486', 'Eduard', 'Chirila', TO_DATE('12-06-2002', 'DD-MM-YYYY'), '0738456129');
INSERT INTO clients VALUES (132, '6011212123487', 'Carmen', 'Rusu', TO_DATE('12-12-2001', 'DD-MM-YYYY'), '0723987514');
INSERT INTO clients VALUES (133, '5030412123488', 'Gabriel', 'Moraru', TO_DATE('12-04-2003', 'DD-MM-YYYY'), '0745892367');
INSERT INTO clients VALUES (134, '6060912123489', 'Laura', 'Munteanu', TO_DATE('12-09-2006', 'DD-MM-YYYY'), '0765348791');
INSERT INTO clients VALUES (135, '6040712123490', 'Florentina', 'Ciobanu', TO_DATE('12-07-2004', 'DD-MM-YYYY'), '0789234569');
INSERT INTO clients VALUES (136, '5050212123491', 'Mihai', 'Grigorescu', TO_DATE('12-02-2005', 'DD-MM-YYYY'), '0723987452');
INSERT INTO clients VALUES (137, '6060812123492', 'Georgiana', 'Radulescu', TO_DATE('12-08-2006', 'DD-MM-YYYY'), '0745123987');
INSERT INTO clients VALUES (138, '5031112123493', 'Andrei', 'Toma', TO_DATE('12-11-2003', 'DD-MM-YYYY'), '0765987412');
INSERT INTO clients VALUES (139, '6040512123494', 'Bianca', 'Mocanu', TO_DATE('12-05-2004', 'DD-MM-YYYY'), '0789345678');
INSERT INTO clients VALUES (140, '5050612123495', 'Florin', 'Petrescu', TO_DATE('12-06-2005', 'DD-MM-YYYY'), '0736123459');
INSERT INTO clients VALUES (141, '6060712123496', 'Iulia', 'Barbu', TO_DATE('12-07-2006', 'DD-MM-YYYY'), '0798234561');
INSERT INTO clients VALUES (142, '5020412123497', 'Cristian', 'Voinea', TO_DATE('12-04-2002', 'DD-MM-YYYY'), '0723987458');
INSERT INTO clients VALUES (143, '6011212123498', 'Alexandra', 'Dobre', TO_DATE('12-12-2001', 'DD-MM-YYYY'), '0756123984');
INSERT INTO clients VALUES (144, '5030912123499', 'Ionut', 'Gheorghe', TO_DATE('12-09-2003', 'DD-MM-YYYY'), '0765347895');
INSERT INTO clients VALUES (145, '6040312123500', 'Denisa', 'Stan', TO_DATE('12-03-2004', 'DD-MM-YYYY'), '0789345279');
INSERT INTO clients VALUES (146, '5050812123501', 'Octavian', 'Iliescu', TO_DATE('12-08-2005', 'DD-MM-YYYY'), '0738456128');
INSERT INTO clients VALUES (147, '6061012123502', 'Raluca', 'Stefan', TO_DATE('12-10-2006', 'DD-MM-YYYY'), '0723984568');
INSERT INTO clients VALUES (148, '5030512123503', 'Lucian', 'Enache', TO_DATE('12-05-2003', 'DD-MM-YYYY'), '0745896128');
INSERT INTO clients VALUES (149, '6040912123504', 'Simona', 'Badea', TO_DATE('12-09-2004', 'DD-MM-YYYY'), '0789234562');
INSERT INTO clients VALUES (150, '5050412123505', 'Adrian', 'Marin', TO_DATE('12-04-2005', 'DD-MM-YYYY'), '0765123985');

SELECT * FROM clients;

DELETE FROM clients;

prompt policy_inserts

INSERT INTO policy VALUES (200, 'POL1000000001', 'Asigurare de sănătate', 10000.00, TO_DATE('01-01-2024', 'DD-MM-YYYY'), TO_DATE('01-01-2025', 'DD-MM-YYYY'), 100);
INSERT INTO policy VALUES (201, 'POL1000000002', 'Asigurare de accident', 20000.00, TO_DATE('05-02-2024', 'DD-MM-YYYY'), TO_DATE('05-02-2025', 'DD-MM-YYYY'), 100);
INSERT INTO policy VALUES (202, 'POL1000000003', 'Asigurare de viață', 15000.00, TO_DATE('10-03-2024', 'DD-MM-YYYY'), TO_DATE('10-03-2025', 'DD-MM-YYYY'), 102);
INSERT INTO policy VALUES (203, 'POL1000000004', 'Asigurare de spitalizare', 50000.00, TO_DATE('15-04-2024', 'DD-MM-YYYY'), TO_DATE('15-04-2025', 'DD-MM-YYYY'), 103);
INSERT INTO policy VALUES (204, 'POL1000000005', 'Asigurare de accident', 25000.00, TO_DATE('20-05-2024', 'DD-MM-YYYY'), TO_DATE('20-05-2025', 'DD-MM-YYYY'), 101);
INSERT INTO policy VALUES (205, 'POL1000000006', 'Asigurare de sănătate', 12000.00, TO_DATE('25-06-2024', 'DD-MM-YYYY'), TO_DATE('25-06-2025', 'DD-MM-YYYY'), 101);
INSERT INTO policy VALUES (206, 'POL1000000007', 'Asigurare de viață', 30000.00, TO_DATE('30-07-2024', 'DD-MM-YYYY'), TO_DATE('30-07-2025', 'DD-MM-YYYY'), 106);
INSERT INTO policy VALUES (207, 'POL1000000008', 'Asigurare de spitalizare', 45000.00, TO_DATE('05-08-2024', 'DD-MM-YYYY'), TO_DATE('05-08-2025', 'DD-MM-YYYY'), 107);
INSERT INTO policy VALUES (208, 'POL1000000009', 'Asigurare de accident', 18000.00, TO_DATE('10-09-2024', 'DD-MM-YYYY'), TO_DATE('10-09-2025', 'DD-MM-YYYY'), 104);
INSERT INTO policy VALUES (209, 'POL1000000010', 'Asigurare de sănătate', 22000.00, TO_DATE('15-10-2024', 'DD-MM-YYYY'), TO_DATE('15-10-2025', 'DD-MM-YYYY'), 109);
INSERT INTO policy VALUES (210, 'POL1000000011', 'Asigurare de viață', 27000.00, TO_DATE('20-11-2024', 'DD-MM-YYYY'), TO_DATE('20-11-2025', 'DD-MM-YYYY'), 110);
INSERT INTO policy VALUES (211, 'POL1000000012', 'Asigurare de spitalizare', 55000.00, TO_DATE('25-12-2024', 'DD-MM-YYYY'), TO_DATE('25-12-2025', 'DD-MM-YYYY'), 111);
INSERT INTO policy VALUES (212, 'POL1000000013', 'Asigurare de accident', 16000.00, TO_DATE('01-01-2025', 'DD-MM-YYYY'), TO_DATE('01-01-2026', 'DD-MM-YYYY'), 112);
INSERT INTO policy VALUES (213, 'POL1000000014', 'Asigurare de sănătate', 9000.00, TO_DATE('05-02-2025', 'DD-MM-YYYY'), TO_DATE('05-02-2026', 'DD-MM-YYYY'), 111);
INSERT INTO policy VALUES (214, 'POL1000000015', 'Asigurare de viață', 35000.00, TO_DATE('10-03-2025', 'DD-MM-YYYY'), TO_DATE('10-03-2026', 'DD-MM-YYYY'), 114);
INSERT INTO policy VALUES (215, 'POL1000000016', 'Asigurare de spitalizare', 60000.00, TO_DATE('15-04-2025', 'DD-MM-YYYY'), TO_DATE('15-04-2026', 'DD-MM-YYYY'), 115);
INSERT INTO policy VALUES (216, 'POL1000000017', 'Asigurare de accident', 24000.00, TO_DATE('20-05-2025', 'DD-MM-YYYY'), TO_DATE('20-05-2026', 'DD-MM-YYYY'), 116);
INSERT INTO policy VALUES (217, 'POL1000000018', 'Asigurare de sănătate', 13000.00, TO_DATE('25-06-2025', 'DD-MM-YYYY'), TO_DATE('25-06-2026', 'DD-MM-YYYY'), 117);
INSERT INTO policy VALUES (218, 'POL1000000019', 'Asigurare de viață', 28000.00, TO_DATE('30-07-2025', 'DD-MM-YYYY'), TO_DATE('30-07-2026', 'DD-MM-YYYY'), 118);
INSERT INTO policy VALUES (219, 'POL1000000020', 'Asigurare de spitalizare', 47000.00, TO_DATE('05-08-2025', 'DD-MM-YYYY'), TO_DATE('05-08-2026', 'DD-MM-YYYY'), 119);
INSERT INTO policy VALUES (220, 'POL1000000021', 'Asigurare de accident', 19000.00, TO_DATE('10-09-2025', 'DD-MM-YYYY'), TO_DATE('10-09-2026', 'DD-MM-YYYY'), 120);
INSERT INTO policy VALUES (221, 'POL1000000022', 'Asigurare de sănătate', 17000.00, TO_DATE('15-10-2025', 'DD-MM-YYYY'), TO_DATE('15-10-2026', 'DD-MM-YYYY'), 121);
INSERT INTO policy VALUES (222, 'POL1000000023', 'Asigurare de viață', 32000.00, TO_DATE('20-11-2025', 'DD-MM-YYYY'), TO_DATE('20-11-2026', 'DD-MM-YYYY'), 122);
INSERT INTO policy VALUES (223, 'POL1000000024', 'Asigurare de spitalizare', 58000.00, TO_DATE('25-12-2025', 'DD-MM-YYYY'), TO_DATE('25-12-2026', 'DD-MM-YYYY'), 121);
INSERT INTO policy VALUES (224, 'POL1000000025', 'Asigurare de accident', 26000.00, TO_DATE('01-01-2026', 'DD-MM-YYYY'), TO_DATE('01-01-2027', 'DD-MM-YYYY'), 124);
INSERT INTO policy VALUES (225, 'POL1000000026', 'Asigurare de sănătate', 11000.00, TO_DATE('05-02-2026', 'DD-MM-YYYY'), TO_DATE('05-02-2027', 'DD-MM-YYYY'), 125);
INSERT INTO policy VALUES (226, 'POL1000000027', 'Asigurare de viață', 34000.00, TO_DATE('10-03-2026', 'DD-MM-YYYY'), TO_DATE('10-03-2027', 'DD-MM-YYYY'), 126);
INSERT INTO policy VALUES (227, 'POL1000000028', 'Asigurare de spitalizare', 52000.00, TO_DATE('15-04-2026', 'DD-MM-YYYY'), TO_DATE('15-04-2027', 'DD-MM-YYYY'), 127);
INSERT INTO policy VALUES (228, 'POL1000000029', 'Asigurare de accident', 21000.00, TO_DATE('20-05-2026', 'DD-MM-YYYY'), TO_DATE('20-05-2027', 'DD-MM-YYYY'), 128);
INSERT INTO policy VALUES (229, 'POL1000000030', 'Asigurare de sănătate', 14000.00, TO_DATE('25-06-2026', 'DD-MM-YYYY'), TO_DATE('25-06-2027', 'DD-MM-YYYY'), 129);
INSERT INTO policy VALUES (230, 'POL1000000031', 'Asigurare de viață', 29000.00, TO_DATE('30-07-2026', 'DD-MM-YYYY'), TO_DATE('30-07-2027', 'DD-MM-YYYY'), 130);
INSERT INTO policy VALUES (231, 'POL1000000032', 'Asigurare de spitalizare', 49000.00, TO_DATE('05-08-2026', 'DD-MM-YYYY'), TO_DATE('05-08-2027', 'DD-MM-YYYY'), 129);
INSERT INTO policy VALUES (232, 'POL1000000033', 'Asigurare de accident', 23000.00, TO_DATE('10-09-2026', 'DD-MM-YYYY'), TO_DATE('10-09-2027', 'DD-MM-YYYY'), 132);
INSERT INTO policy VALUES (233, 'POL1000000034', 'Asigurare de sănătate', 16000.00, TO_DATE('15-10-2026', 'DD-MM-YYYY'), TO_DATE('15-10-2027', 'DD-MM-YYYY'), 133);
INSERT INTO policy VALUES (234, 'POL1000000035', 'Asigurare de viață', 31000.00, TO_DATE('20-11-2026', 'DD-MM-YYYY'), TO_DATE('20-11-2027', 'DD-MM-YYYY'), 134);
INSERT INTO policy VALUES (235, 'POL1000000036', 'Asigurare de spitalizare', 56000.00, TO_DATE('25-12-2026', 'DD-MM-YYYY'), TO_DATE('25-12-2027', 'DD-MM-YYYY'), 135);
INSERT INTO policy VALUES (236, 'POL1000000037', 'Asigurare de accident', 27000.00, TO_DATE('01-01-2027', 'DD-MM-YYYY'), TO_DATE('01-01-2028', 'DD-MM-YYYY'), 136);
INSERT INTO policy VALUES (237, 'POL1000000038', 'Asigurare de sănătate', 19000.00, TO_DATE('05-02-2027', 'DD-MM-YYYY'), TO_DATE('05-02-2028', 'DD-MM-YYYY'), 137);
INSERT INTO policy VALUES (238, 'POL1000000039', 'Asigurare de viață', 33000.00, TO_DATE('10-03-2027', 'DD-MM-YYYY'), TO_DATE('10-03-2028', 'DD-MM-YYYY'), 138);
INSERT INTO policy VALUES (239, 'POL1000000040', 'Asigurare de spitalizare', 60000.00, TO_DATE('15-04-2027', 'DD-MM-YYYY'), TO_DATE('15-04-2028', 'DD-MM-YYYY'), 138);
INSERT INTO policy VALUES (240, 'POL1000000041', 'Asigurare de accident', 28000.00, TO_DATE('20-05-2027', 'DD-MM-YYYY'), TO_DATE('20-05-2028', 'DD-MM-YYYY'), 140);
INSERT INTO policy VALUES (241, 'POL1000000042', 'Asigurare de sănătate', 20000.00, TO_DATE('25-06-2027', 'DD-MM-YYYY'), TO_DATE('25-06-2028', 'DD-MM-YYYY'), 141);
INSERT INTO policy VALUES (242, 'POL1000000043', 'Asigurare de viață', 37000.00, TO_DATE('30-07-2027', 'DD-MM-YYYY'), TO_DATE('30-07-2028', 'DD-MM-YYYY'), 142);
INSERT INTO policy VALUES (243, 'POL1000000044', 'Asigurare de spitalizare', 58000.00, TO_DATE('05-08-2027', 'DD-MM-YYYY'), TO_DATE('05-08-2028', 'DD-MM-YYYY'), 144);
INSERT INTO policy VALUES (244, 'POL1000000045', 'Asigurare de accident', 24000.00, TO_DATE('10-09-2027', 'DD-MM-YYYY'), TO_DATE('10-09-2028', 'DD-MM-YYYY'), 144);
INSERT INTO policy VALUES (245, 'POL1000000046', 'Asigurare de sănătate', 15000.00, TO_DATE('15-10-2027', 'DD-MM-YYYY'), TO_DATE('15-10-2028', 'DD-MM-YYYY'), 145);
INSERT INTO policy VALUES (246, 'POL1000000047', 'Asigurare de viață', 31000.00, TO_DATE('20-11-2027', 'DD-MM-YYYY'), TO_DATE('20-11-2028', 'DD-MM-YYYY'), 146);
INSERT INTO policy VALUES (247, 'POL1000000048', 'Asigurare de spitalizare', 54000.00, TO_DATE('25-12-2027', 'DD-MM-YYYY'), TO_DATE('25-12-2028', 'DD-MM-YYYY'), 147);
INSERT INTO policy VALUES (248, 'POL1000000049', 'Asigurare de accident', 29000.00, TO_DATE('01-01-2028', 'DD-MM-YYYY'), TO_DATE('01-01-2029', 'DD-MM-YYYY'), 148);
INSERT INTO policy VALUES (249, 'POL1000000050', 'Asigurare de sănătate', 21000.00, TO_DATE('05-02-2028', 'DD-MM-YYYY'), TO_DATE('05-02-2029', 'DD-MM-YYYY'), 149);
INSERT INTO policy VALUES (250, 'POL1000000051', 'Asigurare de viață', 36000.00, TO_DATE('10-03-2028', 'DD-MM-YYYY'), TO_DATE('10-03-2029', 'DD-MM-YYYY'), 150);

SELECT * FROM policy;

DELETE FROM policy;

prompt medical_services_inserts

INSERT INTO medical_services VALUES (400, 'Chirurgie', 'Servicii chirurgicale complete pentru diverse specializări');
INSERT INTO medical_services VALUES (401, 'Consultatii generale', 'Consultații de specialitate pentru diagnostic și tratament');
INSERT INTO medical_services VALUES (402, 'Medicamente', 'Furnizare de medicamente pentru diverse afecțiuni');
INSERT INTO medical_services VALUES (403, 'Analize medicale', 'Analize de laborator complete pentru diagnosticare');
INSERT INTO medical_services VALUES (404, 'Oncologie', 'Tratament și îngrijire pentru pacienții cu cancer');
INSERT INTO medical_services VALUES (405, 'Radiologie', 'Servicii de imagistică medicală avansată');
INSERT INTO medical_services VALUES (406, 'Medicamente', 'Furnizare de produse farmaceutice');
INSERT INTO medical_services VALUES (407, 'Teste genetice', 'Analize genetice pentru identificarea predispozițiilor');
INSERT INTO medical_services VALUES (408, 'Cardiologie', 'Diagnostic și tratament pentru afecțiuni cardiace');
INSERT INTO medical_services VALUES (409, 'Consultatii generale', 'Consultații generale și specializate');
INSERT INTO medical_services VALUES (410, 'Medicamente', 'Distribuție de medicamente pentru diverse afecțiuni');
INSERT INTO medical_services VALUES (411, 'Analize medicale', 'Investigații medicale de laborator');
INSERT INTO medical_services VALUES (412, 'Transplant', 'Servicii specializate în transplanturi de organe');
INSERT INTO medical_services VALUES (413, 'Ortopedie', 'Diagnostic și tratament pentru afecțiuni osoase');
INSERT INTO medical_services VALUES (414, 'Medicamente', 'Furnizare de produse farmaceutice');
INSERT INTO medical_services VALUES (415, 'Analize de sânge', 'Investigații hematologice detaliate');
INSERT INTO medical_services VALUES (416, 'Chirurgie plastică', 'Intervenții de chirurgie estetică și reconstructivă');
INSERT INTO medical_services VALUES (417, 'Consultatii ORL', 'Consultații pentru afecțiuni ale urechii, nasului și gâtului');
INSERT INTO medical_services VALUES (418, 'Medicamente', 'Furnizare de produse farmaceutice');
INSERT INTO medical_services VALUES (419, 'Biopsii', 'Prelevare și analiză de țesuturi pentru diagnostic');
INSERT INTO medical_services VALUES (420, 'Neurochirurgie', 'Intervenții chirurgicale pentru afecțiuni neurologice');
INSERT INTO medical_services VALUES (421, 'Psihiatrie', 'Tratament și îngrijire pentru afecțiuni mintale');
INSERT INTO medical_services VALUES (422, 'Medicamente', 'Distribuție de medicamente pentru diferite patologii');
INSERT INTO medical_services VALUES (423, 'Imunologie', 'Analize și diagnostic pentru afecțiuni autoimune');
INSERT INTO medical_services VALUES (424, 'Pneumologie', 'Diagnostic și tratament al bolilor respiratorii');
INSERT INTO medical_services VALUES (425, 'Kinetoterapie', 'Recuperare medicală prin terapie fizică');
INSERT INTO medical_services VALUES (426, 'Medicamente', 'Furnizare de medicamente esențiale');
INSERT INTO medical_services VALUES (427, 'Analize hematologice', 'Investigații specializate pe sânge');
INSERT INTO medical_services VALUES (428, 'Endocrinologie', 'Diagnostic și tratament pentru afecțiuni hormonale');
INSERT INTO medical_services VALUES (429, 'Consultatii generale', 'Consultații medicale de specialitate');
INSERT INTO medical_services VALUES (430, 'Produse naturiste', 'Furnizare de suplimente și produse naturale');
INSERT INTO medical_services VALUES (431, 'Teste de alergii', 'Investigații pentru diagnosticarea alergiilor');
INSERT INTO medical_services VALUES (432, 'Ginecologie', 'Consultații și tratamente pentru sănătatea femeii');
INSERT INTO medical_services VALUES (433, 'Obstetrică', 'Îngrijire și tratament în perioada sarcinii');
INSERT INTO medical_services VALUES (434, 'Medicamente', 'Furnizare de produse farmaceutice');
INSERT INTO medical_services VALUES (435, 'Microbiologie', 'Analize microbiologice pentru diagnostic');
INSERT INTO medical_services VALUES (436, 'Boli infecțioase', 'Diagnostic și tratament al infecțiilor severe');
INSERT INTO medical_services VALUES (437, 'Psihologie', 'Servicii de consiliere psihologică și terapie');
INSERT INTO medical_services VALUES (438, 'Medicamente', 'Distribuție de produse farmaceutice');
INSERT INTO medical_services VALUES (439, 'Radiologie', 'Imagistică medicală avansată');
INSERT INTO medical_services VALUES (440, 'Cardiologie', 'Investigații și tratamente pentru boli cardiace');
INSERT INTO medical_services VALUES (441, 'Dermatologie', 'Consultații și tratamente pentru afecțiuni ale pielii');
INSERT INTO medical_services VALUES (442, 'Medicamente', 'Furnizare de produse farmaceutice');
INSERT INTO medical_services VALUES (443, 'Biochimie', 'Analize de laborator pentru evaluarea sănătății');
INSERT INTO medical_services VALUES (444, 'Neurologie', 'Diagnostic și tratament al afecțiunilor neurologice');
INSERT INTO medical_services VALUES (445, 'Kinetoterapie', 'Programe de recuperare fizică');
INSERT INTO medical_services VALUES (446, 'Medicamente', 'Distribuție de produse farmaceutice');
INSERT INTO medical_services VALUES (447, 'Patologie', 'Analize histopatologice pentru diagnostic');
INSERT INTO medical_services VALUES (448, 'Chirurgie', 'Intervenții chirurgicale pentru diverse afecțiuni');
INSERT INTO medical_services VALUES (449, 'Consultatii generale', 'Consultații de specialitate');
INSERT INTO medical_services VALUES (450, 'Medicamente', 'Furnizare de produse farmaceutice');

SELECT * FROM medical_services;

DELETE FROM medical_services;

prompt suppliers_inserts

INSERT INTO suppliers VALUES (300, 'Spital', 'Spitalul Universitar București', 'contact[at]sub.ro');
INSERT INTO suppliers VALUES (301, 'Clinică privată', 'Regina Maria', 'contact[at]reginamaria.ro');
INSERT INTO suppliers VALUES (302, 'Farmacie', 'Catena', 'info[at]catena.ro');
INSERT INTO suppliers VALUES (303, 'Laborator', 'Synevo', 'analize[at]synevo.ro');
INSERT INTO suppliers VALUES (304, 'Spital', 'Spitalul Militar Central', 'oncologie[at]smc.ro');
INSERT INTO suppliers VALUES (305, 'Clinică privată', 'MedLife', 'contact[at]medlife.ro');
INSERT INTO suppliers VALUES (306, 'Farmacie', 'Sensiblu', 'info[at]sensiblu.ro');
INSERT INTO suppliers VALUES (307, 'Laborator', 'Bioclinica', 'info[at]bioclinica.ro');
INSERT INTO suppliers VALUES (308, 'Spital', 'Spitalul Elias', 'cardio[at]elias.ro');
INSERT INTO suppliers VALUES (309, 'Clinică privată', 'Sanador', 'programari[at]sanador.ro');
INSERT INTO suppliers VALUES (310, 'Farmacie', 'Help Net', 'suport[at]helpnet.ro');
INSERT INTO suppliers VALUES (311, 'Laborator', 'Medcenter', 'contact[at]medcenter.ro');
INSERT INTO suppliers VALUES (312, 'Spital', 'Institutul Clinic Fundeni', 'info[at]fundeni.ro');
INSERT INTO suppliers VALUES (313, 'Clinică privată', 'Provita', 'contact[at]provita.ro');
INSERT INTO suppliers VALUES (314, 'Farmacie', 'Dona', 'info[at]dona.ro');
INSERT INTO suppliers VALUES (315, 'Laborator', 'Regina Maria Lab', 'lab[at]reginamaria.ro');
INSERT INTO suppliers VALUES (316, 'Spital', 'Spitalul Colțea', 'chirurgie[at]coltea.ro');
INSERT INTO suppliers VALUES (317, 'Clinică privată', 'Clinica Sante', 'orlsante[at]clinicasante.ro');
INSERT INTO suppliers VALUES (318, 'Farmacie', 'Remedia', 'info[at]remedia.ro');
INSERT INTO suppliers VALUES (319, 'Laborator', 'MedLife Lab', 'lab[at]medlife.ro');
INSERT INTO suppliers VALUES (320, 'Spital', 'Spitalul Bagdasar-Arseni', 'neuro[at]bagdasar.ro');
INSERT INTO suppliers VALUES (321, 'Clinică privată', 'Euromedica', 'contact[at]euromedica.ro');
INSERT INTO suppliers VALUES (322, 'Farmacie', 'PharmaFarm', 'info[at]pharmafarm.ro');
INSERT INTO suppliers VALUES (323, 'Laborator', 'Clinilab', 'contact[at]clinilab.ro');
INSERT INTO suppliers VALUES (324, 'Spital', 'Spitalul Sf. Maria', 'info[at]sfmaria.ro');
INSERT INTO suppliers VALUES (325, 'Clinică privată', 'Centrokinetic', 'contact[at]centrokinetic.ro');
INSERT INTO suppliers VALUES (326, 'Farmacie', 'Minifarm', 'info[at]minifarm.ro');
INSERT INTO suppliers VALUES (327, 'Laborator', 'Analize Plus', 'info[at]analizeplus.ro');
INSERT INTO suppliers VALUES (328, 'Spital', 'Institutul Parhon', 'info[at]parhon.ro');
INSERT INTO suppliers VALUES (329, 'Clinică privată', 'Medicover', 'info[at]medicover.ro');
INSERT INTO suppliers VALUES (330, 'Farmacie', 'Plafar', 'info[at]plafar.ro');
INSERT INTO suppliers VALUES (331, 'Laborator', 'Synlab', 'info[at]synlab.ro');
INSERT INTO suppliers VALUES (332, 'Spital', 'Spitalul Filantropia', 'info[at]filantropia.ro');
INSERT INTO suppliers VALUES (333, 'Clinică privată', 'Nativia', 'contact[at]nativia.ro');
INSERT INTO suppliers VALUES (334, 'Farmacie', 'Belladonna', 'info[at]belladonna.ro');
INSERT INTO suppliers VALUES (335, 'Laborator', 'Biotest', 'info[at]biotest.ro');
INSERT INTO suppliers VALUES (336, 'Spital', 'Spitalul Victor Babeș', 'info[at]victorbabes.ro');
INSERT INTO suppliers VALUES (337, 'Clinică privată', 'Clinica Hope', 'contact[at]clinicahope.ro');
INSERT INTO suppliers VALUES (338, 'Farmacie', 'Farmacia Tei', 'info[at]farmaciatei.ro');
INSERT INTO suppliers VALUES (339, 'Laborator', 'Neomed', 'info[at]neomed.ro');
INSERT INTO suppliers VALUES (340, 'Spital', 'Spitalul Clinic Județean Cluj', 'info[at]scjcluj.ro');
INSERT INTO suppliers VALUES (341, 'Clinică privată', 'Bioderm', 'info[at]bioderm.ro');
INSERT INTO suppliers VALUES (342, 'Farmacie', 'Farmacia Punkt', 'info[at]punkt.ro');
INSERT INTO suppliers VALUES (343, 'Laborator', 'CityLab', 'info[at]citylab.ro');
INSERT INTO suppliers VALUES (344, 'Spital', 'Spitalul Municipal Timișoara', 'info[at]smtimisoara.ro');
INSERT INTO suppliers VALUES (345, 'Clinică privată', 'Kinetic Sport si Medicina', 'contact[at]ksm.ro');
INSERT INTO suppliers VALUES (346, 'Farmacie', 'Farmacia Sante', 'info[at]farmaciasante.ro');
INSERT INTO suppliers VALUES (347, 'Laborator', 'Patholab', 'info[at]patholab.ro');
INSERT INTO suppliers VALUES (348, 'Spital', 'Spitalul Județean Sibiu', 'info[at]sjsibiu.ro');
INSERT INTO suppliers VALUES (349, 'Clinică privată', 'Clinica Nova', 'info[at]clinicanova.ro');
INSERT INTO suppliers VALUES (350, 'Farmacie', 'Farmacia Dona Plus', 'info[at]donaplus.ro');

SELECT * FROM suppliers;

DELETE FROM suppliers;

prompt petition_for_compensation_inserts

INSERT INTO petition_for_compensation VALUES (500, 232, 37249.75, 'Aprobat', 105, 314);
INSERT INTO petition_for_compensation VALUES (501, 205, 17763.94, 'Respins', 148, 306);
INSERT INTO petition_for_compensation VALUES (502, 206, 41647.82, 'In Proces', 113, 302);
INSERT INTO petition_for_compensation VALUES (503, 238, 18933.76, 'In Proces', 117, 338);
INSERT INTO petition_for_compensation VALUES (504, 231, 23303.58, 'Respins', 106, 344);
INSERT INTO petition_for_compensation VALUES (505, 247, 24392.72, 'Aprobat', 141, 307);
INSERT INTO petition_for_compensation VALUES (506, 229, 44893.61, 'Respins', 134, 315);
INSERT INTO petition_for_compensation VALUES (507, 232, 48628.97, 'Aprobat', 126, 312);
INSERT INTO petition_for_compensation VALUES (508, 205, 17787.58, 'Respins', 102, 325);
INSERT INTO petition_for_compensation VALUES (509, 240, 31502.47, 'In Proces', 150, 301);
INSERT INTO petition_for_compensation VALUES (510, 222, 25222.75, 'Aprobat', 132, 328);
INSERT INTO petition_for_compensation VALUES (511, 206, 11889.33, 'Respins', 123, 332);
INSERT INTO petition_for_compensation VALUES (512, 204, 43163.14, 'In Proces', 118, 333);
INSERT INTO petition_for_compensation VALUES (513, 216, 19648.99, 'Respins', 127, 305);
INSERT INTO petition_for_compensation VALUES (514, 243, 21052.53, 'Aprobat', 147, 304);
INSERT INTO petition_for_compensation VALUES (515, 236, 19763.12, 'In Proces', 128, 311);
INSERT INTO petition_for_compensation VALUES (516, 215, 30829.48, 'Respins', 114, 348);
INSERT INTO petition_for_compensation VALUES (517, 246, 45371.85, 'In Proces', 129, 309);
INSERT INTO petition_for_compensation VALUES (518, 241, 49292.16, 'Respins', 133, 310);
INSERT INTO petition_for_compensation VALUES (519, 218, 24567.29, 'Aprobat', 125, 317);
INSERT INTO petition_for_compensation VALUES (520, 237, 13856.91, 'Respins', 135, 346);
INSERT INTO petition_for_compensation VALUES (521, 248, 22250.00, 'Aprobat', 136, 349);
INSERT INTO petition_for_compensation VALUES (522, 239, 15500.75, 'In Proces', 137, 330);
INSERT INTO petition_for_compensation VALUES (523, 221, 31000.35, 'Respins', 138, 347);
INSERT INTO petition_for_compensation VALUES (524, 234, 40512.80, 'Aprobat', 139, 303);
INSERT INTO petition_for_compensation VALUES (525, 230, 20045.12, 'In Proces', 140, 341);
INSERT INTO petition_for_compensation VALUES (526, 226, 16547.00, 'Respins', 142, 343);
INSERT INTO petition_for_compensation VALUES (527, 233, 38000.60, 'Aprobat', 144, 350);
INSERT INTO petition_for_compensation VALUES (528, 235, 29043.91, 'In Proces', 145, 302);
INSERT INTO petition_for_compensation VALUES (529, 249, 47300.20, 'Respins', 146, 306);
INSERT INTO petition_for_compensation VALUES (530, 227, 33400.00, 'Aprobat', 147, 328);
INSERT INTO petition_for_compensation VALUES (531, 219, 25140.75, 'Respins', 148, 333);
INSERT INTO petition_for_compensation VALUES (532, 250, 48990.50, 'In Proces', 149, 310);
INSERT INTO petition_for_compensation VALUES (533, 242, 17500.25, 'Aprobat', 150, 348);
INSERT INTO petition_for_compensation VALUES (534, 244, 26490.85, 'Respins', 100, 316);
INSERT INTO petition_for_compensation VALUES (535, 245, 29375.40, 'In Proces', 101, 315);
INSERT INTO petition_for_compensation VALUES (536, 217, 15800.60, 'Aprobat', 102, 329);
INSERT INTO petition_for_compensation VALUES (537, 228, 37900.75, 'Respins', 103, 337);
INSERT INTO petition_for_compensation VALUES (538, 213, 14500.80, 'In Proces', 104, 319);
INSERT INTO petition_for_compensation VALUES (539, 212, 13290.30, 'Respins', 105, 324);
INSERT INTO petition_for_compensation VALUES (540, 211, 19000.45, 'Aprobat', 106, 311);
INSERT INTO petition_for_compensation VALUES (541, 210, 22500.90, 'In Proces', 107, 301);
INSERT INTO petition_for_compensation VALUES (542, 214, 24050.60, 'Respins', 108, 303);
INSERT INTO petition_for_compensation VALUES (543, 209, 37000.25, 'Aprobat', 109, 350);
INSERT INTO petition_for_compensation VALUES (544, 208, 32000.15, 'In Proces', 110, 335);
INSERT INTO petition_for_compensation VALUES (545, 207, 41000.45, 'Respins', 111, 336);
INSERT INTO petition_for_compensation VALUES (546, 206, 30500.75, 'Aprobat', 112, 320);
INSERT INTO petition_for_compensation VALUES (547, 205, 28000.10, 'In Proces', 113, 321);
INSERT INTO petition_for_compensation VALUES (548, 204, 35000.00, 'Respins', 114, 327);
INSERT INTO petition_for_compensation VALUES (549, 203, 45000.00, 'Aprobat', 115, 331);
INSERT INTO petition_for_compensation VALUES (550, 202, 29500.30, 'In Proces', 116, 334);

SELECT * FROM petition_for_compensation;

DELETE FROM petition_for_compensation;

prompt payment_inserts

INSERT INTO payment VALUES (400, 100, 300, 10000.00, 500);
INSERT INTO payment VALUES (401, 101, 301, 20000.00, 501);
INSERT INTO payment VALUES (402, 102, 302, 15000.00, 502);
INSERT INTO payment VALUES (403, 103, 303, 50000.00, 503);
INSERT INTO payment VALUES (404, 104, 304, 25000.00, 504);
INSERT INTO payment VALUES (405, 105, 305, 12000.00, 505);
INSERT INTO payment VALUES (406, 106, 306, 30000.00, 506);
INSERT INTO payment VALUES (407, 107, 307, 45000.00, 507);
INSERT INTO payment VALUES (408, 108, 308, 18000.00, 508);
INSERT INTO payment VALUES (409, 109, 309, 22000.00, 509);
INSERT INTO payment VALUES (410, 110, 310, 27000.00, 510);
INSERT INTO payment VALUES (411, 111, 311, 55000.00, 511);
INSERT INTO payment VALUES (412, 112, 312, 16000.00, 512);
INSERT INTO payment VALUES (413, 113, 313, 9000.00, 513);
INSERT INTO payment VALUES (414, 114, 314, 35000.00, 514);
INSERT INTO payment VALUES (415, 115, 315, 60000.00, 515);
INSERT INTO payment VALUES (416, 116, 316, 24000.00, 516);
INSERT INTO payment VALUES (417, 117, 317, 13000.00, 517);
INSERT INTO payment VALUES (418, 118, 318, 28000.00, 518);
INSERT INTO payment VALUES (419, 119, 319, 47000.00, 519);
INSERT INTO payment VALUES (420, 120, 320, 19000.00, 520);
INSERT INTO payment VALUES (421, 121, 321, 17000.00, 521);
INSERT INTO payment VALUES (422, 122, 322, 32000.00, 522);
INSERT INTO payment VALUES (423, 123, 323, 58000.00, 523);
INSERT INTO payment VALUES (424, 124, 324, 26000.00, 524);
INSERT INTO payment VALUES (425, 125, 325, 11000.00, 525);
INSERT INTO payment VALUES (426, 126, 326, 34000.00, 526);
INSERT INTO payment VALUES (427, 127, 327, 52000.00, 527);
INSERT INTO payment VALUES (428, 128, 328, 21000.00, 528);
INSERT INTO payment VALUES (429, 129, 329, 14000.00, 529);
INSERT INTO payment VALUES (430, 130, 330, 29000.00, 530);
INSERT INTO payment VALUES (431, 131, 331, 49000.00, 531);
INSERT INTO payment VALUES (432, 132, 332, 23000.00, 532);
INSERT INTO payment VALUES (433, 133, 333, 16000.00, 533);
INSERT INTO payment VALUES (434, 134, 334, 31000.00, 534);
INSERT INTO payment VALUES (435, 135, 335, 56000.00, 535);
INSERT INTO payment VALUES (436, 136, 336, 27000.00, 536);
INSERT INTO payment VALUES (437, 137, 337, 19000.00, 537);
INSERT INTO payment VALUES (438, 138, 338, 33000.00, 538);
INSERT INTO payment VALUES (439, 139, 339, 60000.00, 539);
INSERT INTO payment VALUES (440, 140, 340, 28000.00, 540);
INSERT INTO payment VALUES (441, 141, 341, 20000.00, 541);
INSERT INTO payment VALUES (442, 142, 342, 37000.00, 542);
INSERT INTO payment VALUES (443, 143, 343, 58000.00, 543);
INSERT INTO payment VALUES (444, 144, 344, 24000.00, 544);
INSERT INTO payment VALUES (445, 145, 345, 15000.00, 545);
INSERT INTO payment VALUES (446, 146, 346, 31000.00, 546);
INSERT INTO payment VALUES (447, 147, 347, 54000.00, 547);
INSERT INTO payment VALUES (448, 148, 348, 29000.00, 548);
INSERT INTO payment VALUES (449, 149, 349, 21000.00, 549);
INSERT INTO payment VALUES (450, 150, 350, 36000.00, 550);

SELECT * FROM payment;

DELETE FROM payment;

prompt rel_payment_petition_inserts;

INSERT INTO rel_payment_petition VALUES (400, 500, 5000.00);
INSERT INTO rel_payment_petition VALUES (401, 501, 10000.00);
INSERT INTO rel_payment_petition VALUES (402, 502, 7500.00);
INSERT INTO rel_payment_petition VALUES (403, 503, 25000.00);
INSERT INTO rel_payment_petition VALUES (404, 504, 12500.00);
INSERT INTO rel_payment_petition VALUES (405, 505, 6000.00);
INSERT INTO rel_payment_petition VALUES (406, 506, 15000.00);
INSERT INTO rel_payment_petition VALUES (407, 507, 22500.00);
INSERT INTO rel_payment_petition VALUES (408, 508, 9000.00);
INSERT INTO rel_payment_petition VALUES (409, 509, 11000.00);
INSERT INTO rel_payment_petition VALUES (410, 510, 13500.00);
INSERT INTO rel_payment_petition VALUES (411, 511, 27500.00);
INSERT INTO rel_payment_petition VALUES (412, 512, 8000.00);
INSERT INTO rel_payment_petition VALUES (413, 513, 4500.00);
INSERT INTO rel_payment_petition VALUES (414, 514, 17500.00);
INSERT INTO rel_payment_petition VALUES (415, 515, 30000.00);
INSERT INTO rel_payment_petition VALUES (416, 516, 12000.00);
INSERT INTO rel_payment_petition VALUES (417, 517, 6500.00);
INSERT INTO rel_payment_petition VALUES (418, 518, 14000.00);
INSERT INTO rel_payment_petition VALUES (419, 519, 23500.00);
INSERT INTO rel_payment_petition VALUES (420, 520, 9500.00);
INSERT INTO rel_payment_petition VALUES (421, 521, 8500.00);
INSERT INTO rel_payment_petition VALUES (422, 522, 16000.00);
INSERT INTO rel_payment_petition VALUES (423, 523, 29000.00);
INSERT INTO rel_payment_petition VALUES (424, 524, 13000.00);
INSERT INTO rel_payment_petition VALUES (425, 525, 5500.00);
INSERT INTO rel_payment_petition VALUES (426, 526, 17000.00);
INSERT INTO rel_payment_petition VALUES (427, 527, 26000.00);
INSERT INTO rel_payment_petition VALUES (428, 528, 10500.00);
INSERT INTO rel_payment_petition VALUES (429, 529, 7000.00);
INSERT INTO rel_payment_petition VALUES (430, 530, 14500.00);
INSERT INTO rel_payment_petition VALUES (431, 531, 24500.00);
INSERT INTO rel_payment_petition VALUES (432, 532, 11500.00);
INSERT INTO rel_payment_petition VALUES (433, 533, 8000.00);
INSERT INTO rel_payment_petition VALUES (434, 534, 15500.00);
INSERT INTO rel_payment_petition VALUES (435, 535, 28000.00);
INSERT INTO rel_payment_petition VALUES (436, 536, 13500.00);
INSERT INTO rel_payment_petition VALUES (437, 537, 9500.00);
INSERT INTO rel_payment_petition VALUES (438, 538, 16500.00);
INSERT INTO rel_payment_petition VALUES (439, 539, 30000.00);
INSERT INTO rel_payment_petition VALUES (440, 540, 14000.00);
INSERT INTO rel_payment_petition VALUES (441, 541, 10000.00);
INSERT INTO rel_payment_petition VALUES (442, 542, 18500.00);
INSERT INTO rel_payment_petition VALUES (443, 543, 29000.00);
INSERT INTO rel_payment_petition VALUES (444, 544, 12000.00);
INSERT INTO rel_payment_petition VALUES (445, 545, 7500.00);
INSERT INTO rel_payment_petition VALUES (446, 546, 15500.00);
INSERT INTO rel_payment_petition VALUES (447, 547, 27000.00);
INSERT INTO rel_payment_petition VALUES (448, 548, 14500.00);
INSERT INTO rel_payment_petition VALUES (449, 549, 10500.00);
INSERT INTO rel_payment_petition VALUES (450, 550, 18000.00);

SELECT * FROM rel_payment_petition;

DELETE FROM rel_payment_petition;

prompt medical_specialization_inserts;

INSERT INTO medical_specialization VALUES (600, 'Chirurgie Generală', 400);
INSERT INTO medical_specialization VALUES (601, 'Cardiologie', 408);
INSERT INTO medical_specialization VALUES (602, 'Neurologie', 444);
INSERT INTO medical_specialization VALUES (603, 'Oncologie', 404);
INSERT INTO medical_specialization VALUES (604, 'Radiologie', 405);
INSERT INTO medical_specialization VALUES (605, 'Psihiatrie', 421);
INSERT INTO medical_specialization VALUES (606, 'Ortopedie', 413);
INSERT INTO medical_specialization VALUES (607, 'Dermatologie', 441);
INSERT INTO medical_specialization VALUES (608, 'Endocrinologie', 428);
INSERT INTO medical_specialization VALUES (609, 'Ginecologie', 432);
INSERT INTO medical_specialization VALUES (610, 'Obstetrică', 433);
INSERT INTO medical_specialization VALUES (611, 'Chirurgie Plastică', 416);
INSERT INTO medical_specialization VALUES (612, 'Neurochirurgie', 420);
INSERT INTO medical_specialization VALUES (613, 'Psihologie Clinică', 437);
INSERT INTO medical_specialization VALUES (614, 'Boli Infecțioase', 436);
INSERT INTO medical_specialization VALUES (615, 'Imunologie', 423);
INSERT INTO medical_specialization VALUES (616, 'Transplant', 412);
INSERT INTO medical_specialization VALUES (617, 'Biochimie', 443);
INSERT INTO medical_specialization VALUES (618, 'Analize Medicale', 403);
INSERT INTO medical_specialization VALUES (619, 'Kinetoterapie', 425);
INSERT INTO medical_specialization VALUES (620, 'Patologie', 447);
INSERT INTO medical_specialization VALUES (621, 'Microbiologie', 435);
INSERT INTO medical_specialization VALUES (622, 'Chirurgie Estetică', 416);
INSERT INTO medical_specialization VALUES (623, 'Produse Naturiste', 430);
INSERT INTO medical_specialization VALUES (624, 'Consultatii Generale', 401);
INSERT INTO medical_specialization VALUES (625, 'Consultatii ORL', 417);
INSERT INTO medical_specialization VALUES (626, 'Medicamente', 402);
INSERT INTO medical_specialization VALUES (627, 'Teste Genetice', 407);
INSERT INTO medical_specialization VALUES (628, 'Analize Hematologice', 427);
INSERT INTO medical_specialization VALUES (629, 'Teste de Alergii', 431);
INSERT INTO medical_specialization VALUES (630, 'Pneumologie', 424);
INSERT INTO medical_specialization VALUES (631, 'Biochimie Avansată', 443);
INSERT INTO medical_specialization VALUES (632, 'Radiologie Intervențională', 405);
INSERT INTO medical_specialization VALUES (633, 'Analize Sânge', 415);
INSERT INTO medical_specialization VALUES (634, 'Medicina Internă', 409);
INSERT INTO medical_specialization VALUES (635, 'Analize Histopatologice', 447);
INSERT INTO medical_specialization VALUES (636, 'Chirurgie Laparoscopică', 400);
INSERT INTO medical_specialization VALUES (637, 'Consultatii Psihologice', 437);
INSERT INTO medical_specialization VALUES (638, 'Analize Specializate', 411);
INSERT INTO medical_specialization VALUES (639, 'Consultatii Neurologice', 444);
INSERT INTO medical_specialization VALUES (640, 'Dermatologie Pediatrică', 441);
INSERT INTO medical_specialization VALUES (641, 'Endocrinologie Pediatrică', 428);
INSERT INTO medical_specialization VALUES (642, 'Psihiatrie Geriatrică', 421);
INSERT INTO medical_specialization VALUES (643, 'Chirurgie Pediatrică', 400);
INSERT INTO medical_specialization VALUES (644, 'Consultatii Geriatrice', 401);
INSERT INTO medical_specialization VALUES (645, 'Ortopedie Pediatrică', 413);
INSERT INTO medical_specialization VALUES (646, 'Chirurgie Endocrină', 428);
INSERT INTO medical_specialization VALUES (647, 'Consultatii Cardiologice', 408);
INSERT INTO medical_specialization VALUES (648, 'Neurologie Pediatrică', 444);
INSERT INTO medical_specialization VALUES (649, 'Chirurgie Urologică', 400);
INSERT INTO medical_specialization VALUES (650, 'Oncologie Pediatrică', 404);

SELECT * FROM medical_specialization;

DELETE FROM medical_specialization;

prompt rel_supplier_service_inserts;

INSERT INTO rel_supplier_service VALUES (300, 400);
INSERT INTO rel_supplier_service VALUES (301, 401);
INSERT INTO rel_supplier_service VALUES (302, 402);
INSERT INTO rel_supplier_service VALUES (303, 403);
INSERT INTO rel_supplier_service VALUES (304, 404);
INSERT INTO rel_supplier_service VALUES (305, 405);
INSERT INTO rel_supplier_service VALUES (306, 406);
INSERT INTO rel_supplier_service VALUES (307, 407);
INSERT INTO rel_supplier_service VALUES (308, 408);
INSERT INTO rel_supplier_service VALUES (309, 409);
INSERT INTO rel_supplier_service VALUES (310, 410);
INSERT INTO rel_supplier_service VALUES (311, 411);
INSERT INTO rel_supplier_service VALUES (312, 412);
INSERT INTO rel_supplier_service VALUES (313, 413);
INSERT INTO rel_supplier_service VALUES (314, 414);
INSERT INTO rel_supplier_service VALUES (315, 415);
INSERT INTO rel_supplier_service VALUES (316, 416);
INSERT INTO rel_supplier_service VALUES (317, 417);
INSERT INTO rel_supplier_service VALUES (318, 418);
INSERT INTO rel_supplier_service VALUES (319, 419);
INSERT INTO rel_supplier_service VALUES (320, 420);
INSERT INTO rel_supplier_service VALUES (321, 421);
INSERT INTO rel_supplier_service VALUES (322, 422);
INSERT INTO rel_supplier_service VALUES (323, 423);
INSERT INTO rel_supplier_service VALUES (324, 424);
INSERT INTO rel_supplier_service VALUES (325, 425);
INSERT INTO rel_supplier_service VALUES (326, 426);
INSERT INTO rel_supplier_service VALUES (327, 427);
INSERT INTO rel_supplier_service VALUES (328, 428);
INSERT INTO rel_supplier_service VALUES (329, 429);
INSERT INTO rel_supplier_service VALUES (330, 430);
INSERT INTO rel_supplier_service VALUES (331, 431);
INSERT INTO rel_supplier_service VALUES (332, 432);
INSERT INTO rel_supplier_service VALUES (333, 433);
INSERT INTO rel_supplier_service VALUES (334, 434);
INSERT INTO rel_supplier_service VALUES (335, 435);
INSERT INTO rel_supplier_service VALUES (336, 436);
INSERT INTO rel_supplier_service VALUES (337, 437);
INSERT INTO rel_supplier_service VALUES (338, 438);
INSERT INTO rel_supplier_service VALUES (339, 439);
INSERT INTO rel_supplier_service VALUES (340, 440);
INSERT INTO rel_supplier_service VALUES (341, 441);
INSERT INTO rel_supplier_service VALUES (342, 442);
INSERT INTO rel_supplier_service VALUES (343, 443);
INSERT INTO rel_supplier_service VALUES (344, 444);
INSERT INTO rel_supplier_service VALUES (345, 445);
INSERT INTO rel_supplier_service VALUES (346, 446);
INSERT INTO rel_supplier_service VALUES (347, 447);
INSERT INTO rel_supplier_service VALUES (348, 448);
INSERT INTO rel_supplier_service VALUES (349, 449);
INSERT INTO rel_supplier_service VALUES (350, 450);

SELECT * FROM rel_supplier_service;

DELETE FROM rel_supplier_service;

prompt done

--CERINTE STUDIU DE CAZ

--1.Asocierea fiecarui client cu o polita activa sau istorica + 2.Stocarea relatiei dintre client si polita 
SELECT c.id_client, c.first_name, c.last_name, po.start_date, po.expiration_date, 'Polita cu numarul ' || po.policy_number|| ' este: ' || 
  CASE
    WHEN SYSDATE < po.start_date THEN 'in proces'
    WHEN SYSDATE BETWEEN po.start_date AND po.expiration_date THEN 'activa'
    ELSE 'inactiva'
  END AS status_polita
FROM clients c
JOIN policy po ON c.id_client = po.id_client
ORDER BY c.id_client;

--3.Inregistrarea specializarilor si serviciilor oferite de furnizori
SELECT s.supplier_id, s.supplier_type, s.supplier_name, mserv.service_id, mserv.service_name, mspec.specialization_id ,mspec.specialization_name
FROM suppliers s
JOIN rel_supplier_service rss ON s.supplier_id=rss.supplier_id
JOIN medical_services mserv ON rss.service_id=mserv.service_id
JOIN medical_specialization mspec ON mserv.service_id=mspec.service_id
ORDER BY s.supplier_id;

--4.Asocierea cererilor cu furnizorii de servicii care au emis facturi
SELECT pfc.petition_id, s.supplier_name, mserv.service_name, pa.payed_amount
FROM petition_for_compensation pfc
JOIN suppliers s ON pfc.supplier_id = s.supplier_id
JOIN rel_supplier_service rss ON s.supplier_id = rss.supplier_id
JOIN medical_services mserv ON rss.service_id = mserv.service_id
JOIN payment pa ON pfc.petition_id = pa.petition_id
ORDER BY pfc.petition_id;

--5.1.Monitorizarea platilor realizate catre furnizori sau direct clientilor
SELECT s.supplier_id, s.supplier_name, c.id_client, c.first_name, c.last_name, pa.id_payment, pa.payed_amount, pa.petition_id
FROM payment pa
JOIN suppliers s ON pa.supplier_id=s.supplier_id
JOIN clients c ON pa.id_client=c.id_client
JOIN petition_for_compensation pfc ON pa.petition_id=pfc.petition_id
ORDER BY s.supplier_id, c.id_client, pa.petition_id;

--5.2.Generarea rapoartelor financiare si de conformitate legala
-- Totalul platilor catre fiecare furnizor
SELECT s.supplier_name, SUM(pa.payed_amount) AS total_plati
FROM payment pa
JOIN suppliers s ON pa.supplier_id=s.supplier_id
GROUP BY s.supplier_name;

---Despagubiri platite catre fiecare client
SELECT c.first_name, c.last_name, SUM(pa.payed_amount) AS total_despagubiri
FROM payment pa
JOIN clients c ON pa.id_client=c.id_client
JOIN rel_payment_petition rpp ON pa.id_payment=rpp.id_payment
JOIN petition_for_compensation pfc ON rpp.petition_id=pfc.petition_id
GROUP BY c.first_name, c.last_name;

-- Statusul cererilor de despagubire
SELECT status, COUNT (*) as numar_cereri
FROM petition_for_compensation
GROUP BY status;

-- Numarul de cereri asociate fiecarui furnizor
SELECT s.supplier_name, COUNT(pfc.petition_id) as numar_cereri
FROM suppliers s
JOIN petition_for_compensation pfc ON=s.supplier_id
GROUP BY s.supplier_name;

-- Suma totala a platilor efectuate pentru fiecare tip de polita
SELECT po.type, SUM(pa.payed_amount) AS total_plati_efectuate
FROM policy po
JOIN petition_for_compensation pfc ON pfc.id_policy=po.id_policy
JOIN payment pa ON pa.petition_id=pfc.petition_id
GROUP BY po.type;

-- Suma totala de despagubiri platite pentru fiecare tip de serviciu medical
SELECT mserv.service_name, SUM(pa.payed_amount) AS total_despagubiri_platite
FROM medical_services mserv
JOIN rel_supplier_service rss ON mserv.service_id=rss.service_id
JOIN suppliers s on rss.supplier_id=s.supplier_id
JOIN petition_for_compensation pfc ON pfc.supplier_id=s.supplier_id
JOIN payment pa ON pfc.petition_id=pa.petition_id 
GROUP BY mserv.service_name;

-- Lista clientilor cu cereri respinse
SELECT c. id_client, c.first_name, c.last_name
FROM clients c
JOIN petition_for_compensation pfc ON c.id_client=pfc.id_client
WHERE pfc.status='Respins'
ORDER BY c.id_client;

-- Lista furnizorilor cu cele mai multe cereri aprobate
SELECT s.supplier_name, COUNT(pfc.petition_id) AS numar_cereri_aprobate
FROM suppliers s
JOIN petition_for_compensation pfc ON s.supplier_id=pfc.supplier_id
WHERE pfc.status='Aprobat'
GROUP BY s.supplier_name
ORDER BY numar_cereri_aprobate DESC;