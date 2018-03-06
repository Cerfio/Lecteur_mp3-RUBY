#  coding: utf-8
require 'colorize'
require 'pathname'

def debut
  puts("Quel action faire ?")
  choix = "null"
  while (choix != "exit")
    choix = gets.chomp
    if (choix == "first")
      first
    end
    if (choix == "play")
      play_music(1)
    end
    if (choix == "play_background")
      play_music(2)
    end
    if (choix == "play_playlist")
      play_all_music
    end
    if (choix == "all_music")
      affichage_dossier("music/")
    end
    if (choix == "playlist")
      playlist
    end
  end
  puts("Good Bye")
end

def affichage_dossier (chemin)
  Dir.foreach(chemin) do |fichier|
    if (fichier != '.' && fichier != '..' && fichier != "playlist")
      puts("\n" + fichier + "\n")
    end
  end
end

def first()
  system("mkdir music")
  system("mkdir music/playlist")
  puts("Dossier music et playlist create".green)
  puts("veuiller mettre vos musique dans le dossier musique".yellow)
end

def playlist()
  puts("Bienvenue dans la Gestion de Playlist")
  choix = "null"
  while (choix != "exit")
    puts("Vous etes dans la section Gestion de Playlist")
    choix = gets.chomp
    if (choix == "create_playlist")
      puts("nom de la nouvelle playlist")
      nom_playlist = gets.chomp
      system("mkdir music/playlist/" + nom_playlist)
      puts(nom_playlist.green + " a été creer".green)
    end
    if (choix == "delete_playlist")
      puts("Nom de la playlist à supprimer")
      nom_playlist = gets.chomp
      system("rm -rf music/playlist/" + nom_playlist)
      puts(nom_playlist.red + " a été supprimer".red)
    end
    if (choix == "add_music")
      puts("Nom de la music à rajouter")
      music = gets.chomp
      puts("Nom de la playlist à laquelle rajouter la musique")
      playlist = gets.chomp
      system("cp music/" + music + " music/playlist/" + playlist)
      puts(music.green + " a été ajouter à la playlist ".green + playlist.green)
    end
    if (choix == "display_playlist")
      puts("Nom de la playlist à afficher")
      nom_playlist = gets.chomp
      affichage_dossier ("music/playlist/"+nom_playlist)
    end
    if (choix == "delete_music")
      puts("Nom de la music à supprimer")
      music = gets.chomp
      puts("Nom de la playlist à laquelle supprimer la musique")
      playlist = gets.chomp
      system("rm music/playlist/" + playlist + "/" + music)
      puts(music.red + " a été supprimer de la playlist ".red + playlist.red)
    end
  end
  puts("Vous sortez de la Gestion de Playlist")
end

def play_all_music()
  puts("Quel Playlist voulez-vous écoutez ?")
  playlist = gets.chomp
  puts("Lire la musique en boucle ?\n1) 1 = oui\n2) 0 = non")
  fin = gets.chomp.to_i
  i = 0;
  while (fin == 1 || i == 0)
    nbr_music = 0
    files = Dir.glob("music/playlist/" + playlist + '/*')
    files.each do |file|
      system("aplay " + files[nbr_music])
      nbr_music += 1
      i = i + 1
    end
  end
end

def play_music(nombre)
  index = 1;
  files = Dir.glob("music" + '/*')
  files.each do |file|
    ext=File.extname(files[index - 1])
    nom=File.basename(files[index - 1],ext)
    if nom != "playlist"
      puts(index.to_s + '/ ' + nom)
      index += 1
    end
  end
  puts("Choisisez votre musique : ")
  choise = gets.to_i - 1
  if (nombre == 1)
    system("aplay -i " + files[choise])
  end
  if (nombre == 2)
    system("aplay " + files[choise])
  end
end

debut
