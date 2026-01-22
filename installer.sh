#!/bin/bash

read -p "Podaj absolutną ścieżkę instalacji (np. /home/student/bin): " INSTALL_DIR

if [[ ! -d "$INSTALL_DIR" ]]; then
    echo "BŁĄD: katalog nie istnieje"
    exit 1
fi

if [[ ! -w "$INSTALL_DIR" ]]; then
    echo "BŁĄD: brak praw zapisu do katalogu"
    exit 1
fi

gcc -Wall -Wextra -o normalize normalize.c
if [[ $? -ne 0 ]]; then
    echo "BŁĄD: kompilacja nie powiodła się"
    exit 1
fi

mv normalize "$INSTALL_DIR/"
if [[ $? -ne 0 ]]; then
    echo "BŁĄD: nie udało się przenieść pliku"
    exit 1
fi

echo
echo "Instalacja zakończona sukcesem."
echo "Dodaj poniższą linię do ~/.bashrc lub wklej do terminala:"
echo "export PATH=\$PATH:$INSTALL_DIR"
