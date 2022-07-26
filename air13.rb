# Créez un programme qui vérifie si les exercices de votre épreuve de l’air sont présents
# dans le répertoire et qu’ils fonctionnent (sauf celui là).
# Créez au moins un test pour chaque exercice.
require 'colorize'

# LES FONCTIONS
# -------------
def if_exist file_name
  return File.exists?(file_name)
end

def test_file(file_name, params, expected)
  result =  %x{ruby #{file_name} #{params}}
  return [result == expected, result.inspect, expected.inspect]
end

def test_exo(note_table, name_exo, data)
  the_return = ''
  expected = ''
  file_name = name_exo + '.rb'
  total_exo = data.length - 1
  (0..total_exo).each do |i|
    case data[i][0]
    when 'exist'
      result_exo = if_exist(file_name)
    when 'test'
      if File.exists?(file_name)
        result_exo = test_file(file_name, data[i][1], data[i][2])[0]
        the_return = test_file(file_name, data[i][1], data[i][2])[1]
        expected = test_file(file_name, data[i][1], data[i][2])[2]
      else
        result_exo = false
        the_return = "Impossible d'effectuer le test car le fichier est introuvable"
        expected = ''
      end
    end
    show(note_table,result_exo, name_exo, i + 1, total_exo + 1, the_return, expected)
  end
end

def show_final_result note_table
  puts ''
  if note_table[0] >= (note_table[1]/2.0)
    puts "Total success:"+" (#{note_table[0]}/#{note_table[1]})".green + "\n\nSoit " + "#{((note_table[0] * 100)/(note_table[1] * 1.0)).round(2)}%".green + " de reussite aux épreuves\n\n\n"
  else
    puts "Total success:"+" (#{note_table[0]}/#{note_table[1]})".red + "\n\nSoit " + "#{((note_table[0] * 100)/(note_table[1] * 1.0)).round(2)}%".red + " de reussite aux épreuves\n\n\n"
  end
end

def show(note_table,result_exo, nom_exo, num_exo, total_exo, the_return = '', expected = '')
  note_table[1] += 1
  if result_exo
    note_table[0] += 1
    puts "#{nom_exo} (#{num_exo}/#{total_exo}) :"+" success".green
  else
    the_return_colored = ''
    if expected.length > the_return.length
      (0..(the_return.length - 1)).each do |i|
        if expected[i] == the_return[i]
          the_return_colored += the_return[i].green
        else
          the_return_colored += the_return[i].red
        end
      end
    else
      (0..(expected.length - 1)).each do |i|
        if expected[i] == the_return[i]
          the_return_colored += the_return[i].green
        else
          the_return_colored += the_return[i].red
        end
      end
    end
    if expected == ''
      if the_return == ''
        the_return = "le fichier '#{nom_exo}.rb' est introuvable"
      end
      puts "#{nom_exo} (#{num_exo}/#{total_exo}) :"+" failure".red + "    -    raison: " +"#{the_return}".red
    else
      puts "#{nom_exo} (#{num_exo}/#{total_exo}) :"+" failure".red + "    -    expected: " +"#{expected.blue}" + "  reçu: "+ the_return_colored
    end
  end
  return note_table
end

def my_exercise_result (num_test = '')
  note_table = [0, 0]

  # exercice air00
  # ------------
  # data test air00
  if num_test == '' || num_test.to_i == 0
    datatest00 =  [['exist', '', ""],
                  ['test', "\"Bonjour les gars\"", "Bonjour\nles\ngars\n"],
                  ['test', "\"Salut la grande famille de moi\"", "Salut\nla\ngrande\nfamille\nde\nmoi\n"],
                  ['test', "", "error\n"]]
    test_exo(note_table, 'air00', datatest00)
  end

  # exercice air01
  # ------------
  # data test air01
  if num_test == '' || num_test.to_i == 1
    datatest01 =  [['exist', '', ""],
                    ['test', "\"Crevette magique dans la mer des étoiles\" \"la\"", "Crevette magique dans \n mer des étoiles\n"],
                    ['test', "\"Salut la grande famille de moi\" \"de\"", "Salut la grande famille \n moi\n"],
                    ['test', "\"Et le mot de la fin\" \"fin\"", "Et le mot de la \n"],
                    ['test', "\"Et le mot de la fin\"", "error\n"],
                    ['test', "", "error\n"]]
    test_exo(note_table, 'air01', datatest01)
  end

  # exercice air02
  # ------------
  # data test air02
  if num_test == '' || num_test.to_i == 2
    datatest02 =  [['exist', '', ""],
                   ['test', "\"Je\" \"teste\" \"des\" \"trucs\" \" \"", "Je teste des trucs\n"],
                   ['test', "\"Et\" \"ça\" \"marche\" \"_\"", "Et_ça_marche\n"],
                   ['test', "\"erreur\"", "error\n"],
                   ['test', "", "error\n"]]
    test_exo(note_table, 'air02', datatest02)
  end

  # exercice air03
  # ------------
  # data test air03
  if num_test == '' || num_test.to_i == 3
    datatest03 =  [['exist', '', ""],
                   ['test', "1 2 3 4 5 4 3 2 1", "5\n"],
                   ['test', "bonjour monsieur bonjour", "monsieur\n"],
                   ['test', "bonbon", "bonbon\n"],
                   ['test', "", "erreur\n"]]
    test_exo(note_table, 'air03', datatest03)
  end

  # exercice air04
  # ------------
  # data test air04
  if num_test == '' || num_test.to_i == 4
    datatest04 =  [['exist', '', ""],
                   ['test', "\"Hello milady,   bien ou quoi ??\"", "Helo milady, bien ou quoi ?\n"],
                   ['test', "\"bonjour Monsieur 22\"", "bonjour Monsieur 2\n"],
                   ['test', "???", "?\n"],
                   ['test', "", "erreur\n"]]
    test_exo(note_table, 'air04', datatest04)
  end

  # exercice air05
  # ------------
  # data test air05
  if num_test == '' || num_test.to_i == 5
    datatest05 =  [['exist', '', ""],
                   ['test', "1 2 3 4 5 \"+2\"", "3 4 5 6 7\n"],
                   ['test', "10 11 12 20 \"-5\"", "5 6 7 15\n"],
                   ['test', "10 11 12 20", "erreur\n"],
                   ['test', "10 11 12 20 \"a5\"", "erreur\n"],
                   ['test', "10 11 12 AA \"+5\"", "erreur\n"],
                   ['test', "", "erreur\n"]]
    test_exo(note_table, 'air05', datatest05)
  end

  # exercice air06
  # ------------
  # data test air06
  if num_test == '' || num_test.to_i == 6
    datatest06 =  [['exist', '', ""],
                   ['test', "\"Armando\" \"Mergenie\" \"Géorgia\" \"Alberto\" \"o\"", "Mergenie\n"],
                   ['test', "\"Armando\" \"Mergenie\" \"Géorgia\" \"Alberto\" \"a\"", "Mergenie, Alberto\n"],
                   ['test', "\"Armando\" \"Mergenie\" \"Géorgia\" \"Alberto\" \" \"", "erreur\n"],
                   ['test', "10 11 12 20 \"2\"", "10, 11\n"],
                   ['test', "\"Moi\"", "erreur\n"],
                   ['test', "", "erreur\n"]]
    test_exo(note_table, 'air06', datatest06)
  end

  # exercice air07
  # ------------
  # data test air07
  if num_test == '' || num_test.to_i == 7
    datatest07 =  [['exist', '', ""],
                   ['test', "1 3 4 2", "1 2 3 4\n"],
                   ['test', "10 20 30 40 50 60 70 90 33", "10 20 30 33 40 50 60 70 90\n"],
                   ['test', "10 20 30 33 40 50 60 70 90 100", "10 20 30 33 40 50 60 70 90 100\n"],
                   ['test', "10 20 30 33 40 50 60 70 90 80", "10 20 30 33 40 50 60 70 80 90\n"],
                   ['test', "11 10", "10 11\n"],
                   ['test', "40 50 60 70 90 80 \"Moi\"", "erreur\n"],
                   ['test', "40 50 60 lol 90 80", "erreur\n"],
                   ['test', "40", "erreur\n"],
                   ['test', "", "erreur\n"]]
    test_exo(note_table, 'air07', datatest07)
  end

  # exercice air08
  # ------------
  # data test air08
  if num_test == '' || num_test.to_i == 8
    datatest08 =  [['exist', '', ""],
                   ['test', "10 20 30 fusion 15 25 35", "10 15 20 25 30 35\n"],
                   ['test', "10 20 30 40 fusion 50 60 70 90 100", "10 20 30 40 50 60 70 90 100\n"],
                   ['test', "40 fusion 40", "40 40\n"],
                   ['test', "10 20 3a fusion 15 25 35", "erreur\n"],
                   ['test', "40 50 60 lol 90 80", "erreur\n"],
                   ['test', "fusion 40", "erreur\n"],
                   ['test', "40", "erreur\n"],
                   ['test', "", "erreur\n"]]
    test_exo(note_table, 'air08', datatest08)
  end

  # exercice air09
  # ------------
  # data test air09
  if num_test == '' || num_test.to_i == 9
    datatest09 =  [['exist', '', ""],
                   ['test', "\"Armando\" \"Mergenie\" \"Géorgia\" \"Alberto\"", "Mergenie, Géorgia, Alberto, Armando\n"],
                   ['test', "\"Armando\" \"Mergenie\"", "Mergenie, Armando\n"],
                   ['test', "\"Armando\" 100 \"Mergenie\"", "100, Mergenie, Armando\n"],
                   ['test', "Oliver", "Oliver\n"],
                   ['test', "30 40", "40, 30\n"],
                   ['test', "", "erreur\n"]]
    test_exo(note_table, 'air09', datatest09)
  end

  # exercice air10
  # ------------
  # data test air10
  if num_test == '' || num_test.to_i == 10
    datatest10 =  [['exist', '', ""],
                   ['test', "a.txt", "je suis le fichier a\n"],
                   ['test', "non_existant.txt", "erreur\n"],
                   ['test', "", "erreur\n"]]
    test_exo(note_table, 'air10', datatest10)
  end

  # exercice air11
  # ------------
  # data test air11
  if num_test == '' || num_test.to_i == 11
    datatest11 =  [['exist', '', ""],
                   ['test', '0 5', "     0\n    000\n   00000\n  0000000\n 000000000\n"],
                   ['test', 'A 7', "       A\n      AAA\n     AAAAA\n    AAAAAAA\n   AAAAAAAAA\n  AAAAAAAAAAA\n AAAAAAAAAAAAA\n"],
                   ['test', '', "erreur\n"],
                   ['test', 'A', "erreur\n"]]
    test_exo(note_table, 'air11', datatest11)
  end

  # exercice air12
  # ------------
  # data test air12
  if num_test == '' || num_test.to_i == 12
    datatest12 =  [['exist', '', ""],
                   ['test', '6 5 4 3 2 1', "1 2 3 4 5 6\n"],
                   ['test', '6 5 4 3 2 1 10 11 8', "1 2 3 4 5 6 8 10 11\n"],
                   ['test', 'a', "erreur\n"],
                   ['test', '', "erreur\n"]]
    test_exo(note_table, 'air12', datatest12)
  end

  # exercice air14
  # ------------
  # data test air14
  if num_test == '' || num_test.to_i == 14
    datatest14 =  [['exist', '', ""],
                   ['test', '', "J’ai terminé l’Épreuve de l’Air et c’était remontant\n"],
                   ['test', 'a', "J’ai terminé l’Épreuve de l’Air et c’était remontant\n"],
                   ['test', '12 34 13', "J’ai terminé l’Épreuve de l’Air et c’était remontant\n"]]
    test_exo(note_table, 'air14', datatest14)
  end


  #resultat
  show_final_result note_table
end
# -------------


# LES ERREURS
# -------------
# -------------


# LES DATA
# -------------
num_test = ARGV[0]
if "air#{ARGV[0]}.rb" == $PROGRAM_NAME
  puts "\nC'est le fichier de test dans lequel tu es (air13.rb). Rien d'interessant!!\n\nIl a été ecrit avec passion en Ruby par ".yellow + "Oliver KEB(oliver.keb@icloud.com)\n".red
  exit
end
  # -------------

# LA RESOLUTION
# -------------
# -------------


# RESULTAT(S)
# -------------
if num_test != nil && num_test != ''
  my_exercise_result num_test
else
  my_exercise_result
end
# -------------
