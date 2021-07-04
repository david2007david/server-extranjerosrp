SET @job_name = 'pearls';

SET @society_name_sur = 'society_pearls';
SET @addon_inventory_privado = 'society_pearls_privado';

SET @society_name_norte = 'society_pearlsnorte';

SET @job_Name_Caps = 'pearls';
 
    

INSERT INTO `addon_account` (name, label, shared) VALUES
  (@society_name_sur, @job_Name_Caps, 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  (@society_name_sur, @job_Name_Caps, 1),
  (@addon_inventory_privado, @job_Name_Caps, 1),
  (@society_name_norte, @job_Name_Caps, 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    (@society_name_sur, @job_Name_Caps, 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  (@job_name, @job_Name_Caps, 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  (@job_name, 0, 'empleado', 'Empleado', 300, '{}', '{}'),
  (@job_name, 1, 'boss', 'Jefe', 600, '{}', '{}')
;

INSERT INTO `items` (`name`, `label`, `limit`, `weight`, `rare`, `can_remove`) VALUES  
    ('pollo', 'Pollo', 15, 75, 0, 1),
    ('caldopollo', 'Caldo de pollo', 10, 150, 0, 1);   