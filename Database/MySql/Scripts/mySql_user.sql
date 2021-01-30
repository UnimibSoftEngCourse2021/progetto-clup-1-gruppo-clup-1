CREATE USER 'clup_engsw'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'clup_engsw'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'clup_engsw'@'localhost';