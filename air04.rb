# Créez un programme qui affiche une chaîne de caractères en évitant les caractères identiques adjacents.

# LES FONCTIONS
# -------------
def remove_double(char)
  the_sentence = char[0]
  (0..(char.length - 2)).each do |i|
    if char[i] != char[i + 1]
      the_sentence += char[i + 1]
    end
  end
  the_sentence
end
# -------------


# LES ERREURS
# -------------
if ARGV.length != 1
  puts 'erreur'
  exit
end
# -------------


# LES DATA
# -------------
char = ARGV[0]
# -------------

# LA RESOLUTION
# -------------
result = remove_double(char)
# -------------


# RESULTAT(S)
# -------------
puts result
# -------------
