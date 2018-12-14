# WoT

## Tekstilinkkejä
* [GnuPG](https://gnupg.org/)
* [Web of Trust vs Certificate Authorities](https://andrewgdotcom.wordpress.com/2014/11/13/wot-ca/)
* [WoT wiki](https://en.wikipedia.org/wiki/Web_of_trust) (+references)

## Youtube (katso -lista)
* [A Pretty Good Introduction to Pretty Good Privacy](https://www.youtube.com/watch?v=Lq-yKJFHJpk) 53:21
* [PGP and the Web of Trust](https://www.youtube.com/watch?v=H5-lipH1KwQ) 7:52
* [Building a Web of Trust](https://www.youtube.com/watch?v=hxW_SaIN_J4) 15:05
* [NetworkSecurity - Web of Trust](https://www.youtube.com/watch?v=btm376sAG_U) 10:03

## Muistiinpanoja
* X509 käytetyn chain-of-trust (yksittäinen pitkä linja CA:lta palvelulle), nimensä mukaisesti muodostetaan allekirjoitusten verkosto
* jokainen käyttäjä toimii auktoriteettina
* luottamaus-suhde muodostetaan "henkilökohtaisesti" tunnettujen henkilöiden välillä 
* Chain-of-trustissa yhden linkin häiriö vaikuttaa koko ketjuun
	* Web of (chain of) Trustissa yhden linkin häiriö ei vaukuta koko ketjuun välttämättä millään tavalla, käytetään muita allekirjoitettuja ketjuja
	
![WoT](https://github.com/TatuE/tietoturvanHallinta/blob/master/documents/kuvat/WoT.jpg)
