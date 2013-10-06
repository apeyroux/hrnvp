#Mini RNVP en Haskell

/!\ Projet just for fun du Samedi soir ! /!\

##Abstract

```
((HEADER NOM|SOCIETE|CHEZ...) (NUM (RUE|VOIE|BD...)) (CP (VILLE)(PAYS)))
```

##Exemple :

```
echo "Jean-Alexandre Dupond chez angel 88 rue des lapins 92320 chatillon" | ./myrnvp 
l1 :JEAN-ALEXANDRE DUPOND 
l2 : ANGEL 
l5 :88 RUE DES LAPINS 
l6 :92320 CHATILLON
```

```
echo "Jean-Alexandre Dupond 88 rue des lapins 92320 chatillon" | ./myrnvp 
l1 :JEAN-ALEXANDRE DUPOND 
l5 :88 RUE DES LAPINS 
l6 :92320 CHATILLON
```

```
https://rnvp.ifup.sh/Alex22%20rue%20des%20lapins%2075407%20Paris
```

Ce qui [donne](https://rnvp.ifup.sh/Alex22%20rue%20des%20lapins%2075407%20Paris)

##TODO 

- Passer en ByteString car là, c'est vraiment trop moche !
