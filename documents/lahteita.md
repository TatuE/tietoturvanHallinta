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

Tutkielma aiheesta ja käytöstä

[HVLearn: Automated Black-box Analysis of Hostname Verification in 
SSL/TLS 
Implementations](https://www.computer.org/csdl/proceedings/sp/2017/5533/00/07958596.pdf)






=======
https://lists.gnupg.org/pipermail/gnupg-devel/2009-January/024757.html  (GPG vs x509)
>>>>>>> 50a35deb918c6866ed783f99faed1034491ba295
