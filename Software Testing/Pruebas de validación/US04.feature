Feature: Visualizacion de la ubicación geográfica de los contenedores 

    Scenario: Visualizacion de los contenedores en el mapa
        Given el supervisor selecciono una <fecha_habilitada>
        And visualiza la pantalla 'Details'
        And el sistema muestra la <lista_de_contenedores> que llegaran en el dia
        And el boton 'Tracking'
        When selecciona el boton 'Tracking'
        Then el sistema muestra la pantalla 'Maps'
        And el supervisor visualiza la ubicacion de los contenedores del dia en tiempo real

    Example:
    |Fecha habilitada|Lista de contenedores|Tracking|Ubicacion de los contenedores del dia en tiempo real|

    |Fecha habilitada|26/11/2022|
    |Lista de contenedores|"Contenedor 1, Contenedor 2, Contenedor 3 ..."|
    |Ubicacion de los contenedores del dia en tiempo real|Mostrar en pantalla un mapa de seguimiento|

    Scenario: Informacion de contacto del transportista
        Given el supervisor visualiza la pantalla 'Maps'
        When selecciona el icono del 'Container NÂ°XXX' en el mapa
        Then el sistema muestra la informacion de contacto del conductor <Nombres_apellidos>, <numero_telefonico>

    Example:
    |Contenedor|Nombres y apellidos|Numero telefonico|

    |Contenedor|"Contenedor 2"|
    |Nombres y apellidos|"Marcos Andres Perez Humboldt"|
    |Numero telefonico|924658712|
