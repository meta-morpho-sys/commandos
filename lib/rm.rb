require_relative 'flags'

# Rm class suggests tips for rm command
class Rm
  include Flags

  def initialize(filename = 'tips/ls.txt')
    load_tips(filename)
  end

  def suggest_tips(arguments)
    combine_tips(extract_flags(arguments))
  end

  def tips
    @tips.dup
  end

  private

  def load_tips(filename)
    @tips = {}
    File.open(filename, 'r') do |file|
      file.readlines.each do |line|
        key, value = line.chomp.split(':', 2)
        @tips[key.to_sym] = value
      end
    end
  end

  def combine_tips(options)
    [] << check_for_i(options)
  end

  def check_for_i(options)
    return @tips[:i] unless options.include?('i')
  end
end
