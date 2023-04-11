.data


.text
   # afficher l’entier 2
ori $2, $0, 1 # mettre 1 dans $2
ori $4, $0, 2 # mettre l’entier àafficher dans $4
syscall # demande d’appel système
  # terminer le programme
