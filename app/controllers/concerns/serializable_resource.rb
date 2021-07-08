module SerializableResource
  def parse_json object
    ActiveModelSerializers::SerializableResource.new(object).as_json
  end
  # parse_json_custom for booking_serializer
  # Reference: https://stackoverflow.com/questions/37618192/passing-options-to-activemodel-serializer
  def parse_json_custom(object, options)
    # p "SerializableResource, parse_json_custom, object, options" + object.to_s + " " + options.to_s
    # ActiveModelSerializers::SerializableResource.new(object).as_json
    # Able to access at serializer level as @instance_options
    ActiveModelSerializers::SerializableResource.new(object, options).as_json
  end
end
