## Mitä vielä puuttuu/tarvitsee tutkia
- PGP:n käyttö
- Web Of Trust
- WoT vs CA vertailu, mitkä hyödyt, haitat ja erot käytännössä.

## Projektin lopputulokset
### Testaus (Jussi & Tatu) 
- liiketoiminnan häiritseminen (verkkosivu pois käytöstä)
  - Palvelimen sisäisen kellon siirtäminen (Toimii ainakin Windows 7)
  - Liikenteen ohjaaminen Proxyn kautta? (sertifikaatti puuttuu).
  - varmenteen varmentamisen häiritseminen
  - varmenteen blacklistaus, onko mahdollista tehdä järkevösti (ei jää kiinni)?
  - CA DoS? Voisiko toimia varmenteen varmistamisen estämiseksi.     
- Laittoman / ei toivotun toiminnan naamioiminen 
  - varmenteen väärentäminen 
  - voiko laittomalla toiminalla olla validin CA:n myöntämä sertifikaatti? Kiinnostaako heitä?

### Ohjeistus (Saku & Eino) 
- Suunnattu perushenkilökunnalle, ei admineille tai asiantuntijoille 
  - Lisätään mukaan tarkistuslista ongelmista 
  - Tarkoitus olla helppolukuinen sekä ymmärrettävä (Ei niin kuin VAHTI...) 