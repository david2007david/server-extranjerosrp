INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_taxi', 'Taxi', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_taxi', 'Taxi', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_taxi', 'Taxi', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('taxi','Los Mataratas')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('taxi',0,'recruit','Recluta',20,'{}','{}'),
	('taxi',1,'officer','maestro',40,'{}','{}'),
	('taxi',2,'sergeant','profesor',60,'{}','{}'),
	('taxi',3,'lieutenant','examinador',85,'{}','{}'),
	('taxi',4,'boss','Jefe',100,'{}','{}')
;
