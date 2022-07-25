# Créez un programme qui transforme un tableau de chaînes de caractères en une seule chaîne
# de caractères. Espacés d’un séparateur donné en dernier argument au programme.

# LES FONCTIONS
# -------------
def concat(list, separator)
  final_list = ''
  (0..(list.length - 2)).each do |i|
      if i != (list.length - 2)
        final_list += list[i] + separator
      else
        final_list += list[i]
      end
  end
  final_list
end
# -------------


# LES ERREURS
# -------------
if ARGV.length < 2
  puts 'error'
  exit
end
# -------------


# LES DATA
# -------------
char = ARGV
separator = ARGV[-1]
# -------------

# LA RESOLUTION
# -------------
list = concat(char, separator)
# -------------


# RESULTAT(S)
# -------------
puts list
# -------------
