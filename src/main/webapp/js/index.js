
    $(document).ready(function(){
        HideLoader();
        
        $('DeleteUser').on('submit', function() {
            ShowLoader();
        });
        
        $('CreateUser').on('submit', function() {
            ShowLoader();
        });
        
        $('EditUser').on('submit', function() {
            ShowLoader();
        });

        // Oculta el loader y el fondo después de que la página se actualiza
        $(document).ajaxStop(function() {
            HideLoader();
        });
        
        $('[name="telefono"]').mask('9999-9999');
        $('[name="nie"]').mask('99999999-9');
    });
    
    function ShowLoader(){
        $('#overlay').show();
        $('#loader').show();
    }
    
    function HideLoader(){
        $('#overlay').hide();
        $('#loader').hide();
    }