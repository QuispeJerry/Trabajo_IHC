
Feature: Registro de productos

    Scenario: Seleccion de dia en calendario
        Given el operador inicio sesion en la aplicacion
        And se encuentra en la pantalla 'Calendario'
        When selecciona una 'fecha habilitada'
        Then el sistema muestra la pantalla 'Details'
        And el sistema muestra la lista de contenedores habilitados a registrar
    
    Example:
    |Fecha habilitada|Lista de contenedores habilitados|

    |Fecha habilitada|26/11/2022|
    |Lista de contenedores|"Contenedor 1, Contenedor 2, Contenedor 3 ..."|

    Scenario: Seleccion de contenedor disponible
        Given el supervisor visualiza la pantalla 'Details'
        When selecciona un contenedor disponible
        Then se despliega informacion del contenedor, Codigo de contenedor y Horario de llegada
        And se visualiza el boton Registro y Exportar
    
    Examples:
    |Contenedor|Codigo de contenedor|Horario de llegada|Registro|Exportar|

    |Contenedor|"Contenedor 2"|
    |Codigo de contenedor|8 410100 025155|
    |Hora de llegada |10:35 am|
