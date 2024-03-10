require 'active_support/all'

class BaseSerializer
  EXCLUDED_ATTRIBUTES = %w[created_at updated_at].freeze

  def initialize(object)
    @object = object

    instance_variable_set("@#{object.class.name.downcase}", @object)
  end

  def excluded_attributes
    EXCLUDED_ATTRIBUTES
  end

  def to_yaml
    attribute_names = @object.class.columns.map(&:name) - excluded_attributes

    result = String.new("-\n")

    attribute_names.each do |attribute_name|
      raw_value = if respond_to?(attribute_name)
                    send(attribute_name)
                  else
                    @object.send(attribute_name)
                  end

      value = if raw_value.nil?
                'null'
              elsif raw_value.is_a?(String)
                raw_value.inspect
              elsif raw_value.is_a?(Float) || raw_value.is_a?(BigDecimal)
                if raw_value.truncate == raw_value
                  raw_value.truncate.to_s
                elsif (raw_value / 0.25).truncate == raw_value / 0.25 && !((raw_value / 0.5).truncate == raw_value / 0.5)
                  raw_value.round(2).to_s
                else
                  raw_value.round(1).to_s
                end
              else
                raw_value.to_s
              end

      result += "  #{attribute_name}: #{value}\n"
    end

    result.strip
  end
end
