# Créez un programme qui affiche le contenu d’un fichier donné en argument.


# LES FONCTIONS
# -------------
def read_the_file(file_name)
  if File.exists?(file_name)
    file_data = File.read(file_name)
  else
    puts 'erreur'
    exit
  end
  file_data
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
file_name = ARGV[0]
# -------------

# LA RESOLUTION
# -------------
result = read_the_file(file_name)
# -------------


# RESULTAT(S)
# -------------
puts result
# -------------
