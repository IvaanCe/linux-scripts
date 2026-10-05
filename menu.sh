#!/bin/bash

# Mostra el menú. No rep paràmetres.
mostrar_menu() {
    echo "=============================="
    echo "       MENÚ DE GESTIÓ"
    echo "=============================="
    echo "1. Afegir usuari"
    echo "2. Esborrar usuari"
    echo "3. Llistar usuaris"
    echo "4. Espai en disc"
    echo "5. Sortir"
}

# Afegeix un usuari al sistema.
# Paràmetre: $1 = nom de l'usuari
afegir_usuari() {
    local nom=$1
    sudo useradd -m "$nom"
    echo "Usuari $nom afegit"
}

# Esborra un usuari del sistema.
# Paràmetre: $1 = nom de l'usuari
esborrar_usuari() {
    local nom=$1
    sudo userdel -r "$nom"
    echo "Usuari $nom esborrat"
}

# Llista els usuaris que tenen carpeta a /home. No rep paràmetres.
llistar_usuaris() {
    local carpeta="/home"
    ls "$carpeta"
}

# Mostra l'espai en disc. No rep paràmetres.
espai_disc() {
    df -h
}

# ---------- MENÚ AMB PARÀMETRES ----------
# Exemples: ./menu.sh 1 pere   |   ./menu.sh -a pere   |   ./menu.sh --add pere

if [ $# -gt 0 ]; then
    case $1 in
        1|-a|--add)     afegir_usuari "$2" ;;
        2|-d|--delete)  esborrar_usuari "$2" ;;
        3|-l|--list)    llistar_usuaris ;;
        4|-s|--space)   espai_disc ;;
        *)              echo "Opció no vàlida" ;;
    esac
    exit
fi

# ---------- MENÚ INTERACTIU ----------

opcio=0
while [ "$opcio" != "5" ]; do
    mostrar_menu
    read -p "Tria una opció: " opcio

    case $opcio in
        1)
            read -p "Nom de l'usuari: " nom
            afegir_usuari "$nom"
            ;;
        2)
            read -p "Nom de l'usuari: " nom
            esborrar_usuari "$nom"
            ;;
        3) llistar_usuaris ;;
        4) espai_disc ;;
        5) echo "Sortint..." ;;
        *) echo "Opció no vàlida" ;;
    esac
done
