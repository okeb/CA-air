# Créez un programme qui transforme un tableau de chaînes de caractères en une seule chaîne
# de caractères. Espacés d’un séparateur donné en dernier argument au programme.

# LES FONCTIONS
# -------------
def find_intruder(list)
  the_list = list
  while the_list.length >= 2
    elem_g = the_list[0]
    (1..(the_list.length - 1)).each do |x|
      elem_d = the_list[x]
      if elem_g == elem_d
        the_list.delete(elem_g)
        the_list.delete(elem_d)
      else
        x += 1
      end
    end
  end
  if the_list.length == 1
    instruder = the_list[0]
  else
    instruder = "erreur"
  end
  instruder
end
# -------------


# LES ERREURS
# -------------
if ARGV.length == 0
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
result = find_intruder(list)
# -------------


# RESULTAT(S)
# -------------
puts result
# -------------
