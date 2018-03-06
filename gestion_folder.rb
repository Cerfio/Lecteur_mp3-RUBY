# coding: utf-8
# Project MP3 in Ruby
# Gestion Folder
# Epitech TEK-01
# Cerfio

require 'colorize'
require 'pathname'
require_relative 'start.rb'
require_relative 'gestion_folder.rb'
require_relative 'playlist.rb'
require_relative 'play_music.rb'

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
  puts("veuiller mettre vos musiques dans le dossier music".yellow)
  puts("Help pour savoir les commandes".yellow)
end
