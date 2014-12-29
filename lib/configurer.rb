# encoding: UTF-8

def iterate(h, variables)
  h.each do |k, v|
    # If v is nil, an array is being iterated and the value is k.
    # If v is not nil, a hash is being iterated and the value is v.
    #
    value = v || k

    if value.is_a?(Hash) || value.is_a?(Array)
      iterate(value, variables)
    else
      variables.each_pair { |var, val| v.gsub!(/\%\{#{var}\}/, val) } if v.is_a? String
    end
  end
end

module Jekyll
  class Site

    alias_method :old_process, :process

    def process
      variables = self.config['variables']
      return old_process if variables.nil?

      iterate(self.config, variables)

      old_process
    end

  end
end
