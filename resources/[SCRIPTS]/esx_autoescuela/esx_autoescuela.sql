INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_autoescuela', 'Autoescuela', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_autoescuela', 'Autoescuela', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_autoescuela', 'Autoescuela', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('autoescuela','Los Mataratas')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('autoescuela',0,'recruit','Recluta',20,'{}','{}'),
	('autoescuela',1,'officer','maestro',40,'{}','{}'),
	('autoescuela',2,'sergeant','profesor',60,'{}','{}'),
	('autoescuela',3,'lieutenant','examinador',85,'{}','{}'),
	('autoescuela',4,'boss','Jefe',100,'{}','{}')
;
