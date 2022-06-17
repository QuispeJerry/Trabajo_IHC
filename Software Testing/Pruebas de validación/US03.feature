Feature: Asignacion de orden de desembarco de contenedor

    Scenario: Seleccion de dia en calendario
        Given el supervisor inicio sesion en la aplicacion
        And se encuentra en la pantalla 'Task'
        When selecciona la opcion 'Asignar orden'
        Then el usuario visualiza la pantalla 'Calendario'
        And selecciona una fecha habilitada
    
    Example:
    |Asignar orden|Seleccionar fecha habilitada|

    |Seleccionar fecha habilitada|26/11/2022|

    Scenario: Asignación de orden de desembarco de contenedor
        Given el supervisor selecciono un fecha habilitada
        And visualiza la pantalla 'Details'
        And el sistema muestra la lista de contenedores que llegaran en el dia
        When selecciona 'Contenedor N°XXX'
        Then el sistema muestra Codigo del contenedor, Hora de llegada programada
        And y el usuario selecciona el boton 'Enviar orden'

    Example:
    |Seleccionar fecha habilitada|Lista de contenedores|Container|Codigo del contenedor|Hora de llegada programada|Enviar orden|

    |Seleccionar fecha habilitada|26/11/2022|
    |Lista de contenedores|"Contenedor 1, Contenedor 2, Contenedor 3 ..."|
    |Contenedor|"Contenedor 2"|
    |Codigo del contenedor|INC0000025684|
    |Hora de llegada programada|10:35 am|
