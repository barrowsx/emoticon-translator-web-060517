require 'yaml'
require 'pry'

def load_library(path)
  lib = YAML::load_file(path)
  hash_to_return = {"get_meaning" => {}, "get_emoticon" => {}}
  lib.each do |emoticon, meaning|
    hash_to_return["get_meaning"][meaning[0]] = emoticon
    hash_to_return["get_meaning"][meaning[1]] = emoticon
    hash_to_return["get_emoticon"][meaning[0]] = meaning[1]
  end
  hash_to_return
  #binding.pry
end

def get_japanese_emoticon(path, emoticon)
  working_hash = load_library(path)
  emoticon_to_return = "Sorry, that emoticon was not found"
  working_hash["get_emoticon"].each do |eng, jp|
    if emoticon == eng
      emoticon_to_return = jp
    end
  end
  emoticon_to_return
end

def get_english_meaning(path, emoticon)
  working_hash = load_library(path)
  meaning_to_return = "Sorry, that emoticon was not found"
  working_hash["get_meaning"].each do |emo, meaning|
    if emoticon == emo
      meaning_to_return = meaning
    end
  end
  meaning_to_return
end
