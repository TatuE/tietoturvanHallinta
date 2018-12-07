# Testausraportti: Sertifikaattipalvelimeen kohdistuva palvelunestohyökkäys
## Teoria
Eräänä keinona sertifikaattijärjestelmän häirintään nousi esiin sertifikaattipalvelimeen (Certificate Authority, CA) kohdistuva palvelunestohyökkäys (Distributed Denial of Service, DDoS). Tässä tarkoituksena on häiritä sertifikaatteja vahvistaneen juuripalvelimen toimintaa niin paljon, että sen toiminta hidastuu huomattavasti tai jopa estyy kokonaan. Tämä johtaisi tilanteeseen, jossa OCSP-viestit eivät koskaan saa vastausta (ja näin ollen johtavat virheeseen), eikä uusia sertifikaatteja voida myöntää tai vanhoja muokata.

Tällaiseen lopputulokseen johtavan hyökkäyksen toteuttaminen lienee vaikeaa, muttei missään tapauksessa mahdotonta. Yleisimmät sertifikaatteja myöntävät tahot ovat varmasti suojanneet palvelunsa tällaista hyökkäystä vastaan, mutta esimerkiksi pienen organisaation sisäistä CA-palvelinta vastaan hyökkääminen saattaisi hyvinkin olla mahdollista.

## Käytäntö
Vaikka CA:ta vastaan kohdistuva DDoS-hyökkäys on periaattessa helppo käsittää ja toteuttaa, kohtasimme tässä kohtaa totuuden tietoturvatutkimuksen rajoista: lainsäädäntö rajoittaa erittäin tarkasti mahdollisuuksia. Käytännössä ainoa laillinen tapa tämän teorian testaukseen olisi ollut kokonaan oman infrastruktuurin pystyttäminen. Periaatteessa projektin aikana kerrytetyt tiedot CA-palvelinten ja sertifikaattijärjestelmien toiminnasta riittivätkin kyseisenlaisen ratkaisun hahmottamiseen, ei sen toteuttaminen käytännössä ollut kuitenkaan sen vaatiman ajan, vaivan ja riskin arvoista. 

## Lopputulos
Sertifikaattipalvelimeen kohdistuva palvelunestohyökkäys vahingoittaisi kyseisen palvelun käyttäjiä hetkellisesti, mutta vaatisi valtavan määrän resursseja ja olisi lainsäädännölliseltä kannalta erittäin riskialtista.
