class DynTable
  attr_accessor :table

  TABLES = {
    "Medium" => "mediums"
  }

  def initialize(options)
    options.each do |k, v|
      instance_variable_set("@#{k}", v)
    end
  end

  def class_name
    table.singularize.camelize
  end

  def table_class
    @table_class ||= if tn = TABLES[class_name]
      Object.const_set(class_name, Class.new(ApplicationRecord) { self.table_name = tn })
    else
      Object.const_set(class_name, Class.new(ApplicationRecord))
    end
  end
end
