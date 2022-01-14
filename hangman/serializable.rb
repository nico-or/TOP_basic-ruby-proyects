require 'json'
module Serializable
  def to_json
    hash = {}
    instance_variables.each do |key|
      hash[key] = instance_variable_get(key)
    end
    JSON.dump(hash)
  end
