sed -n  '/Valladolid/{
        s/;[[:alpha:]][[:alpha:]]*;/-/
        s/;[[:digit:]]*;[[:digit:]]*$//
        w ../data/ejercicio3.csv
        }' <../data/poblacion_municipios_ine_2019.csv

sed -i "1i\CodigoProvincia-CodigoMunicipio;NombreMunicipio;Población" ../data/ejercicio3.csv

