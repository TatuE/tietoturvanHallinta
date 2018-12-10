# Testausraportti: OCSP-viestiliikenteen häirintä
## Työkalut
Käytimme tässä testauksessa työkaluina Burp Suitea sekä OWASPin Zed Attack Proxyä (ZAP). Näiden verkkoliikenneanalyysityökalujen avulla teimme hallittua liikenteen uudelleenohjausta ja suodatusta, jonka tavoitteena oli häiritä tai kokonaan estää Online Certificate Status Protocol (OCSP) -viestien kulkua. 

## Tavoitteet
Tällä liikenteen häirinnällä oli tarkoitus joko saada vanhentuneet tai käytöstä poistuneet sertifikaatit näyttämään käyttäjän silmissä toimivilta, tai aiheuttaa virheitä täysin kelvollisten sertifikaattien käytöstä. Näistä tavoitteista ensimmäinen soveltuu hyvin mm. tietoturvarikkeen keston pidentämiseen (tietoturvarikkeen takia kuoletettu sertifikaatti näyttää käyttäjälle edelleen täysin toimivalta), ja jälkimmäinen lähinnä tietoliikenteen häirintään (verkkosivujen lataaminen johtaa jatkuviin tietoturvavirheilmoituksiin). 

## Testaus
### OCSP-vastausten muuttaminen
Koitimme aluksi muuttaa OCSP vastauksia dynaamisesti niin, että jokainen sivunlataus johtaisi "vanhentuneesta/epäkelvosta sertifikaatista" kertovaan virheilmoitukseen. Vaikka saimmekin napattua OCSP-viestit suoraan tietoliikenteestä (ne lähetetään salaamattomina), emme onnistuneet muokkaamaan niitä dynaamisesti. Tästä johtuen viesteihin upotettu aikakoodi esti tämän lähestymistavan toiminnan.

### OCSP-vastausten täysi blokkaaminen
Siirryimme pian kokeilemaan OCSP-viestien täyttä estämistä, jonka oli tarkoitus johtaa samaan lopputulokseen. Käytännössä tämän toteuttaminen oli huomattavan helppoa (kaikki "ocsp.*" -osoitteisiin lähetetyt paketit pudotettiin), josta ei kuitenkaan seurannut minkäänlaista muutosta verkkosivustojen toimintaan. Epäilemme tästä syyksi työkalujen vaatiman oman root-sertifikaatin käyttöä, joka todennäköisesti sai OCSP-vastauksensa niin, ettei proxymme päässyt siihen puuttumaan.

## Lopputulos
OCSP-vastausten muuttaminen osoittautui niin hankalaksi tehtäväksi, ettemme sitä lähteneet aikarajoitteiden vuoksi liiemmin testaamaan. Jos sen kautta haluttaisiin saavuttaa tuloksia, olisi oman pyyntöjä muokkaavan koodin kirjoittaminen välttämätöntä. Vain reaaliaikaisesti automaattisesti muokattavat pyynnöt saattaisivat onnistua.

OCSP-liikenteen täysi estäminen taas voisi toimia, mikäli se suoritettaisiin pelkällä välityspalvelimella, jonka käyttö ei vaatisi sertifikaatteihin puuttumista. Tässäkin tapauksessa aikarajoitteet estivät syvällisemmän tutustumisen.
