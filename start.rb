# coding: utf-8
# Project MP3 in Ruby
# Catch argument and execute function
# Epitech TEK-01
# Cerfio

require 'colorize'
require 'pathname'
require_relative 'gestion_folder.rb'
require_relative 'playlist.rb'
require_relative 'play_music.rb'

def debut
  puts("Quel action faire ?")
  nombre = 0
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
    if (choix == "help")
      fichier = File.open("README.md",'r').readlines
      mot = fichier
      puts(fichier)
      puts("\n\nFin du help")
    end
  end
  puts("Good Bye")
end

debut
