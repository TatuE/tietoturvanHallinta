## GPG
https://www.linux.fi/wiki/GnuPG  
https://gnupg.org/faq/gnupg-faq.html  
https://thehackernews.com/2018/06/gnupg-encryption-signature.html  
https://devhints.io/gnupg (testaukseen)  
https://secushare.org/PGP  (PGP vikoja)  

## X509  
https://wiki.tut.fi/Tietoturva/X509,Varmennestandardi(2-A)  
https://en.wikipedia.org/wiki/X.509  
https://www.rfc-editor.org/rfc/pdfrfc/rfc5280.txt.pdf  

### OCSP
https://en.wikipedia.org/wiki/Online_Certificate_Status_Protocol  
https://tools.ietf.org/html/rfc6960

## PKI  
https://www.youtube.com/watch?v=5OqgYSXWYQM  
https://en.wikipedia.org/wiki/Public_key_infrastructure  
https://www.centero.fi/blogi/pki-for-dummies/  
https://www.entrustdatacard.com/pages/what-is-pki  
http://www.theseus.fi/bitstream/handle/10024/26659/ArtoPentikainenPKI.pdf?sequence=1&isAllowed=y

https://www.hack2secure.com/blogs/how-ssl-tls-protocol-utilizes-cryptography-and-pki  
https://www.feistyduck.com/ssl-tls-and-pki-history/

## Muuta
https://www.cl.cam.ac.uk/techreports/UCAM-CL-TR-817.pdf  
http://compsec.comp.nus.edu.sg/papers/AuthScan-NDSS13.pdf  
https://www.betterbuys.com/estimating-password-cracking-times/ (salauksen murtamisen kesto, kehitys vuosien aikana)  
<<<<<<< HEAD


## uusi lähetymistapa:

Eino = 

[4 fatal problems with PKI](https://www.csoonline.com/article/2942072/security/4-fatal-problems-with-pki.html) (2015)
1. Monimutkaisuus myötä, niin normaalien käyttäjien kuin myös adminien virheiden määrä kasvaa (hurja arvio, että vain 5% asennuksista täysin oikein ja turvallisesti)
2. Monet selaimet ja sovellukset toimivat PKI-virheistä huolimatta -> tarkoitus katoaa
3. Toimiva PKI ei takaa turvallisuutta -> käyttäjien huolimattomuus ja OWASP top10 kiertävän PKIn
4. Varastetut, nykyisellä kryptografialla suojatut tiedot tullaan saamaan auki tulevaisuudessa kryptoanalyysin (ja kvanttilaskennan) kehittyessä.
Suuri osa tiedosta jo varmasti vanhentunutta kun näin tapahtuu, mutta osa ei

[Assessing Weaknesses in Public Key Infrastructure](https://threatpost.com/assessing-weaknesses-in-public-key-infrastructure/128793/)
Vuodelta 2014, 150k malware näytteestä 325 oli allekirjoitettu validilla, perutulla tai vanhentuneella certillä.

-----------------------------------------------
Saku = 

[Ten Risks of PKI: What You're not Being Told about Public Key   
Infrastructure By Carl Ellison and Bruce Schneier](https://www.schneier.com/academic/paperfiles/paper-pki-ft.txt)  
Luin tämän ensin. Kuvaili ongelmakohtia PKI:ssa yleisellä tasolla. Ei juurikaan mennyt haavoittuvuuksista puhumiseen.
(Olikin sama, minkä minkä Tatu oli linkannut)  

[NAI Net Tools PKI Server vulnerabilities](https://www.secureauth.com/labs/advisories/nai-net-tools-pki-server-vulnerabilities) Jos ymmärsin oikein, niin tietyt PKI server -ohjelmistot sisältävät haavoittuvuuksia. Ilmeisesti aika vanha löytö  ja tuskin sellainen asia mitä halutaan testailla. Aiheesta ei hirveästi löytynyt materiaalia. [Exploit-db:ssä](https://www.exploit-db.com/exploits/20134/) käsiteltiin aihetta vähän. 

[In-house vs out-source PKI](https://techbeacon.com/managed-pki-certificates-securing-internet-things). Enimmäkseen yleistä tietoa PKI:sta. Käsittelee aihetta myös IoT:n kannalta ja mainitsee vaaihtoehtoisia ratkaisuja.

PKI serverit käyttävät ymmärtääkseni tuota LDAP protokollaa. Siihen löytyy ilmeisesti [hyökkäyksiä](http://projects.webappsec.org/w/page/13246947/LDAP%20Injection).

--------------------------------------------------------

Jussi =

[How Cybercrime Exploits Digital Certificates](https://resources.infosecinstitute.com/cybercrime-exploits-digital-certificates/)  
Pitkä ja kattava artikkeli, 20+ lähdettä aiheesta. **Tää on kova!**

[IETF X.509 SSL Certificate Signature Collision Vulnerability](https://social.technet.microsoft.com/Forums/windowsserver/en-US/b18610bb-02cf-471d-8d09-7724a75bd027/ietf-x509-ssl-certificate-signature-collision-vulnerability)  
Ihan hyvä incident report, sertifikaatti on vain yhtä turvallinen kuin sen salaukseen käytetty algoritmi. Sertifikaatin voi siis salata myös heikommalla algoritmillä kuin mitä standardi vaatii --> haavoittuvuus testaukseen?

[How to fix IETF X.509 Certificate Signature Collision Vulnerability in IHS?](https://developer.ibm.com/answers/questions/245843/how-to-fix-ietf-x509-certificate-signature-collisi/)  
Aika lailla samaa kuin edellisessä, mutta vähän tarkemmalla vastauksella.

[Why it’s harder to forge a SHA-1 certificate than it is to find a SHA-1 collision](https://blog.cloudflare.com/why-its-harder-to-forge-a-sha-1-certificate-than-it-is-to-find-a-sha-1-collision/)

[OpenSSL:n virallinen haavoittuvuuslista](https://www.openssl.org/news/vulnerabilities.html)

[Google: Security Keys Neutralized Employee Phishing](https://krebsonsecurity.com/2018/07/google-security-keys-neutralized-employee-phishing/)  
2FA:n helppo käyttöönotto yritysmaailmassa, hyvä esimerkki käyttömukavuudesta.

[Root CA:n lisäys Firefoxiin, etänä](https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS)  
Verkkoliikenteen kierrättäminen ulkoisen proxyn kautta ilman erroreita, välimieshyökkäys etänä.

--------------------------------------------------------
Tatu =

[The Problem with Multiple Roots in
Web Browsers - Certificate Masquerading](http://profsandhu.com/cs5323_s17/Hayes98.pdf)

Man in the middle attack scenario, hieman vanhempi dokkari mutta kokisin että käyttökelpoinen.

[The risk of PKI, Schneier](https://www.schneier.com/academic/paperfiles/paper-pki-ft.txt)

Ihan kiva kokoelma riskejä. Enemmän yleistä infoa, ei välttämättä sovellu suoraan testaukseen.

### HVLearn

SSL/TLS analyysiohjelma (mm. heikkouksia), mahdollisesti kokeilun 
arvoinen.

[github](https://github.com/HVLearn/HVLearn)
-- En saanut compilattua, ongelma Javan kanssa mitä en saanut ratkaistua --

Tutkielma aiheesta ja käytöstä

[HVLearn: Automated Black-box Analysis of Hostname Verification in 
SSL/TLS 
Implementations](https://www.computer.org/csdl/proceedings/sp/2017/5533/00/07958596.pdf)

Vaihtoehtoinen lähetymistapa SSL sertifikattien tutkimiseen, löytyy Kalista =

https://tools.kali.org/information-gathering/sslyze

http://chousensha.github.io/blog/2017/06/24/sslscan-kali-linux-tools/

[PKI = WoT vs CA](https://andrewgdotcom.wordpress.com/2014/11/13/wot-ca/)

https://security.stackexchange.com/questions/56389/ssl-certificate-framework-101-how-does-the-browser-actually-verify-the-validity

https://serverfault.com/questions/325253/when-are-ocsp-requests-sent-by-web-browsers

https://medium.com/@alexeysamoshkin/how-ssl-certificate-revocation-is-broken-in-practice-af3b63b9cb3
====
https://lists.gnupg.org/pipermail/gnupg-devel/2009-January/024757.html  (GPG vs x509)
>>>>>>> 50a35deb918c6866ed783f99faed1034491ba295
