# Fontana Rivet MIN1 TP1

## 1.1

On à modifié le octets 5 et 6 de l'image pour afficher une ligne complète.

## 1.2

La lecture des octets est inversée, on lis de gauche à droite au lieux de droite à gauche. Il faut donc aussi pensé à inverser lors de la conversion binaire vers hexadécimal. C'est parce que c'est en Big Endian et pas en Little Endian.

```
1110 0011 0101 0000
```

## 2.1

C'est du code machine en binaire qui n'est pas compris par des lecteurs texte.

## 2.2

Il y a 16 octets par lignes. On peut donc coder 4 mots de 32 bits.

La chaîne "charlot" est rangée à l'adresse `0x0000007c`

On remarque qu'il y a les valeurs mais qu'il n'y à pas le nom des variables.

## 2.3

333 n'est pas paire c'est pour ça qu'il faut faire 332+1.

Le nombre `0x14d` représente 333 en assembleur x86_64. L'affectation de la variable se fait en une seul fois contrairement à l'assembleur ARM.

## 3

```
ADD r10, r2, #10
ADD r10, r2, #17
ADDS r10, r2, #10
ADD r10, r2, r3
```

```
e282a00a
e282a011
e292a00a
e082a003
```

## 4

La ligne horizontal est jaune et la ligne verticale est rouge.

La différence de couleur est visible quand les bits de poids forts sont changés.

Les `a` et les `s` sont des nom de variables muettes donc cela n'affecte pas le programme.
















