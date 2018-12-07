# Testausraportti: Bettercap/SSLsniff/SSLstrip
## Työkalut
Bettercap on Linux-ohjelma, joka on suunniteltu verkkoliikenteen kaappaamiseen. Siihen integroidut toiminnallisuudet, kuten SSLsniff ja SSLstrip, mahdollistavat (tietyin varauksin) myös lähtökohtaisesti salatun liikenteen pakettien kaappaamisen.
Bettercapin käyttömahdollisuudet verkkoliikenteen kartoittamisessa ja kaappaamisessa ovat laajat, aina yksinkertaisesta verkon kartoituksesta sertifikaattien automaattiseen väärentämiseen ja verkkosivujen salatun liikenteen huomaamattomaan kaappaamiseen asti.
Lisätietoa Bettercapistä löytyy projektin GitHub-sivulla: https://github.com/bettercap/bettercap

## Skenaario
### Oletukset
Testauksemme oletti seuraavaa alkutilanteesta:
* Hyökkääjällä on pääsy kohdeverkkoon
* Kohdehenkilöt eivät suhtaudu vainoharhaisesti tietoturvaan
* Verkonvalvontaa tai virustorjuntaa ei tässä yhteydessä huomioida

### Välimieshyökkäys (kevyt)
Tarkoituksenamme oli luoda tilanne, jossa yrityksen käyttäjien verkkoliikennettä kohtaan voidaan hyökätä niin, etteivät käyttäjät itse edes huomaa, että jokin on vialla. Luomassamme tilanteessa kohdeverkkoon asetetaan ARP-hyökkäystä ajava palvelin, joka ohjaa verkkoliikenteen kulkemaan itsensä kautta. Palvelin voidaan määrittää välittämään liikennettä esim. Bettercapin oman proxyn avulla. Tässä tilanteessa liikenne kulkee proxyn kautta muokkaamattomana, ja ainoastaan salaamatonta verkkoliikennettä voidaan lukea.

Kokeilimme välimieshyökkäyksen toteuttamista muutamalla eri kokoonpanolla, yhtä (omaa) maalikonetta vastaan. Tulokset olivat pääosin positiiviset:
* Noin 90% ajasta kohdekoneella ei ollut havaittavissa mitään erikoista tietoliikenteessä.
* Noin 10% ajasta kohdekoneella ei saanut lainkaan yhteyttä internetiin, pääosin huonosti määritettyjen proxy-asetusten takia.
* Salaamattomasta liikenteestä saatiin kaapattua suoraan ladatut verkkosivut, yksittäiset kuvatiedostot jne. 
* Salatusta liikenteestä saatiin tietoon yhteyden kohde, protokolla sekä sivulatausten tiheys.

### Välimieshyökkäys (korkeatasoisempi)
Aiempaa välimieshyökkäystä voidaan kehittää entisestään liittämällä mukaan salatun liikenteen purku. Bettercapin tarjoamalla SSLstrip-toiminnolla voidaan purkaa tätä salausta niin, että ladatut sivut käyttävät Bettercapin luomaa sertifikaattia alkuperäisen sisään. Tämän jälkeen liikenne puretaan Bettercap:ia ajavalla palvelimella, ja salataan uudelleen alkuperäisellä avaimella. Jotta tämä hyökkäys toimii käytännössä, vaaditaan Bettercapin root-sertifikaatin asentaminen kohdekoneen selaimeen (johon vaaditaan koodin ajamista kohdekoneessa, mutta kuitenkin vain käyttäjän oikeuksilla).

**Tässä tapauksessa hyökkäys etenee siis seuraavalla tavalla:**
* Kohdeverkossa toimii ARP-hyökkäystä ajava palvelin (joko sinne itse salaa asennettu tai olemassa olevasta koneesta saastutettu)
  * ARP-hyökkäyksen kautta saadaan selville verkossa olevien koneiden tietoja (IP-osoitteita, hostnameja, tietoliikennettä)
  * Kerättyjen tietojen perusteella voidaan tunnistaa yksittäisiä työntekijöitä (kiinnostuksen kohteet, profilointi vs. selaushistoria)
* Valitaan kohteeksi sopivia työntekijöitä, joiden vastuut ovat sopivan suuria ja tietotaso riittävän alhainen
  * Kohteet voidaan valita avoimesti saatavilla olevan tiedon (yrityksen kotisivut, työntekijän sosiaalinen media jne) sekä kerätyn selaushistorian perusteella
  * Kohteita vastaan voidaan hyökätä jollain keinolla, joka mahdollistaa oman koodin ajamisen tämän koneella (kuten sähköpostin liitetiedostot)
* Kun kohdekone on saastutettu Bettercapin haitallisella root-sertifikaatilla, voidaan purkaa salattua liikennettä lennosta

**Hyökkäyksen ongelmat:**
* Root-sertifikaatin asentaminen kohdekoneeseen vaatii jonkinasteista pääsyä. Vaikka tähän riittää saastuneen linkin tai liitetiedoston avaaminen, sulkee tämä silti suuren osan kohteista pois.
* Kaikilla nettisivuilla on tämän jälkeen saman yrityksen takaama sertifikaatti. Jos käyttäjä klikkailee usein sertifikaatin tietoja auki (tai käyttää selainta, joka näyttää sertifikaatin myöntäjän osoitepalkissa), alkaa tämä nopeasti epäilyttää.
* Sertifikaattien väärentämistä vastaan on kehitetty Certificate Pinning, jossa verkkosivun tiedoissa määritetään sertifikaatit, joilla sen liikenne saadaan salata. Testauksen perusteella suuret kansainväliset palvelut (Google, Facebook, Amazon) käyttävät tätä palvelua, kun taas suomalaisista palveluista suurimmatkaan (Yle, Helsingin Sanomat) eivät ole ottaneet sitä käyttöön. Certificate Pinningiä käyttävät sivustot huomaavat hyökkäyksen välittömästi, eivätkä toimi lainkaan.
