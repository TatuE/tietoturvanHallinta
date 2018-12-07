## Esiasteinen ehdotus ohjeistuksen rakenteesta ##

## 1. Esipuhe ##  
## 2. Mitä? ##  
## 3. Miksi? ##  
## 4. Julkisen avaimen kryptografia ##  

Julkisen avaimen kryptografiassa kerralla luodaan kaksi avainta, yksityinen ja julkinen.

Yksityinen avain on salasana(tai salalause, turvallisuuden parantamiseksi) suojattu, ja tarkoitettu vain käyttäjän tietoon. 
Julkinen avain on tarkoitettu julkiseen levitykseen, ja sen voi huolettaa laittaa kaikkien nähtäville internettiin.

Avainparin kummatkin avaimet ovat linkitetty toisiinsa, kuitenkin siten, että julkisen avaimen avulla ei ole mahdollista saada selville käyttäjän yksityistä avainta.

### Enkryptaaminen ###

Avainparin julkisella avaimella on mahdollista enkryptata tiedostoja, tai vaikka kokonaisia levyjä.
Kuka tahansa voi kenen tahansa julkisella avaimella enkryptata tiedoston, joka voidaaan avata vain avainparin yksityisellä avaimella.

### Allekirjoitus ###

Avainparin yksityisellä avaimella on mahdollista digitaalisesti allekirjoittaa viestejä.  
Tällöin viestin vastaanottaja voi yksityistä avainta vastaavalla julkisella avaimella varmistua, että viestin lähettäjä on tosiaan, kuka tämä väittää olevansa, sekä että viestin sisältöä ei ole muokattu välillä.  
Toimii siis samalla tavalla, kuin käsin tehty allekirjoitus, paitsi että tämä on huomattavasti varmempi. Yksityisellä avaimella tehtyä digitaalista allekirjoitusta ei ole mahdollista jäljitellä.

Esimerkki hyvästä allekirjoituksen käyttökohteesta olisi käyttäjän palveluntarjoajien sähköpostit. Lukuisat kalasteluviestit yrittävät jäljitellä oikean palveluntarjoajan sähköposteja, ja näin saada käyttäjää syöttämään kirjautumistunnuksensa rikollisten palveluihin. Jos palveluntarjoajat käyttäisivät digitaallista allekirjoitusta viesteissään, voisi käyttäjä varmistua, että viestin lähettäjä on se, kuka tämä väittää olevansa.

## 5. Mikä on PKI? ##  
Jos kaksi tahoa (Alice & Bob) tuntevat omat yksityiset avaimensa ja toistensa julkiset avaimet, he voivat kommunikoida turvallisesti lukuisien julkiseen avaimeen pohjautuvien protokollien avulla. Näihin protokolliin lukeutuvat mm. IPSec, PGP ja SSL. Kysymys kuuluukin, että miten he tuntevat toisensa?  
PKI:n (Public Key Infrastructure) tarkoitus onkin luoda turvallinen, tehokas ja käytännöllinen tapa löytää julkisia avaimia. Nimensä mukaan kyseessä on infrastruktuuri, joka voi rakentua monilla eri tavoilla. Käytössä on lukuisia erilaisia malleja, jotka eroavat toisistaan turvallisuuden, skaalautuvuuden ja rakenteen mukaan. Tutustumme näihin erilaisiin malleihin hieman myöhemmin.  
Julkisen avaimen sertifikaateissa on olemassa standardeja, jotka pystyvät tukemaan erilaisten PKI-mallien vaatimuksia. Laajimmin käytetty näistä standardeista on [X.509](https://en.wikipedia.org/wiki/X.509). Tässä kappaleessa käymme läpi joitakin PKI -malleja, puhuen niiden vahvuuksista ja heikkouksista.

Palataan aiemmin heränneeseen kysymykseen. Kuinka Alice ja Bob saavat toistensa julkiset avaimet selville? Toiset toimintatavat ovat epäkäytännöllisiä ja/tai epäluotettavia. Esimerkkinä näistä:  
- Konfiguroidaan jokaiselle käyttäjälle muiden käyttäjien julkiset avaimet siltä varalta, että he haluavat kommunikoida. Tämä on         varmastikin turvallista, mutta ei ole mitenkään järkevästi toteutettavissa suuremmissa verkoissa.  
- Levitetään julkisia avaimia laajasti esimerkiksi siihen tarkoitetulla verkkosivulla. Tämä ei ole turvallista, vaikka julkisten avaimien ei kuulukaan pitää salassa. Tässä kuitenkin herää epävarmuus siitä, onko Bobin avain oikeasti hänen, vai onko joku muu tekeytynyt häneksi.

Tämänhetkinen yleisesti hyväksytty ratkaisu on se, että on olemassa luotettuja tahoja, CA (Cerfificate Authorities), joiden tehtävä on digitaalisesti allekirjoittaa sertifikaatteja, joiden avulla varmistetaan kenelle julkinen avain kuuluu.  
Arkisessa tilanteessa on liikaa olettaa, että Bobilla olisi tiedossa Alicen avaimen allekirjoittanut CA. Tämän takia tarvitaan eräänlainen sertifikaattien ketju, jota seuraamalla Bob vastaanottaa Alicen avaimen.  

![skuva1](https://raw.githubusercontent.com/TatuE/tietoturvanHallinta/master/documents/kuvat/skuva1.png?token=AdzH0_ZDn3NUgL8puJLXBHnb6BxjUjCQks5cAWpkwA%3D%3D)


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


### Yksittäinen CA + monta RA:ta (registeration Authority) ###  

Samoin tavoin kuin edellinen malli, tämäkin perustuu siihen, että on olemassa yksi CA ja kaikille laitteille on konfiguroitu tämän julkinen avain. Kaikki sertifikaatit siis allekirjoittaa tämä yksittäinen CA. Lisäksi tähän malliin kuuluu, että olemassa on useita RA:ita, joihin CA luottaa. RA:n tehtävä on autentikoida käyttäjä ja käyttäjän avain, sekä lähettää allekirjoitettu pyyntö CA:lle. Kun CA vastaanottaa allekirjoitetun pyynnön, se luovuttaa sertifikaatin. Käyttäjien näkökulmasta tämä toimintatapa muistuttaa yksittäisen CA:n mallia.  
Mitä edellisen mallin ongelmia tämä rakenne ratkaisee? Kun olemassa on monta RA:ta, on hyvin todennäköistä, että ainakin yksi niistä on paremmin saatavilla kuin yksittäinen CA. Vaikka CA:n alaisuudessa on monta RA:ta, tarvitsee asiakas edelleen vain CA:n julkisen avaimen. Pelkästään CA on tietoinen RA avaimista.  
RA:n kumoaminen (jos RA menettää luotettavuutensa) toimii tässä mallissa yksinkertaisesti. CA voi yksinkertaisesti vastata kyseisen RA:n pyyntöihin, jolloin se ei kykene enää suorittamaan tehtäviään.

Tämä malli kuitenkin sisältää muilta osin samat heikkoudet kuin yksittäisen CA:n infrastruktuuri.  
[[1](https://pdfs.semanticscholar.org/0fc4/0e88e1aec293ddfbbc5b82c3e294e8c0ed14.pdf)]




## 6. Mikä on Web of Trust? ##  

### Overwiev ###

CentralAuthority(CA)-mallin sijaan, jossa luottamus ostetaan CA-sertifikaation muodossa tällä voittoa tekevältä yritykseltä, 
PrettyGoodPrivacy(PGP)-mallissa käyttäjät luovat ja määrittelevät luottosuhteensa itse.

PGP-avaimia käytetään sähköpostien, levyjen ja tiedostojen enkryptaamiseen tai allekirjoitukseen. Kuka tahansa voi käyttäjän julkisella avaimella encryptata tiedoston, jonka pystyy avaamaan vain yksityisellä avaimella.
Käyttäjä voi myös allekirjoittaa tiedoston/sähköpostin yksityisellä avaimellaan, ja vastaanottaja voi käyttäjän julkisella avaimella, että tiedosto/sähköposti on tosiaan tullut oikealta henkilöltä.
Linuksin paketinhallinta käyttää tätä allekirjoitus systeemiä, jotta voidaan varmistua, että ladattu ohjelma tosiaan on peräisin kehittäjältä.

### WoT ###

Avainpari voidaan luoda mm. gpg ohjelmalla.

![avaimen luonti](https://raw.githubusercontent.com/TatuE/tietoturvanHallinta/master/documents/kuvat/key-gen.png?token=AdzIIcU-YD6rTfdTMGgUEX_XyRLHfTxcks5cE31awA%3D%3D)

1. Valitaan salaus algoritmi
2. Salauksen pituus, lyhempi on turvattomampi, pidemmässä kestää pidempään luoda ja se vie enemmän tilaa
3. Avaimen voimassaoloaika. Mitä pidempään käytetään samaa avainta, sitä todennäköisemmäksi tulee, että se varastetaan/kopioidaan ja ennen pitkään saadaan murrettua. Näin ollen avaimella tulisi olla vanhentumispäivä.
4. Syötetään avaimen käyttäjän nimi, sähköpostiosoite ja valinnainen kommentti, mihin avainta käytetään.
5. Seuraavaksi prosessi luo ja tulostaa avaimet näytölle.


pub on julkinen avain, joka lähetetään avainpalvelimelle. Näitä on useita (mm. MIT ylläpitää), ja ne jakavat tietoa keskenään. Täten ennen pitkää julkinen avain leviää kaikille avainpalvelimille.
pub on julkinen avain, joka lähetetään avainserverille.

![send-key](https://raw.githubusercontent.com/TatuE/tietoturvanHallinta/master/documents/kuvat/key-send.png?token=AdzIIZYlt2DPRX9LOftaFMHrm6L7c0U9ks5cE4JgwA%3D%3D)  

Tähän on tallennettu avaimen käyttäjän tiedot. Julkista avainta voidaan etsiä nimellä, sähköpostilla tai suoraan julkisella avaimella.  

![search-key](https://raw.githubusercontent.com/TatuE/tietoturvanHallinta/master/documents/kuvat/key-search.png?token=AdzIIfW-ooSkSofqyi4F8XryJ7dY3vthks5cE4PqwA%3D%3D)  

PGPn suurin ongelma on avainten käyttäjien henkilöllisyyden varmistaminen. Kuka tahansa voi luoda avainparin mille tahansa nimelle, ja täten väittää olevansa jotain muuta kuin oikeasti on. Tällöin on jokaisen käyttäjän itsensä vastuulla, luodessa luottosuhteita muiden avaimiin, varmistaa avaimen haltijan henkilöllisyys.
Toinen käyttäjä voi näin allekirjoittaa julkisen avaimen ja luoda luottosuhteen tähän. Ennen allekirjoitusta tulee kuitenkin varmistaa avaimen käyttäjän henkilöllisyys.  
Käytännössä tämä tarkoittaa että, avainten allekirjoitus tulisi suorittaa kasvotusten ja vertaimella vielä allekirjoitettavan avaimen sormenjälkeä.  

![key-check](https://raw.githubusercontent.com/TatuE/tietoturvanHallinta/master/documents/kuvat/key-check.png?token=AdzIIQ07JvmF8h7TK6sX289LuG4kQA1Rks5cE4U4wA%3D%3D)  

Nyt voidaan aloittaa allekirjoitusprosessi. Tämä avaa gpg-konsolin. fpr-komento vielä tulostaa julkisen avaimen sormenjäljen, josta tulisi vielä vertailla avaimen haltijan kanssa esim. kolme ensimmäistä numerojonoa.  

![key-sign](https://raw.githubusercontent.com/TatuE/tietoturvanHallinta/master/documents/kuvat/key-sign.png?token=AdzIIakMv17K9sdSWS-PSI5_WFmjQFAGks5cE4X1wA%3D%3D)  

Tässä prosessissa valitaan vielä luottamuksen taso. (1) vihteehdon kohdalla voisi nostaa esille kysymyksen, onko edes järkeä hyväksyä avainta, jota ei ole tarkistanut millään lailla. (3) vaihtoehto tarkoittaa käytännössä henkilöllisyyden varmistamista virallisesta valtion takaamasta henkilöllisyystodsituksesta (passi, henkilökortti, ajokortti), sekä myös mahdollisesti henkilön tuntemista aikaisemmista yhteyksistä.
  
Koska WoT-mallissa henkilöllisyyden tarkastimen on tärkeää, järjestetään erityisiä key-signing-juhlia. Näissä käyttäjät vahvistavat toistensa henkilöllisyydet sekä allekirjoittavat toistensa avaimia. Näin muodostuu allekirjoitusten verkostoja. (Ikävä kyllä en löytänyt viitteitä suomessa järjestettävistä tapahtumista).  

![wot-kuva1](https://raw.githubusercontent.com/TatuE/tietoturvanHallinta/master/documents/kuvat/VepOfRustKuve.jpg?token=AdzIIeDrCp7BFFULXHlDkHI9HPLVypewks5cE41rwA%3D%3D)  

"Valmis" WoT voisi näyttää seuraavalta

![WoTwotwoooot](http://www.phillylinux.org/keys/phillylinux.jpg)
[http://www.phillylinux.org/keys/historical.html]

WoT sisältää useita linkkejä eri henkilöiden välillä. Tällöin vaikka yksi linkki tippuisikin pois, voidaan käyttää jotain toista reittiä. Tämä on WoTin suurin vahvuus CA-malliin verrattuna, jossa yhden linkin viottuminen vaikuttaa kaikkiin sen alapuolella toimiviin.
Suurin heikkous taas, että henkilöiden varmentaminen vaatii aikaa ja mahd. myös matkustelua. Verkoston luominen ja ylläpito vaatii paljon työtä.

## 7. Mitä ongelmia niissä on? ##  

### PKI:n ongelmakohdat ###  

Sertifikaatit ovat houkutteleva liiketoimintamalli. Niiden kirjoittaminen on lähes maksutonta, ja jos ihmiset tilaavat niitä vuosittain tietystä maksusta, syntyy huomattava liikevoitto. Vaihtoehtoisesti voit saada jonkun ylläpitämään omaa CA palvelua ja maksamaan sinulle rahaa jokaisesta sertifikaatista jonka tämä myöntää. Ala on tuottoisa, eikä parempaa yleisesti hyväksyttyä tietoturvaratkaisua ole käytössä, joten PKI:ta lobbataan paljon ja suuri osa sitä koskevasta kirjallisuudesta on PKI -kauppiaiden tuottamaa. Tämä kirjallisuus saattaa jättää puutteellisen kuvan PKI:n ongelmakohdista ja herättää myöskin kysymyksiä. Käydään niitä läpi seuraavaksi.

Turvallisuutta voidaan ajatella ketjuna; se on yhtä vahva kuin sen heikoin lenkki. CA:han pohjautuva infrastruktuuri on moniosainen, eikä sen kaikki osat ole salattuja. Ihmiset osallistuvat siihen ja tekevät virheitä. Työskentelevätkö nämä ihmiset perusteellisesti ja rehellisesti? Entä laitteet joilla he työskentelevät? Näiden laitteiden ja käytettyjen järjestelmien tulee olla turvattuja ja käytössä olevia tietoturvan työkaluja tulee hyödyntää. Nämä seikat muodostavat yhdessä kokonaisuuden PKI:n turvallisuudesta ja viittaavat mahdollisiin riskeihin.

**Keneen luotamme ja miksi?**  
Keneen luotamme ja miksi? Kryptografian näkökulmasta luotettavuus tarkoittaa sitä, että CA hallitsee avaimiaan turvallisesti. Onko tämä kuitenkaan riittävä perustelu sille, että sertifikaatteja jakava taho on luottamuksen arvoinen esimerkiksi arvokasta tietoa käsiteltäessä? Lisäksi voidaan kysyä, että kuka on valtuuttanut CA:n jakamaan valtuutuksia? Entä kuka on päättänyt, että tietty CA on luotettava?

**Kuka käyttää avaintani?**  
Yksi suurimmista riskeistä PKI:ssa liittyy omaan yksityiseen avaimeesi. Tavallinen käyttäjä säilyttää avaintaan lähes varmasti riittämättömän suojauksen takana. Emme voi tietenkään odottaa, että tavallinen käyttäjä suojaisi avaimensa samalla tasolla kuin esimerkiksi CA. Mutta miksi oman avaimen turvauksella on väliä käyttäjän kannalta? Jos yksityinen avaimesi on CA:n varmentama, voidaan se liittää suoraan sinuun, ja olet vastuussa kaikesta siitä mitä tällä avaimella allekirjoitetaan. Joidenkin lainsäädäntöjen alaisuudessa et voi edes kiistää avaimellasi allekirjoitettuja tapahtumia verkossa vaan olet juridisesti vastuussa. Vertauskohdaksi voidaan mainita esimerkiksi tietyt tilaukset puhelinlaskussasi. Voit kiistää tilanneesi matkalipun bussiin ja kauppiaalla on velvollisuus todistaa, että olet todella tehnyt kyseisen tilauksen. Näin et kuitenkaan voi toimia yksityiseen avaimeen liittyvien väärinkäyttöjen tapauksessa.

**Kuinka turvallinen varmentajan järjestelmä on?**  
Vaikka oma järjestelmäsi oli täysin aukoton ja avaimesi turvassa, ei se poista sitä riskiä, että sertifikaattisi varmentavan tahon suojaus voidaan ohittaa. Siinä tapauksessa, että hyökkääjä onnistuu ohittamaan varmentajan puolustuksen, voi hän lisätä oman "Root Public Keyn" CA:n avainlistaan. Tämä mahdollistaa sen, että hyökkääjä pystyy allekirjoittamaan oman sertifikaattinsa, jota kohdellaan oikeana sertifikaattina. Ainoa ero oikean sertifikaatin välillä on, että hyökkääjän sertifikaatti sisältää hänen oman julkisen avaimen.

![Chain_of_trust](https://github.com/TatuE/tietoturvanHallinta/blob/master/documents/kuvat/Chain_of_trust.png?raw=true)  
[[2](https://en.wikipedia.org/wiki/Root_certificate)]

Ainoa ratkaisu tähän ongelmaan on, että kaikki sertifikaattien varmennus tapahtuu järjestelmillä, jotka olisivat täysin murtovarmoja.


**Kuka "Timo Virtanen" hän on?**  
Sertifikaatit assosioivat julkiset avaimet yleensä nimien kanssa, mutta kuinka hyödyllistä tämä oikeasti on?  
Kuvitellaan tilanne, jossa saat ystäväsi, Timon, sertifikaatin sähköpostilla. Saatat henkilökohtaisesti tuntea yhden Timo Virtasen, mutta kuinka monta tämännimistä henkilöä CA tuntee? Sertifikaatissa esiintyvä nimi on sinulle varmasti tuttu, mutta voitko olla täysin varma, että se on juuri oikea henkilö? Sertifikaattin nimeen lisätään yleensä muutakin tietoa, jotta nimestä saadaan tämän CA:n kannalta uniikki. Tiedätkö kuitenkaan näitä tietoja ystävästäsi? Entä sitä, että miltä CA:lta hänen sertifikaatin pitäisi tulla?

Nimien merkitys pienenee kun sertifikaattien määrät kasvavat. Nimet saattavat toimia perheen tai luokan mittakaavassa, mutta koko maailmaa ajetellen niillä ei juurikaan ole merkitystä sertifikaattien osalta.


**Onko CA:lla valtuuksia?**  
CA:lla on valtuuksia tehdä sertifikaatteja, mutta onko tällä arvovaltaa koskien sertifikaattien sisältöä? Esimerkiksi SSL Serverin sertifikaatissa mainitaan kaksi meitä kiinnostavaa asiaa. Avaimen haltijan nimi, sekä serverin DNS-nimi. DNS-nimien antamisesta vastaavat eri viranomaiset, eikä yksikään yleisimpien selaimien listaamista CA:sta ei kuulu siihen joukkoon. Tämä tarkoittaa, että sertifikaatissa mainittu DNS -nimi ei ole valtuutettu lause.  
Mainitsimme myös avaimen haltijan nimen. SSL Serverin tapauksessa tämä nimi kuuluu mitä luultavimmin jollekin yritykselle. Niin kuin DNS-nimen kohdalla, yritysnimikkeistäkin vastaa jonkinlainen viranomainen, eivätkä selaimien sisältävät CA:t eivät kuulu myöskään tähän  joukkoon. 


**Onko käyttäjä osa turvallisuussuunnittelua?**  
Oletetaanko turvallisuuden suunnittelussa, että käyttäjä toimii parhaiden käytäntöjen mukaan? Oletetaanko, että käyttäjä tarkastaa käyttämänsä sivun sertifikaatit ja toimii saamansa tiedon perusteella. Sivun sertifikaatti voi olla täysin liittymätön siihen sivuun jolla käyttäjä vierailee, eikä tämä tiedo ole itsestään näkyvillä. Entä osaako käyttäjä hyödyntää saamaansa tietoa?  
Jos käyttäjä on osa turvallisuussuunnittelua, voi hänen huolimattomuutensa rikkoa muuten toimivan turvallisuuden asetelman.


**Kuinka turvallisia sertifikaatteihin liittyvät käytännöt ovat?**
Sertifikaatit eivät itsestään luo turvallisuutta, vaan niistä saatavan hyödyn eteen täytyy nähdä vaivaa. Hyviin käytäntöihin liittyy monia seikkoja:  
- Onko avaimen käyttöikä laskettu, vai onko se valittu sattumalta tai yleisen käytännön mukaan? Avaimilla on kryptograafinen käyttöikä, joka elää uusien teknologioiden mukaan. Voidaan siis laskea aika, joka salauksen murtamiseen kuluu. Lisäksi voidaan laskea aika, jonka sisällä on todennäköistä, että avain menetetään esimerkiksi varkauden vuoksi.
- Tukeeko sertifikaatin myyjä sulkulistojen käyttöjä? Sulkulistat (Certification Revocation List, CRL) on sisäänrakennettu joihinkin sertifikaattistandardeihin, mutta monet välttelevät niiden käyttöä, koska ne ovat vanhanaikaisia ja kankeasti käytettäviä. Mutta jos niitä ei käytetä, niin miten sertifikaattin sulkeminen / peruminen suoritetaan?
- Jos sulkulistoja sovelletaan, niin miten avaimien vaarantuminen tai väärinkäyttö havaitaan, jotta lisäys sulkulistalle laukeaa? Voidaanko sulkeminen tehdä jälkikäteen, jos sertifikaatin haltija kieltää käyttäneensä avainta aikaisemmin johonkin kyseenalaiseen?


Tähän tiivistetty lista muista heikkouksista myöhemmin..
[[3](https://www.schneier.com/academic/paperfiles/paper-pki-ft.txt)]



## 8. Miten ne vertautuvat keskenään? ##  

--------------------------------------------------------------------------------------------

**Puheeksi tulleita asioita / ehdotuksia:**  
Liiketoiminnan jatkuvuuden turvaaminen  
Tarkistuslista  
 -Bios kello
Testaus
Yhteydenotto CRL hallintaan tarpeen mukaan (oma cert esim. vanhenee, otetaan yhteyttä ja saadaan oma certti taas kuntoon)

Lähteet:  
1. https://pdfs.semanticscholar.org/0fc4/0e88e1aec293ddfbbc5b82c3e294e8c0ed14.pdf  
2. https://en.wikipedia.org/wiki/Root_certificate  
3. https://www.schneier.com/academic/paperfiles/paper-pki-ft.txt  
4. https://www.gnupg.org/
5. https://www.youtube.com/watch?v=Lq-yKJFHJpk
