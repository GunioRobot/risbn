# require 'ruby-debug'
# require 'colorize'
# require 'ap'
require 'isbn/tools'

class RISBN
  class InvalidISBN < ArgumentError; end

  attr_reader :isbn

  ISBN_REGEXP = /\b(?=\w)(?:ISBN(?:-1[03])?:? )?(?=[-0-9 ]{17}\b|[-0-9X ]{13}\b(?!\w)|[0-9X]{10}\b)(?:97[89][- ]?)?[0-9]{1,5}[- ]?(?:[0-9]+[- ]?){2}[0-9X]\b/

  def self.options
    @@options
  end

  # returns all the isbn numbers found on the line.
  def self.parse(line)
    line.scan(ISBN_REGEXP).each { |match| return ISBN_Tools.cleanup(match) }
  end

  def initialize(code = [])
    @isbn ||= []
  end
end
