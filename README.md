# RSA


###生成iOS端和后端秘钥文件的方法<br>
生成模长为2048bit的私钥<br>
openssl genrsa -out private_key.pem 2048<br>
生成certification require file<br>
openssl req -new -key private_key.pem -out rsaCertReq.csr<br>
生成certification 并指定过期时间<br>
openssl x509 -req -days3650 -in rsaCertReq.csr -signkey private_key.pem -out rsaCert.crt<br>
生成公钥供iOS使用<br>
openssl x509 -outform der -in rsaCert.crt -out public_key.der<br>
生成私钥供iOS使用 这边会让你输入密码，后期用到在生成secKeyRef的时候会用到这个密码<br>
openssl pkcs12 -export -out private_key.p12 -inkey private_key.pem -in rsaCert.crt<br>
生成pem结尾的公钥供Java使用<br>
openssl rsa -in private_key.pem -out rsa_public_key.pem -pubout<br>
生成pem结尾的私钥供Java使用<br>
openssl pkcs8 -topk8 -in private_key.pem -out pkcs8_private_key.pem -nocrypt<br>
