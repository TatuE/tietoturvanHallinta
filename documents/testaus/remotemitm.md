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
  * https://stackoverflow.com/questions/1435000/programmatically-install-certificate-into-mozilla
* Proxyn voi toteuttaa OWASP ZAP:illa
  * Työkalut myös sertifikaatin luomiseen

## Vaikutus
Jos Firefoxiin 
* asennetaan etänä saastutettu sertifikaatti, joka sallii liikenteen kierrättämisen proxyn kautta,
* määritetään etänä proxyn asetukset, sekä
* tehdään edellämainitut käyttäjän koskaan huomaamatta,

voidaan täysin käyttäjän huomaamatta ohjata liikenne toisen palvelimen kautta, ja poimia liikenteestä salaamattomia tietoja suoraan. 

## "Käytännön" toteutus
Proxyasetusten muuttaminen onnistuu yhtä tiedostoa muuttamalla. Proxy määritellään firefoxin profiilikansiossa olevaan `prefs.js` -tiedostoon, kahteen eri muuttujaan. Linux-järjestelmissä tiedosto sijaitsee käyttäjän omassa kotihakemistossa, ja käyttäjällä on täydet oikeudet sen muuttamiseen. 

Oman sertifikaatin lisääminen selaimeen vaatii hieman enemmän työtä. Sen voi toteuttaa joko
* lisäämällä uuden sertifikaatin tietokantaan bash-skriptin tai vastaavan avulla
* [tekemällä testikäyttäjän, lisäämällä tälle oman sertifikaatin ja tämän jälkeen kopioimalla sertifikaattitietokannan uusile käyttäjille](https://support.mozilla.org/en-US/questions/901549).
