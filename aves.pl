% Hechos sobre aves mexicanas
ave(aguila_real).
ave(quetzal).
ave(colibri).
ave(guacamaya_roja).
ave(tucan).
ave(halcon_peregrino).
ave(pavo_ocelado).
ave(cotorra_azteca).
ave(caracara_quirquincho).
ave(chachalaca).
ave(gorrion_montesino).
ave(tortola_alisera).
ave(tordo_ojirrojo).
ave(ocellated_quail).
ave(puerto_rico_screech_owl).
ave(sinaloa_martin).
ave(coa).
ave(talancate).
ave(pato_cuchara).
ave(gallina_de_guinea).

% Relación de aves mexicanas con su tamaño
tamano(aguila_real, grande).
tamano(quetzal, pequeno).
tamano(colibri, pequeno).
tamano(guacamaya_roja, grande).
tamano(tucan, mediano).
tamano(halcon_peregrino, mediano).
tamano(pavo_ocelado, grande).
tamano(cotorra_azteca, mediano).
tamano(caracara_quirquincho, mediano).
tamano(chachalaca, mediano).
tamano(gorrion_montesino, pequeno).
tamano(tortola_alisera, pequeno).
tamano(tordo_ojirrojo, mediano).
tamano(ocellated_quail, pequeno).
tamano(puerto_rico_screech_owl, pequeno).
tamano(sinaloa_martin, pequeno).
tamano(coa, mediano).
tamano(talancate, pequeno).
tamano(pato_cuchara, mediano).
tamano(gallina_de_guinea, grande).

% Relación de aves mexicanas con su hábitat y población
habitat(aguila_real, montanas).
habitat(quetzal, selva_nublada).
habitat(colibri, bosque_humedo).
habitat(guacamaya_roja, selva_tropical).
habitat(tucan, selva_humeda).
habitat(halcon_peregrino, praderas).
habitat(pavo_ocelado, selva_humeda).
habitat(cotorra_azteca, selva_seca).
habitat(caracara_quirquincho, bosque_seco).
habitat(chachalaca, selva_tropical).
habitat(gorrion_montesino, montanas).
habitat(tortola_alisera, selva_seca).
habitat(tordo_ojirrojo, bosque_lluvioso).
habitat(ocellated_quail, praderas).
habitat(puerto_rico_screech_owl, selva_seca).
habitat(sinaloa_martin, bosque_humedo).
habitat(coa, selva_humeda).
habitat(talancate, manglar).
habitat(pato_cuchara, lago).
habitat(gallina_de_guinea, granjas).

% Relación de hábitats con los estados de México
lugar_de_estado(montanas, oaxaca).
lugar_de_estado(selva_nublada, veracruz).
lugar_de_estado(bosque_humedo, yucatan).
lugar_de_estado(selva_tropical, chiapas).
lugar_de_estado(selva_humeda, tabasco).
lugar_de_estado(praderas, tabasco).
lugar_de_estado(selva_seca, oaxaca).
lugar_de_estado(bosque_seco, oaxaca).
lugar_de_estado(bosque_lluvioso, chiapas).
lugar_de_estado(manglar, veracruz).
lugar_de_estado(lago, chiapas).
lugar_de_estado(granjas, puebla).

% Relación de aves mexicanas con su población
poblacion(aguila_real, 4000).
poblacion(quetzal, 5000).
poblacion(colibri, 12000).
poblacion(guacamaya_roja, 2000).
poblacion(tucan, 9000).
poblacion(halcon_peregrino, 3000).
poblacion(pavo_ocelado, 8000).
poblacion(cotorra_azteca, 10000).
poblacion(caracara_quirquincho, 7000).
poblacion(chachalaca, 6000).
poblacion(gorrion_montesino, 5000).
poblacion(tortola_alisera, 4000).
poblacion(tordo_ojirrojo, 10000).
poblacion(ocellated_quail, 15000).
poblacion(puerto_rico_screech_owl, 8000).
poblacion(sinaloa_martin, 6000).
poblacion(coa, 9000).
poblacion(talancate, 7000).
poblacion(pato_cuchara, 12000).
poblacion(gallina_de_guinea, 5000).

% Relación de aves mexicanas con su alimentación
alimentacion(aguila_real, pequenos_mamiferos).
alimentacion(quetzal, insectos).
alimentacion(colibri, nectar).
alimentacion(guacamaya_roja, frutas).
alimentacion(tucan, frutas).
alimentacion(halcon_peregrino, pequenos_mamiferos).
alimentacion(pavo_ocelado, semillas).
alimentacion(cotorra_azteca, semillas).
alimentacion(caracara_quirquincho, carroña).
alimentacion(chachalaca, frutas).
alimentacion(gorrion_montesino, insectos).
alimentacion(tortola_alisera, semillas).
alimentacion(tordo_ojirrojo, insectos).
alimentacion(ocellated_quail, semillas).
alimentacion(puerto_rico_screech_owl, insectos).
alimentacion(sinaloa_martin, insectos).
alimentacion(coa, frutas).
alimentacion(talancate, peces).
alimentacion(pato_cuchara, plantas_acuaticas).
alimentacion(gallina_de_guinea, granos).




% Relación de aves mexicanas con su estatus de conservación
en_peligro_extincion(Ave) :-
    poblacion(Ave, Poblacion),
    (poblacion_critica(Ave, Poblacion) ; poblacion_baja(Ave, Poblacion)).

poblacion_critica(_Ave, Poblacion) :-
    Poblacion < 1000.

poblacion_baja(_Ave, Poblacion) :-
    Poblacion >= 1000,
    Poblacion < 6000.

% Regla para determinar si un ave es de un estado específico de México
ave_de_estado(Ave, Estado) :-
    habitat(Ave, Habitat),
    lugar_de_estado(Habitat, Estado).


% Regla para obtener información detallada de un ave
info(Ave, Tamano, Habitat, Poblacion, Alimentacion) :-
    tamano(Ave, Tamano),
    habitat(Ave, Habitat),
    poblacion(Ave, Poblacion),
    alimentacion(Ave, Alimentacion).

datos_ave(Ave, Tam, Habitat, Estado, Poblacion, Alimentos) :- tamano(Ave, Tam), habitat(Ave, Habitat), lugar_de_estado(Habitat, Estado), poblacion(Ave, Poblacion), alimentacion(Ave, Alimentos).



estado_mexicano(veracruz).
estado_mexicano(yucatan).
estado_mexicano(oaxaca).
estado_mexicano(chiapas).
estado_mexicano(tabasco).