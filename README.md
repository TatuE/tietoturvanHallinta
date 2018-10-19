# Verkkovarmenteet yrityskäytössä
*Tietoturvan hallinnan harjoitustyö, Haaga-Helia 2018*  
*Tatu Erkinjuntti, Jussi Isosomppi, Eino Kupias, Saku Kähäri*

## Projektisuunnitelma
### Aihe
Harjoitustyömme aihe on vertailla eri varmenteita, tutkia niiden käyttöä, hyötyjä sekä mahdollisia haittoja. Harjoitustyön tarkoitus olisi ymmärtää varmenteiden käyttöä, tietoturvahallinnan näkökannasta.

### Vaiheistus
Harjoitustyö olisi toteutukseltaan kaksivaiheinen, joisa ensimmäisessä tutkimme teoriapuolta varmenteista, sekä niiden eroista. Päätarkoituksena tässä vaiheessa on pystyä hahmottamaan varmenteiden rakennetta, sekä niiden teknistä käyttötarkoitusta.

Toisessa vaiheessa etsimme ja tutkimme mahdollisia haavoittuvuuksia varmenteiden käytössä, niiden väärinkäyttöä sekä sen ehkäisemistä. Lopputuloksena on tarkoitus muodostaa näkemys siitä, miten varmenteiden käytön turvallisuutta voisi parantaa yrityskäytössä yleisellä tasolla, sekä minkä varmenteen käyttö soveltuu parhaiten yrityskäyttöön.

### Laajuus
Harjoitustyömme keskittyy nimenomaan selainyhteyden varmenteisiin. Emme tässä yhteydessä tutki viestiyhteyksien tai muun tiedonsiirron salausta, vaan kartoitamme ratkaisuja, joilla parannetaan yrityksen verkkopalveluiden tietoturvaa ja käytettävyyttä.

## Vaihe 1: Tutkimus
## kaikille ryhmän jäsenille tehtäväksi tutkia PKI:a
## Ryhmän jäsenet tutkivat määrättyä aihetta yksitellen. 
### GPG
*Jussi, Tatu*
#### Perustietoa GPG:stä
GPG, eli GNU Privacy Guard, on vuonna 1999 julkaistu GPL-lisenssin mukainen versio aiemmasta PGP-salausohjelmistosta, tai tarkemmin sen avoimen lähdekoodin versiosta OpenPGP:stä. Vuonna 1991 julkaistu PGP (Pretty Good Privacy) oli ensimmäisiä laajalti käytettyjä verkon salausmenetelmiä.

GPG:stä ylläpidetään kahta versiota, modernia (uusin versio 2.2) sekä klassista (uusin versio 1.4), jotka eroavat toisiltaan ominaisuuksien määrässä ja näin ollen alustalta vaadituissa tehoissa. Klassinen versio soveltuu edelleen hyvin käytettäväksi sulautetuissa järjestelmissä tai vanhemmilla alustoilla. Syyskuussa 2017 julkaistun modernin haaran versio 2.2 toi mukanaan mm. elliptisten käyrien salausmenetelmiä, jotka soveltuvat hyvin ympäristöihin, joissa laskentatehoa on saatavilla rajallisesti ja toiminnan nopeus on tärkeää (maksukorttien salaussirut, sulautetut järjestelmät).

GPG:n modernissa versiossa on saatavilla API, joka mahdollistaa monien GPG:n toimintojen lisäämisen helposti muihin sovelluksiin.
#### Merkittävät haavoittuvuudet
GPG:ssä on vuosien varrella ollut muutamia vakavia haavoittuvuuksia, jotka ovat mahdollistaneet suojauksen murtamisen tai avainten väärinkäytön.
### x509
###	Saku
###	Eino

## Vaihe 2: Käytännön testaus
### Välimieshyökkäykset

### Sertifikaatin blacklistaus
