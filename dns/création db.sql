create database Fostec CHARACTER SET 'utf8';;

/* creation de user et des droits lié a ceux-ci*/

GRANT ALL PRIVILEGES ON Fostec.* TO 'Admin'@'localhost' IDENTIFIED WITH sha256_password BY 'mot_de_passe';
GRANT ALL PRIVILEGES ON Fostec.* TO 'Admin'@'%' IDENTIFIED WITH sha256_password BY 'mot_de_passe';
GRANT SELECT, SHOW VIEW, RELOAD, REPLICATION CLIENT, EVENT, TRIGGER ON *.* TO 'Backup'@'%';
GRANT execute on Fostec.* TO 'Beta'@'172.19.0.2' IDENTIFIED WITH sha256_password by 'password';;
FLUSH PRIVILEGES;