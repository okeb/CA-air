# Créez un programme qui décale tous les éléments d’un tableau vers la gauche.
# Le premier élément devient le dernier à chaque rotation.


# LES FONCTIONS
# -------------
def ma_rotation(list)
  sorted_list = []
  longueur = list.length - 1
  (0..longueur).each do |i|
    if i != longueur + 1
      sorted_list[(i - 1) % (longueur + 1)] = list[i]
    end
  end
  sorted_list
end
# -------------


# LES ERREURS
# -------------
if ARGV.length < 1
  puts 'erreur'
  exit
end
# -------------


# LES DATA
# -------------
list = ARGV
# -------------

# LA RESOLUTION
# -------------
result = ma_rotation(list)
# -------------


# RESULTAT(S)
# -------------
puts result.join ', '
# -------------
