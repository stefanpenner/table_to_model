require 'thor'
require 'active_record'
require 'active_support/core_ext/string/inflections'

module TableToModel
  class CLI < Thor
    include Thor::Actions

    source_root File.dirname(__FILE__) + '/templates'
    desc "generate models", "generate models from the database"
    method_options :adapter => :string , 
      :database => :string, 
      :username => :string, 
      :password => :string, 
      :output_dir => :string,
      :module   => :string,
      :driver   => :string,
      :url      => :string

    def gen
      
      ActiveRecord::Base.establish_connection({
        :adapter  => options[:adapter],
        :database => options[:database],
        :username => options[:username],
        :password => options[:password],
        :driver   => options[:driver],
        :url      => options[:url]
      })

      module_name = options[:module]
      if module_name
        model_template = "model_in_module.tt"
        @module_name = module_name.classify
      else
        model_template = "model.tt"
      end

      ActiveRecord::Base.connection.tables.each do |table_name|
        @model_name  = table_name.classify
        @table_name  = table_name

        template(model_template, "#{options[:output_dir]}/#{table_name}.rb")
      end
    end

    def help
      puts <<-HELP
help
HELP
    end
  end
end
