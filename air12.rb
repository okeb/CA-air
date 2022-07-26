# Créez un programme qui trie une liste de nombres. Votre programme devra implémenter
# l’algorithme du tri rapide (QuickSort).


# LES FONCTIONS
# -------------
def is_numeric char
  char.match(/\A[+-]?\d+?(_?\d+)*(\.\d+e?\d*)?\Z/) != nil
end
def my_quick_sort(list)
  sorted_table = list
  puts "execution..."
  sorted_table
end
# -------------


# LES ERREURS
# -------------
if ARGV.length < 1
  puts 'erreur'
  exit
end

(0..(ARGV.length - 1)).each do |i|
  if !is_numeric(ARGV[i])
    puts 'erreur'
    exit
  end
end
# -------------


# LES DATA
# -------------
list = ARGV
# -------------

# LA RESOLUTION
# -------------
result = my_quick_sort(list)
# -------------


# RESULTAT(S)
# -------------
puts result.join ' '
# -------------
