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
  last_idx = tableau.length - 1
  (0..last_idx).each do |i|
    current_elem = tableau[i]
    if !is_add
      if current_elem.to_i >= new_elem.to_i
        sorted_table.append(new_elem)
        is_add = true
        sorted_table.append(current_elem)
      else
        if i == last_idx
          sorted_table.append(current_elem)
          sorted_table.append(new_elem)
          is_add = true
        else
          sorted_table.append(current_elem)
        end
      end
    else
      sorted_table.append(current_elem)
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
