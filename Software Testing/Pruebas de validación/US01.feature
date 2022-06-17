Feature: Gestion de perfiles

    Scenario: Iniciar sesion
        Given el que el supervisor/operador se encuentra afiliado al aplicativo
        And se encuentra en la pantalla 'Login'
        When  haya completado los campos 'Usuario' y 'contraseña'
        Then podrá presionar el botón 'Sing in'
        And tendrá acceso a la página 'Home'
    
    Example: 
    |Usuario|Contrasena|Login|Sing in|

    |Usuario|S20201A297|
    |Contraseña|45289022|
