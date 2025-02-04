#!/bin/bash

# Comprobar si unoconv está instalado
if ! command -v unoconv &> /dev/null
then
    echo "unoconv no está instalado. ¿Desea instalarlo? (s/n)"
    read respuesta
    if [ "$respuesta" = "s" ]; then
        sudo apt-get install unoconv
    else
        echo "unoconv es necesario para convertir los archivos de Word a PDF. Por favor, instálalo e intenta de nuevo."
        exit 1
    fi
fi

# Convertir todos los archivos .docx en el directorio actual a PDF
for archivo in *.docx
do
    unoconv -f pdf "$archivo"
done

echo "La conversión de Word a PDF ha finalizado."

