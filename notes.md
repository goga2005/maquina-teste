mongodump --uri="mongodb://127.0.0.1:27017" --db="admin" --collection="system.users" --out="/vagrant/backup"
mongorestore --uri="mongodb://127.0.0.1:27017" --db="admin" --collection="system.users" /vagrant/backup

mongodump --uri="mongodb://127.0.0.1:27017" --db="admin" --out="/vagrant/bkp.bson" --gzip
mongorestore --uri="mongodb://127.0.0.1:27017" --db="admin" --gzip /vagrant/bkp.bson/admin


mongorestore --uri="mongodb://127.0.0.1:27017" --db="admin" --gzip /vagrant/bkp/admin

---
## Backup from produção

mongodump --uri="mongodb://douglasmiyashita:SENHAAQUI@mongodb.al.mt.gov.br:27017/?tls=true" --db="admin" --out="/home/douglasmiyashita/bkp" --gzip

---
## EXTRA

tar czf name_of_archive_file.tar.gz name_of_directory_to_tar

scp douglasmiyashita@mongodb.al.mt.gov.br:/home/douglasmiyashita/bkp/mongo_users.tar.gz .
tar -xvf mongo_users.tar.gz.tar.gz

---
## ADD user in mongosh

use admin

db.createUser(
  {
    user: "douglasmiyashita",
    pwd: passwordPrompt(),
    roles: [
      { role: "root", db: "admin" }
    ]
  }
)

db.createUser(
  {
    user: "intranet",
    pwd: "CExy56WAfzgRe2qazb",
    roles: [
      { role: "dbOwner", db: "intranet" }
    ]
  }
)

---

sudo mongosh --tls --host mongodb-temp.al.mt.gov.br --tlsCertificateKeyFile /etc/ssl/al.mt.gov.br/ca-chain-commercial-key.pem --tlsCAFile /etc/ssl/al.mt.gov.br/ca.crt

---

## Links

### Bug
https://jira.mongodb.org/browse/SERVER-72839

### CVE
https://www.cve.org/CVERecord?id=CVE-2024-1351

### Exemplo conexão
https://www.mongodb.com/pt-br/docs/manual/tutorial/configure-ssl-clients/#connect-to-mongodb-instances-that-require-client-certificates

### Options
https://www.mongodb.com/pt-br/docs/manual/reference/configuration-options/#net-options
