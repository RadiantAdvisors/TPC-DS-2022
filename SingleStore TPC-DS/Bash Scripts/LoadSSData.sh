#! bin/bash

echo "Process initialized to load data."

mysql -u svc_user -h svc-fdb55051-1f3e-45f4-ae2d-20b191b3dd92-dml.azr-virginia1-1.svc.singlestore.com -P 3306 --default-auth=mysql_native_password -padmin123 -t < Load.sql

echo "********* Data has been loaded into all tables **************"
