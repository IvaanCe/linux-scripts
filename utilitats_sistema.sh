#!/bin/bash

# Funció benvinguda
# Rep 1 paràmetre: el nom de l'alumne
benvinguda() {
    local nom="$1"
    echo "Hola $nom, anem a comprovar el sistema"
}

# Funció comprova_usuari
# Rep 1 paràmetre: el nom d'usuari a buscar
comprova_usuari() {
    local usuari="$1"
    if grep -q "^$usuari:" /etc/passwd; then
        echo "L'usuari $usuari existeix al sistema"
    else
        echo "L'usuari $usuari NO existeix al sistema"
    fi
}

# Funció calculadora_espai
# No rep cap paràmetre
calculadora_espai() {
    local particio="/"
    df -h "$particio"
}

# Lògica principal
read -p "Nom de l'alumne: " alumne
benvinguda "$alumne"

read -p "Nom d'usuari del sistema: " usuari
comprova_usuari "$usuari"

calculadora_espai
