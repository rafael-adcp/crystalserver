# Custon fixes
- for gold coin / platitum / cyrstal to change upon click, make sure to use `assets-editor` and update them to not be `multi-use` once file is updated, place it under the client and on the server for assets to be properly updated and used.


so i used https://github.com/whitecrixu/myaac-15.xx/tree/1.0
then i faced "Please install PHP zip extension. Plugins upload disabled until then."
on php ini remove the ';' from ;extension=zip
then ran into plugin caching_sha2_password could not be loaded
which was sorted through
mysql -u root -p
ALTER USER 'youruser'@'localhost' IDENTIFIED WITH mysql_native_password BY 'yourpassword';
FLUSH PRIVILEGES;