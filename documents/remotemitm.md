# Välimieshyökkäys Firefoxiin etänä
## Periaate 
* Firefoxin liikenteen voi ohjata kulkemaan suoraan proxyn kautta
* Proxyn osoite voi olla mikä tahansa
* Proxyn voi asettaa muuttamalla asetustiedoston sisältöä
  * https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data
  * `~/.mozilla/firefox/randomstring.default/prefs.js`
  * user_pref("network.proxy.http", "proxy_osoite");
  * user_pref("network.proxy.http_port", proxy_portti);
* Proxyn toimiminen vaatii sertifikaatin asentamisen selaimeen
  * https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS
  * https://stackoverflow.com/questions/1435000/programmatically-install-certif$
* Proxyn voi toteuttaa OWASP ZAP:illa
  * Työkalut myös sertifikaatin luomiseen

