# Créez un programme qui est capable de reconnaître et de faire une opération (addition ou soustraction)
# sur chaque entier d’une liste.

# LES FONCTIONS
# -------------
def make_operation(tableau, operation)
  new_tableau = []
  (0..(tableau.length - 2)).each do |i|
    if operation[0] == "+"
      new_tableau.append(tableau[i].to_i + operation[1].to_i)
    else
      new_tableau.append(tableau[i].to_i - operation[1].to_i)
    end
  end
  new_tableau
end
# -------------


# LES ERREURS
# -------------
if ARGV.length < 2 || (ARGV[-1][0] != '+' && ARGV[-1][0] != '-')
  puts 'erreur'
  exit
end
# -------------


# LES DATA
# -------------
tableau = ARGV
operation = ARGV[-1]
# -------------

# LA RESOLUTION
# -------------
result = make_operation(tableau, operation)
# -------------


# RESULTAT(S)
# -------------
puts result.join ' '
# -------------
