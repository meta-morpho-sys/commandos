# Rm class suggests tips for rm command
class Rm
  include Flags
  include Tips

  def initialize(filename = 'tips/rm.txt')
    @tips = load_tips(filename)
  end

  def suggest_tips(arguments)
    combine_tips(extract_flags(arguments))
  end

  def tips
    @tips.dup
  end

  private

  def combine_tips(options)
    [check_for_i(options),
     check_for_ri(options),
     check_for_v(options),
     check_for_d(options),
     check_for_f(options),
     check_for_rf(options)]
  end

  def check_for_i(options)
    return @tips[:i] unless !options.include?('r') && options.include?('i')
  end

  def check_for_ri(options)
    return @tips[:ri] unless options.include?('r') && options.include?('i')
  end

  def check_for_v(options)
    return @tips[:v] unless options.include?('v')
  end

  def check_for_d(options)
    return @tips[:d] unless options.include?('d')
  end

  def check_for_f(options)
    return @tips[:f] unless !options.include?('r') && options.include?('f')
  end

  def check_for_rf(options)
    return @tips[:rf] unless options.include?('r') && options.include?('f')
  end
end
