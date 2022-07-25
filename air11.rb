# Afficher un escalier constitué d’un caractère et d’un nombre d’étages donné en paramètre.


# LES FONCTIONS
# -------------
def is_numeric char
  char.match(/\A[+-]?\d+?(_?\d+)*(\.\d+e?\d*)?\Z/) != nil
end

def make_a_pyramid(term, n)
  nbr_space = 0
  nbr_term = 0
  (0..(n.to_i - 1)).each do |i|
    line = ''
    nbr_term = i
    nbr_space = n.to_i - i
    if nbr_space > 0
      line += ' ' * nbr_space
    end
    if nbr_term > 0
      line += term * nbr_term
    end
    line += term
    if nbr_term > 0
      line += term * nbr_term
    end
    puts line
  end
end
# -------------


# LES ERREURS
# -------------
if ARGV.length != 2
  puts 'erreur'
  exit
end

unless is_numeric ARGV[1]
  puts 'erreur'
  exit
end
# -------------


# LES DATA
# -------------
term = ARGV[0]
n = ARGV[1]
# -------------

# LA RESOLUTION
# -------------
# -------------


# RESULTAT(S)
# -------------
make_a_pyramid(term, n)
# -------------
