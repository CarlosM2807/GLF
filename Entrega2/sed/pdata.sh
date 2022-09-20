sed -e '/Valladolid/{
        s/.*Valladolid;//g
        s/;[0-9]*;[0-9]*\.[0-9]*\,.*$//
        w ../data/valladolid.dat
        }' -e '/León/{
        s/.*León;//g
        s/;[0-9]*;[0-9]*\.[0-9]*\,.*$//
        w ../data/león.dat
        }' -e '/Zamora/{
        s/.*Zamora;//g
        s/;[0-9]*;[0-9]*\.[0-9]*\,.*$//
        w ../data/zamora.dat
        }' -e '/Palencia/{
        s/.*Palencia;//g
        s/;[0-9]*;[0-9]*\.[0-9]*\,.*$//
        w ../data/palencia.dat
        }' -e '/Segovia/{
        s/.*Segovia;//g
        s/;[0-9]*;[0-9]*\.[0-9]*\,.*$//
        w ../data/segovia.dat
        }' -e '/Soria/{
        s/.*Soria;//g
        s/;[0-9]*;[0-9]*\.[0-9]*\,.*$//
        w ../data/soria.dat
        }' -e '/Burgos/{
        s/.*Burgos;//g
        s/;[0-9]*;[0-9]*\.[0-9]*\,.*$//
        w ../data/burgos.dat
        }' -e '/Ávila/{
        s/.*Ávila;//g
        s/;[0-9]*;[0-9]*\.[0-9]*\,.*$//
        w ../data/avila.dat
        }' -e '/Salamanca/{
        s/.*Salamanca;//g
        s/;[0-9]*;[0-9]*\.[0-9]*\,.*$//
        w ../data/salamanca.dat
        }' <../data/situacion-epidemiologica-coronavirus-en-castilla-y-leon.csv      

sed -i "1i\casos_confirmados; nuevos_positivos; altas; fallecimientos" ../data/valladolid.dat

sed -i "1i\casos_confirmados; nuevos_positivos; altas; fallecimientos" ../data/león.dat

sed -i "1i\casos_confirmados; nuevos_positivos; altas; fallecimientos" ../data/zamora.dat

sed -i "1i\casos_confirmados; nuevos_positivos; altas; fallecimientos" ../data/palencia.dat

sed -i "1i\casos_confirmados; nuevos_positivos; altas; fallecimientos" ../data/segovia.dat

sed -i "1i\casos_confirmados; nuevos_positivos; altas; fallecimientos" ../data/soria.dat

sed -i "1i\casos_confirmados; nuevos_positivos; altas; fallecimientos" ../data/burgos.dat

sed -i "1i\casos_confirmados; nuevos_positivos; altas; fallecimientos" ../data/avila.dat

sed -i "1i\casos_confirmados; nuevos_positivos; altas; fallecimientos" ../data/salamanca.dat

