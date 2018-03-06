# coding: utf-8
# Project MP3 in Ruby
# Play a music
# Epitech TEK-01
# Cerfio

require 'colorize'
require 'pathname'
require_relative 'start.rb'
require_relative 'gestion_folder.rb'
require_relative 'playlist.rb'

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
