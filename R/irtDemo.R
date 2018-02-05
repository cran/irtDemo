irtDemo <- function(text){
  demo <- switch(text,
                 dich    = 'DICH',
                 eapMap  = 'EAPMAP',
                 eapmap  = 'EAPMAP',
                 est2pl  = 'EST2PL',
                 est3pl  = 'EST3PL',
                 mle     = 'MLE',
                 mirt    = 'MIRT',
                 gpcm    = 'GPCM',
                 grm     = 'GRM',
                 grsm    = 'GRSM',
                 nrm     = 'NRM',
                 stop(paste("Enter one of the followings:
                            'mle', 'est2pl', 'est3pl', 'eapmap',
                            'dich', 'gpcm', 'grm', 'grsm', 'nrm', 'mirt' "))
                 )
  shiny::runApp(appDir = system.file(demo, package="irtDemo"))
}
