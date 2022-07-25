# Créez un programme qui ajoute à une liste d’entiers triée un nouvel entier tout en gardant la
# liste triée dans l’ordre croissant. Le dernier argument est l’élément à ajouter.


# LES FONCTIONS
# -------------

def is_numeric char
  char.match(/\A[+-]?\d+?(_?\d+)*(\.\d+e?\d*)?\Z/) != nil
end
def sorted_insert(tableau, new_elem)
  sorted_table = []
  is_add = false
  (0..(tableau.length - 1)).each do |i|
    if !is_add && i != (tableau.length - 1)
      if new_elem.to_i <= tableau[i].to_i
        sorted_table.append(new_elem)
        is_add = true
      end
      sorted_table.append(tableau[i])
    elsif i == (tableau.length - 1)
      if new_elem.to_i >= tableau[i].to_i
        sorted_table.append(tableau[i])
        sorted_table.append(new_elem)
      else
        sorted_table.append(new_elem)
        sorted_table.append(tableau[i])
      end
    else
      sorted_table.append(tableau[i])
    end
  end
  sorted_table
end
# -------------


# LES ERREURS
# -------------
if ARGV.length < 2
  puts 'erreur'
  exit
end

(0..(ARGV.length - 1)).each do |i|
  unless is_numeric ARGV[i]
    puts 'erreur'
    exit
  end
end
# -------------


# LES DATA
# -------------
new_elem = ARGV.pop
tableau = ARGV
# -------------

# LA RESOLUTION
# -------------
result = sorted_insert(tableau, new_elem)
# -------------


# RESULTAT(S)
# -------------
puts result.join ' '
# -------------
