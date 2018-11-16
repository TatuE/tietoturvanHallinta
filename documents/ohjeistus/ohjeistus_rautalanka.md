## Esiasteinen ehdotus ohjeistuksen rakenteesta ##

## 1. Esipuhe ##  
## 2. Mitä? ##  
## 3. Miksi? ##  
## 4. Julkisen avaimen kryptografia ##  

## 5. Mikä on PKI? ##  
Jos kaksi tahoa (Alice & Bob) tuntevat omat yksityiset avaimensa ja toistensa julkiset avaimet, he voivat kommunikoida turvallisesti lukuisien julkiseen avaimeen pohjautuvien protokollien avulla. Näihin protokolliin lukeutuvat mm. IPSec, PGP ja SSL. Kysymys kuuluukin, että miten he tuntevat toisensa?  
PKI:n (Public Key Infrastructure) tarkoitus onkin luoda turvallinen, tehokas ja käytännöllinen tapa löytää julkisia avaimia. Nimensä mukaan kyseessä on infrastruktuuri, joka voi rakentua monilla eri tavoilla. Käytössä on lukuisia erilaisia malleja, jotka eroavat toisistaan turvallisuuden, skaalautuvuuden ja rakenteen mukaan. Tutustumme näihin erilaisiin malleihin hieman myöhemmin.  
Julkisen avaimen sertifikaateissa on olemassa standardeja, jotka pystyvät tukemaan erilaisten PKI-mallien vaatimuksia. Laajimmin käytetty näistä standardeista on [X.509](https://en.wikipedia.org/wiki/X.509). Tässä kappaleessa käymme läpi joitakin PKI -malleja, puhuen niiden vahvuuksista ja heikkouksista.
[[1](https://pdfs.semanticscholar.org/0fc4/0e88e1aec293ddfbbc5b82c3e294e8c0ed14.pdf)]

Palataan aiemmin heränneeseen kysymykseen. Kuinka Alice ja Bob saavat toistensa julkiset avaimet selville? Toiset toimintatavat ovat epäkäytännöllisiä ja/tai epäluotettavia. Esimerkkinä näistä:  
- Konfiguroidaan jokaiselle käyttäjälle muiden käyttäjien julkiset avaimet siltä varalta, että he haluavat kommunikoida. Tämä on         varmastikin turvallista, mutta ei ole mitenkään järkevästi toteutettavissa suuremmissa verkoissa.  
- Levitetään julkisia avaimia laajasti esimerkiksi siihen tarkoitetulla verkkosivulla. Tämä ei ole turvallista, vaikka julkisten avaimien ei kuulukaan pitää salassa. Tässä kuitenkin herää epävarmuus siitä, onko Bobin avain oikeasti hänen, vai onko joku muu tekeytynyt häneksi.

Tämänhetkinen yleisesti hyväksytty ratkaisu on se, että on olemassa luotettuja tahoja, CA (Cerfificate Authorities), joiden tehtävä on digitaalisesti allekirjoittaa sertifikaatteja, joiden avulla varmistetaan kenelle julkinen avain kuuluu.  
Arkisessa tilanteessa on liikaa olettaa, että Bobilla olisi tiedossa Alicen avaimen allekirjoittanut CA. Tämän takia tarvitaan eräänlainen sertifikaattien ketju, jota seuraamalla Bob vastaanottaa Alicen avaimen.  

![skuva1](https://raw.githubusercontent.com/TatuE/tietoturvanHallinta/master/documents/kuvat/skuva1.png?token=AdzH0wUVQBppyBdGjqV_qQKxxKgWVKOTks5b8-bFwA%3D%3D)

Tämä saattaa kuulostaa ja näyttää yksinkertaiselta, mutta se herättää myös kysymyksiä. Mistä Bob tietää CA1:n julkisen avaimen? Voiko kaikkiin ketjun osiin luottaa? Miten hän saa juuri oikeat sertifikaatit, jotka muodostavat ketjun Alicen luo?

Tästä aiheesta puhuessa on hyvä pitää mielessä seuraavat seikat:  
 - Tietoturvallisuudesta puhuessa ei ole olemassa yhtä ratkaisua, joka sopii kaikille. Salassa pidettäviä asioita käsittelevien yrityksien tietoturvakäytännöt voisivat tuntua pienessä yrityksessä tukahduttavilta. Vastaavasti pienellä yritykselle riittävät tietoturvakäytännöt ovat usein lähes varmasti täysin riittämättömät toisen yrityksen silmissä.
 - Olemassa ei ole täydellistä ratkaisua. On parempi käyttää nykyistä puutteita sisältävää ratkaisua sen sijaan, että ei käytetä mitään kunnes täydellinen ratkaisu syntyy ja tulee kaikkien saataville.
 - Jos turvallisuus on liian epäkäytännöllistä tai häiritsee toimintaa riittävästi, käyttäjät alkavat kiertämään sitä.
 
 Käydään seuraavaksi läpi joitakin PKI malleja.
 
 ### Yksittäisen CA:n malli ###

Tämä malli koostuu yhdestä ainoasta CA:sta koko maailmassa. Jokainen laite konfiguroitaisiin etukäteen tuntemaan tämän CA:n julkinen avain. Kaikki sertifikaatit tulisi hankkia tätä CA:ta hallinnoivalta organisaatiolta. Tämä olisikin varmasti yksinkertaisin ratkaisu.  
Mutta mikä siinä on vialla?
- Maailmassa ei ole sellaista järjestöä, johon kaikki maat, yritykset, laitkoset yms. luottavat.
- On epäkäytännöllistä hankkia sertifikaatti etäiseltä ja vieraalta organisaatiolta. Sertifikaatin jakamisen tapahtuisi luultavimmin sähköpostilla, eikä se ole turvallista ennen kuin sertifikaatti on käytössä turvaamassa liikennettä. Myös CA:n osalta on vaikeaa todentaa, että sertifikaatin on pyytänyt juuri se henkilö kenelle se on osoitettu.
- Tietoturvan kannalta on hyvä vaihdella avaimia tietyin väliajoin. Mitä siis tapahtuu, jos CA haluaa vaihtaa avaimensa vahvempaan tai minimoida jo sattuneita vahinkoja? Kaikki laitteet maailmassa tulisi konfiguroida uudelleen sisältämään tämä uusi avain.
- Jos jokin organisaatio saa yksinvallan markkinoilla ja maailma on riippuvainen sen hallinnoimasta teknologiasta, on mahdollista, että se hyväksikäyttää asemaansa esimerkiksi korkeiden maksujen muodossa.

Puutteistaan ja ongelmistaan huolimatta tällä mallilla on omat puolestapuhujansa ja sitä on myöskin implementoitu käyttöön.


### Yksittäinen CA + usea RA ###  

Samoin tavoin kuin edellinen malli, tämäkin perustuu siihen, että on olemassa yksi CA ja kaikille laitteille on konfiguroitu tämän julkinen avain. Kaikki sertifikaatit siis allekirjoittaa tämä yksittäinen CA. Lisäksi tähän malliin kuuluu, että olemassa on useita Rekisteröinti viranomaisia (RA), joihin CA luottaa. RA:n (registeration Authority) tehtävä on autentikoida käyttäjä ja käyttäjän avain, sekä lähettää allekirjoitettu pyyntö CA:lle. Kun CA vastaanottaa allekirjoitetun pyynnön, se luovuttaa sertifikaatin. Käyttäjien näkökulmasta tämä toimintatapa muistuttaa yksittäisen CA:n mallia.  
Mitä edellisen mallin ongelmia tämä rakenne ratkaisee? Kun olemassa on monta RA:ta, on hyvin todennäköistä, että ainakin yksi niistä on paremmin saatavilla kuin yksittäinen CA. Vaikka CA:n alaisuudessa on monta RA:ta, tarvitsee asiakas edelleen vain CA:n julkisen avaimen. Pelkästään CA on tietoinen RA avaimista.  
RA:n kumoaminen toimii tässä mallissa yksinkertaisesti (jos RA 







## 6. Mikä on Web of Trust? ##  
## 7. Mitä ongelmia niissä on? ##  
## 8. Miten ne vertautuvat keskenään? ##  

**Puheeksi tulleita asioita / ehdotuksia:**  
Liiketoiminnan jatkuvuuden turvaaminen  
Tarkistuslista  
 -Bios kello
Testaus
Yhteydenotto CRL hallintaan tarpeen mukaan (oma cert esim. vanhenee, otetaan yhteyttä ja saadaan oma certti taas kuntoon)

Lähteet:  
1. https://pdfs.semanticscholar.org/0fc4/0e88e1aec293ddfbbc5b82c3e294e8c0ed14.pdf
