# Créez un programme qui découpe une chaîne de caractères
# en tableau (séparateurs : espaces, tabulations, retours à la ligne).

# LES FONCTIONS
# -------------
def my_func_split(char, separator)
  list = []
  word = ''
  (0..(char.length - 1)).each do |i|
    if char[i] != separator
      word += char[i]
    else
      list.append(word)
      word = ''
    end
  end
  return list.append(word) unless word == ''
end
# -------------


# LES ERREURS
# -------------
if ARGV.length != 1
  puts 'error'
  exit
end
# -------------


# LES DATA
# -------------
char = ARGV[0]
# -------------

# LA RESOLUTION
# -------------
list = my_func_split(char, ' ')
# -------------


# RESULTAT(S)
# -------------
puts list
# -------------