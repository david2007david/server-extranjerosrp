INSERT INTO `jobs` (name, label) VALUES
  ('offpolice','Off-Duty'),
  ('offambulance','Off-Duty'),
  ('offmecano','Off-Duty')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('offpolice',0,'recruit','Recrue',5,'{}','{}'),
  ('offpolice',1,'officer','Officier',5,'{}','{}'),
  ('offpolice',2,'sergeant','Sergent',5,'{}','{}'),
  ('offpolice',3,'lieutenant','Lieutenant',6,'{}','{}'),
  ('offpolice',4,'boss','Commandant',10,'{}','{}'),
  ('offambulance',0,'ambulance','Ambulance',5,'{}','{}'),
  ('offambulance',1,'doctor','Doctor',5,'{}','{}'),
  ('offambulance',2,'chief_doctor','Chief Doctor',6,'{}','{}'),
  ('offambulance',3,'boss','Boss',10,'{}','{}'),
  ('offmecano',0,'recrue','Technician',5,'{}','{}'),
  ('offmecano',1,'novice','Technician',5,'{}','{}'),
  ('offmecano',2,'experimente','Technician',5,'{}','{}'),
  ('offmecano',3,'chief','Chef déquipe',6,'{}','{}'),
  ('offmecano',4,'boss','Patron',10,'{}','{}')
;