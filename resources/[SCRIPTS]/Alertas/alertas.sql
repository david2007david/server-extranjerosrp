CREATE TABLE IF NOT EXISTS `alertas` (
  `identificador` int(11) NOT NULL,
  `nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `alertas` (`identificador`, `nivel`) VALUES
	(1, 0);
