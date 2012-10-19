class ConvertKeysToSymbol 
  def self.convert(hash)
    result_hash = {}
    hash.each do |key, value|
      result_hash[key.to_sym] = value
    end
    result_hash
  end
end
