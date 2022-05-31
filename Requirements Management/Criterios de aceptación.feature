Feature: Gestion de perfiles

    Scenario: Iniciar sesion
        Given el que el supervisor/operador se encuentra afiliado al aplicativo
        And se enucentra en la pantalla 'Login'
        When  haya completado los campos 'Usuario' y 'contraseña'
        Then podrá presionar el botón 'Sing in'
        And tendrá acceso a la página 'Home'
    
    Scenario: Supervisor/Operario olvido su contraseña
        Given el supervisor/operario se encuentra afiliado al aplicativo
        And se ha olvidado la 'contraseña'
        And se encuentre en la pantalla 'Iniciar sesion'
        When haya presionado el boton 'Olvide mi contraseña'
        Then el sistema enviara al supervisor/operario a la pantalla 'Verificar cuenta'

    Scenario: Verificar cuenta
        Given el supervisor/operario se encuentra en la pantalla 'Verificar cuenta'
        And complete el campo 'Correo'
        When presione el boton 'Aceptar'
        Then el sistema le enviara un correo para la identificacion
    
    Scenario: Reestablecer contraseña
        Given el supervisor/operario se encuentra en la pantalla 'Reestablecer contraseña'
        And se ha identificado
        And ha completado los campos de 'Contraseña' y 'Verificar contraseña'
        When haya presionado el boton 'Reestablecer'
        Then el sistema actualiza la contraseña
        And notifica que se reestablecio correctamente la contraseña
    
Feature: Asignacion de orden de desembarco de contenedor

    Scenario: Seleccion de dia en calendario
        Given el supervisor inicio sesion en la aplicacion
        And se encuentra en la pantalla 'Task'
        When selecciona la opcion 'Asignar orden'
        Then el usuario visualiza la pantalla 'Calendario'
        And selecciona una fecha habilitada

    Scenario: Asignación de orden de desembarco de contenedor
        Given el supervisor selecciono un fecha habilitada
        And visualiza la pantalla 'Details'
        And el sistema muestra la lista de contenedores que llegaran en el dia
        When selecciona 'Container N°XXX'
        Then el sistema muestra Codigo de contenedo, Hora de llegada programada
        And y el usuario selecciona el boton 'Enviar orden'

    Scenario: Visualizacion de los contenedores en el mapa
        Given el supervisor selecciono una fecha habilitada
        And visualiza la pantalla 'Details'
        And el sistema muestra la lista de contenedores que llegaran en el dia
        And el boton 'Tracking'
        When selecciona el boton 'Tracking'
        Then el sistema muestra la pantalla 'Maps'
        And el supervisor visualiza la ubicacion de los contenedores del dia en tiempo real
    
    Scenario: Informacion de contacto del transportista
        Given el supervisor visualiza la pantalla 'Maps'
        When selecciona el icono del 'Container N°XXX' en el mapa
        Then el sistema muestra la informacion de contacto del conductor (Nombres y apellidos, numero telefonico)

Feature: Reporte de productos defectuosos

    Scenario: Seleccion de día en calendario 
        Given el supervisor inicio sesion en la aplicacion
        And se encuentra en la pantalla 'Task'
        When selecciona la opcion 'Reportes'
        Then el usuario visualiza la pantalla 'Calendario'
        And selecciona una 'fecha habilitada'
        And selecciona la opcion 'Productos defectuosos'
    
    Scenario: Envio de reporte de productos defectuosos
        Given el supervisor selecciona una fecha habilitada
        And selecciono la opcion Productos defectuosos
        When selecciona el icono del 'Container N°XXX' en el mapa
        Then el sistemamuestra los detalles del producto defectuoso: ID del operador, Numero de contenedor, Nombre del suspevisor
        , Codigo del supervisor, Codigo de proveedor y Evidencia audiovisual
        And el supervisor presiona el boton 'Enviar Reporte'
    

Feature: Registro de productos

    Scenario: Seleccion de dia en calendario
        Given el operador inicio sesion en la aplicacion
        And se encuentra en la pantalla 'Calendario'
        When selecciona una 'fecha habilitada'
        Then el sistema muestra la pantalla 'Details'
        And el sistema muestra la lista de contenedores habilitados a registrar
    
    Scenario: Seleccion de contenedor disponible
        Given el supervisor visualiza la pantalla 'Details'
        When selecciona un contenedor disponible
        Then se despliega informacion del contenedor, Codigo de contenedor y Horario de llegada
        And se visualiza el boton Registro y Exportar
    
    Scenario: Registro de contenedor seleccionado
        Given el operador presiono el boton 'Registro'
        And se encuentra en la pantalla 'Registro de contenedor'
        And el sistema muestra los detalles a registrar Hora de llegada, Numero de rampa y Envidencia audiovisual
        When selecciona el boton 'Guardar', se  registra la hora 
        And completa el campo 'Numero de rampa'
        Then el sistema registra los detalles ingresados
    
    Scenario: Registro de evidencia audiovisual del contenedor
        Given el supervisor visualiza la pantalla Registro del contenedor
        When selecciona el icono de camara
        Then la aplicacion abre la camara del dispositivo movil
        And el usuario captura las evidencias necesarias

    Scenario: Registro de producto
        Given el operario presiono el boton 'Registrar Producto'
        And se encuentra en la pantalla 'Registro de producto'
        When el operario aporxima el escaner al codigo de barra del producto
        Then la aplicacion muestra el codigo del producto escaneado en la pantalla 
        And presiona el boton 'Registras'

    Scenario: Registro de producto defectuoso
        Given el operario verifica que el producto se encuentra en estado defectuoso
        And escanea el codigo del producto
        When presiona el checkbox de 'Estado defectuoso'
        Then la aplicacion habilitado el icono de camara y video
        And el usuario captura las evidencias necesarias para justificar el estado del producto
        And el usuario presiona el boton 'Registrar'

    Scenario: Finalizacion de registro de productos
        Given el operario termino de registrar los productos 
        When presiona el boton 'Finalizar registro'
        When la aplicacion abre la camara del dispositivo movil
        And el usuario captura la evidencias necesarias 
        And muestra una pantalla con el mensaje confirmacion y la hora exacta
    
    Scenario: Finalizacion de registro de productos
        Given el operario termino de registrar los productos 
        When presiona el boton 'Finalizar registro'
        When la aplicacion muestra la pantalla de verificacion
        And presiona el boton Si
        And el sistema muestra el mensaje de confirmacion y al hora de finalizacion del proceso
    
    Scenario: Exportar el registro del contenedor
        Given el sistema mostro el mensaje de confirmacion y la hora de finalizacion del proceso
        And el operario visualiza la pantalla 'Details'
        When presiona el boton Exportar
        Then la aplicacion envia el reporte a la base de datos

Feature: Afiliar operarios
    
    Scenario: Finalizacion de registro de productos
        Given el supervisor se encuentra en la pantalla Task
        When presiona el boton 'Afiliar'
        Then la aplicacion muestra la pantalla Afiliar
        And el supervisor completa los campos Nombres, Apellidos, Fecha de Nacimiento , DNI, Correo electronico
        And presiona el boton Afiliar