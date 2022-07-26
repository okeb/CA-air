# Créez un programme qui est capable de reconnaître et de faire une opération (addition ou soustraction)
# sur chaque entier d’une liste.

# LES FONCTIONS
# -------------

def is_numeric char
  char.match(/\A[+-]?\d+?(_?\d+)*(\.\d+e?\d*)?\Z/) != nil
end
def make_operation(tableau, operator)
  new_tableau = []
  (0..(tableau.length - 2)).each do |i|
    if operator[0] == "+"
      new_tableau.append(tableau[i].to_i + operator[1].to_i)
    else
      new_tableau.append(tableau[i].to_i - operator[1].to_i)
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

(0..(ARGV.length - 1)).each do |x|
  unless is_numeric ARGV[x]
    puts 'erreur'
    exit
  end
end
# -------------


# LES DATA
# -------------
tableau = ARGV
operator = ARGV[-1]
# -------------

# LA RESOLUTION
# -------------
result = make_operation(tableau, operator)
# -------------


# RESULTAT(S)
# -------------
puts result.join ' '
# -------------
