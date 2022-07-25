# Créez un programme qui fusionne deux listes d’entiers triées en les gardant triées,
# les deux listes seront séparées par un “fusion”.


# LES FONCTIONS
# -------------
def is_numeric char
  char.match(/\A[+-]?\d+?(_?\d+)*(\.\d+e?\d*)?\Z/) != nil
end
def sorted_fusion(tabl1, tabl2)
  sorted_table = tabl1 + tabl2
  is_finished = true
  while is_finished
    is_finished = false
    (1..(sorted_table.length - 1)).each do |x|
      if sorted_table[x - 1].to_i > sorted_table[x].to_i
        c = sorted_table[x - 1].to_i
        sorted_table[x - 1] = sorted_table[x].to_i
        sorted_table[x] = c
        is_finished = true
      end
    end
  end
  sorted_table
end
# -------------


# LES ERREURS
# -------------
if ARGV.length < 3
  puts 'erreur'
  exit
end

if ARGV.index("fusion") != nil && (ARGV.index("fusion") == 0 || ARGV[-1] == 'fusion')
  puts 'erreur'
  exit
end

(0..(ARGV.length - 1)).each do |i|
  if !is_numeric(ARGV[i])  && (i != ARGV.index("fusion"))
    puts 'erreur'
    exit
  end
end
# -------------


# LES DATA
# -------------
tabl1 = []
tabl2 = []
indx_to_change = ARGV.index("fusion")
(0..(ARGV.length - 1)).each do |i|
  if i < indx_to_change
    tabl1.append(ARGV[i])
  end
  if i > indx_to_change
    tabl2.append(ARGV[i])
  end
end
# -------------

# LA RESOLUTION
# -------------
result = sorted_fusion(tabl1, tabl2)
# -------------


# RESULTAT(S)
# -------------
puts result.join ' '
# -------------
