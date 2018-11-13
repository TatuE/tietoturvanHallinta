## Esiasteinen ehdotus ohjeistuksen rakenteesta ##

1. Esipuhe
2. Mitä?
3. Miksi?
4. Julkisen avaimen kryptografia
5. Mikä on PKI?   
Jos kaksi tahoa (Alice & Bob) tuntevat omat yksityiset avaimensa ja toistensa julkiset avaimet, he voivat kommunikoida turvallisesti lukuisien julkiseen avaimeen pohjautuvien protokollien avulla. Näihin protokolliin lukeutuvat mm. IPSec, PGP ja SSL. Kysymys kuuluukin, että miten he tuntevat toisensa?  
PKI:n (Public Key Infrastructure) tarkoitus onkin luoda turvallinen, tehokas ja käytännöllinen tapa löytää julkisia avaimia. Nimensä mukaan kyseessä on infrastruktuuri, joka voi rakentua monilla eri tavoilla. Käytössä on lukuisia erilaisia malleja, jotka eroavat toisistaan turvallisuuden, skaalautuvuuden ja rakenteen mukaan. Tutustumme näihin erilaisiin malleihin hieman myöhemmin (kappaleessa X). Julkisen avaimen sertifikaateissa on olemassa standardeja, jotka pystyvät tukemaan erilaisten PKI-mallien vaatimuksia. Laajimmin käytetty näistä standardeista on **[X.509](https://en.wikipedia.org/wiki/X.509)**  
[[1](https://pdfs.semanticscholar.org/0fc4/0e88e1aec293ddfbbc5b82c3e294e8c0ed14.pdf)] 



6. Mikä on Web of Trust?
7. Mitä ongelmia niissä on?
8. Miten ne vertautuvat keskenään?

**Puheeksi tulleita asioita / ehdotuksia:**  
Liiketoiminnan jatkuvuuden turvaaminen  
Tarkistuslista  
 -Bios kello
Testaus
Yhteydenotto CRL hallintaan tarpeen mukaan (oma cert esim. vanhenee, otetaan yhteyttä ja saadaan oma certti taas kuntoon)

Lähteet:  
1. https://pdfs.semanticscholar.org/0fc4/0e88e1aec293ddfbbc5b82c3e294e8c0ed14.pdf
