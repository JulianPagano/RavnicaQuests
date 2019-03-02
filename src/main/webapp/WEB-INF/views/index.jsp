<!doctype html>
<html lang="es">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Small web-app to generate random DnD quests in the Ravnica setting">
    <meta name="author" content="Julian Pagano">
  
    <title>Ravnica Quests</title>
  
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  
    <style type="text/css">
    
      /* Animacion del loader */
      .loader {
          border: 16px solid #f3f3f3; /* Light grey */
          border-top: 16px solid #3498db; /* Blue */
          border-radius: 50%;
          width: 100px;
          height: 100px;
          animation: spin 2s linear infinite;
          position: absolute;
        left: 0;
        top: 0;
        right: 0;
        bottom: 0;
        margin: auto;
      }
      
      .tiny-loader {
          border: 4px solid #f3f3f3; /* Light grey */
          border-top: 4px solid #3498db; /* Blue */
          border-radius: 50%;
          width: 20px;
          height: 20px;
          animation: spin 2s linear infinite;
          position: absolute;
        left: 0;
        top: 0;
        right: 0;
        bottom: 0;
        margin: auto;
      }
      
      @keyframes spin {
          0% { transform: rotate(0deg); }
          100% { transform: rotate(360deg); }
      }
      /* FIN Animacion del loader */
    
    </style>

  </head>
  
  <body>
  
    <!-- Page Content -->
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h1 class="mt-5" id="start-quest-button"><button type="button" class="btn btn-primary btn-lg btn-block">Start your adventure!</button></h1>
          <div class="loader" id="loader" style="display:none"></div>
          <h1 class="mt-5" id="quest-title" style="display:none">The lost treasure of The Orzhov</button></h1>
          <p class="lead" id="quest-text" style="display:none"></p>
        </div>
      </div>
    </div>

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
    <script type="text/javascript">

      $(document)
        /* Esconder el loader animado al completar la consulta Ajax */
        .on({
            ajaxStop: function() {
              $('#loader').hide();
            }
        });

      $('#start-quest-button')
        .on('click', function(event) {
          event.preventDefault(); // To prevent following the link (optional)
          startQuest();
        });

      function startQuest() {
        
        $('#start-quest-button').hide();
        $('#loader').fadeOut('fast');
        
        var request = $.ajax({
          type : "POST",
          url : "${home}startQuest",
          success : function(response) {
            console.log("SUCCESS: ", response);
            $("#quest-text").text(response);
            $('#quest-title').fadeIn('slow');
            $('#quest-text').fadeIn('slow');
          },
          error : function(e) {
            console.log("ERROR: ", e);
          },
          done : function(e) {
            console.log("DONE");
          }
        });
      }
    </script>
  
  </body>
</html>