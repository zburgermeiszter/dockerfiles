# Samba server #

**Usage:**

`docker run -it -p 137:137 -p 139:139 -p 445:445 -v /host/path:/container/path -e PASS=<root password> zburgermeiszter/samba`