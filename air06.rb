# Créez un programme qui supprime d’un tableau tous les éléments qui ne contiennent pas une autre chaîne de caractères.


# LES FONCTIONS
# -------------
def ctrl_pass_covid(les_gens, pass)
  les_vaccines = []
  (0..(les_gens.length - 1)).each do |i|
    unless les_gens[i].include?(pass)
      les_vaccines.append(les_gens[i])
    end
  end
  les_vaccines
end
# -------------


# LES ERREURS
# -------------
if ARGV.length < 2
  puts 'erreur'
  exit
end
# -------------


# LES DATA
# -------------
pass = ARGV.pop
les_gens = ARGV
# -------------

# LA RESOLUTION
# -------------
result = ctrl_pass_covid(les_gens, pass)
# -------------


# RESULTAT(S)
# -------------
puts result.join ', '
# -------------
