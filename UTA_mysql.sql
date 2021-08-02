CREATE TABLE `kartya_nev` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `desc` varchar(255)
);

CREATE TABLE `Kartya` (
  `kartya_id` int PRIMARY KEY AUTO_INCREMENT,
  `tipus` int,
  `serial_num` varchar(255),
  `uzembe_h` date,
  `gar_vege` date
);

CREATE TABLE `berendezes` (
  `ber_id` int PRIMARY KEY NOT NULL,
  `all` int,
  `szek` varchar(255),
  `polc` varchar(255),
  `poz` varchar(255)
);

CREATE TABLE `hely` (
  `id` int,
  `ber_id` int,
  `kartya_id` int,
  `datum` date DEFAULT "now()",
  `nev` varchar(255),
  `desc` varchar(255)
);

CREATE TABLE `allomas` (
  `all` int PRIMARY KEY AUTO_INCREMENT,
  `all_nev` varchar(255),
  `szakasz` varchar(255),
  `fonokseg` varchar(255)
);

ALTER TABLE `Kartya` ADD FOREIGN KEY (`tipus`) REFERENCES `kartya_nev` (`id`);

ALTER TABLE `berendezes` ADD FOREIGN KEY (`ber_id`) REFERENCES `hely` (`ber_id`);

ALTER TABLE `hely` ADD FOREIGN KEY (`kartya_id`) REFERENCES `Kartya` (`kartya_id`);

ALTER TABLE `berendezes` ADD FOREIGN KEY (`all`) REFERENCES `allomas` (`all`);
