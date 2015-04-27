module Fluent
  class TypecastFilter < Filter
    Fluent::Plugin.register_filter('typecast', self)

    include ::Fluent::TextParser::TypeConverter

    def filter(tag, time, record)
      record.map do |key, val|
        [key, convert_type(key, val)]
      end.to_h
    end
  end
end
