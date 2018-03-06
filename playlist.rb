# coding: utf-8
# Project MP3 in Ruby
# Create | Delete | Rename > Playlist
# Epitech TEK-01
# Cerfio

require 'colorize'
require 'pathname'
require_relative 'gestion_folder.rb'
require_relative 'play_music.rb'
require_relative 'start.rb'

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
