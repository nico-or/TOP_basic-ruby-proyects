require 'json'
module Serializable
  def to_json
    hash = {}
    instance_variables.each do |key|
      hash[key] = instance_variable_get(key)
    end
    JSON.dump(hash)
  end

  def from_json(json_string)
    hash = JSON.parse(json_string)
    hash.each_pair do |key, value|
      instance_variable_set(key.to_sym, value)
    end
  end
end
