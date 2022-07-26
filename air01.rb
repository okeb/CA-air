# Créez un programme qui découpe une chaîne de caractères en tableau
# en fonction du séparateur donné en 2e argument.

# LES FONCTIONS
# -------------
def my_func_split(char, separator)
  list = []
  final_list = []
  word = ''
  (0..(char.length - 1)).each do |i|
    if char[i] != ' '
      word += char[i]
    else
      list.append(word)
      word = ''
    end
  end
  list.append(word) unless word == ''
  elem = ''
  idx = 0
  (0..(list.length - 1)).each do |j|
    if list[j] != separator
      # elem += if ['', nil].include?(elem)
      #           list[j]
      #         else
      #           " #{list[j]}"
      #         end
      elem += "#{list[j]} "
    else
      final_list.append(elem)
      elem = ''
    end
  end
  final_list.append(' ' + elem[0..-2]) unless elem == ''
  final_list
end
# -------------


# LES ERREURS
# -------------
if ARGV.length != 2
  puts 'error'
  exit
end
# -------------


# LES DATA
# -------------
char = ARGV[0]
separator = ARGV[1]
# -------------

# LA RESOLUTION
# -------------
list = my_func_split(char, separator)
# -------------


# RESULTAT(S)
# -------------
puts list
# -------------
