require 'pry'
require 'yaml'
emoticons = YAML.load_file('lib/emoticons.yml')
file_path = 'lib/emoticons.yml'
emoticon = "☜(⌒▽⌒)☞"

def load_library(file_path)
  lib = YAML.load_file(file_path)
  hash = {
    "get_emoticon" => {},
    "get_meaning" => {}
}
  lib.each do |m, arr|
    hash["get_meaning"][arr[1]] = m
    hash["get_emoticon"][arr[0]] = arr[1]
  end
  hash
end

def get_japanese_emoticon(file_path, emoticon)
  hash = load_library(file_path)
  if !hash["get_emoticon"].keys.include?(emoticon)
    return "Sorry, that emoticon was not found"
  end
  hash["get_emoticon"].each do |k, v|
    if k == emoticon
      return v
    end
  end
end

def get_english_meaning(file_path, emoticon)
  hash = load_library(file_path)
  if !hash["get_meaning"].keys.include?(emoticon)
    return "Sorry, that emoticon was not found"
  end
  hash["get_meaning"].each do |k, v|
    if k == emoticon
      return v
    end
  end
end

get_english_meaning(file_path, emoticon)
