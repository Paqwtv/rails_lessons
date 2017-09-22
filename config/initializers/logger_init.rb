=begin
require 'rails'
require 'oxy_logger'

class Object
  def self.method_hook(*args)
    options = args.extract_options!
    return unless (options[:before].present? or options[:after].present?)
    args.each do |method_name|
      old_method = instance_method(method_name) rescue next

      define_method(method_name) do |*args|
        # invoke before callback
        if options[:before].present?
          options[:before].is_a?(Proc) ? options[:before].call(method_name, self):
            send(options[:before], method_name, *args) 
        end

        # you can modify the code to call after callback
        # only when the old method returns true etc..
        old_method.bind(self).call(*args)

        # invoke after callback
        if options[:after].present?
          options[:after].is_a?(Proc) ? options[:after].call(method_name, self):
            send(options[:after], method_name, *args)
        end
      end
    end
  end
end

# Default configure Logger GEM
OxyLogger.configure do |config|
	# @param value [String] - путь куда сохранять логи
	# @example
	#  config.files_path = Rails.root + "/log/logged_data" #the same things in example 
  config.files_path = Rails.root.join('log', 'logged_data')
  # @note - сохранение логов локально в файл или в базу данных
  # @param value [String] - "file" or "db"
  # @example
  #  config.save_to_file_of_db = "db"
  config.save_to_file_or_db = "file"
	# @note - входящие параметры
	config.incoming_params = true
	# @note - исходящие параметры
	config.output_params = true
	# @note - время обработки запроса
	config.processing_time = true
	# @note - дата и время
	config.date_time = true
	# @note - вызываемый метод (action)
	config.called_method = true
	# @note - вызываемый класс
	config.class_name = true
end
=end