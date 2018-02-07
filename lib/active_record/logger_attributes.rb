require 'active_model/logger_attributes'

require "active_record/logger_attributes/version"
require 'active_record/logger_attributes/device'

module ActiveRecord
  module LoggerAttributes
    extend ActiveSupport::Concern
    include ActiveModel::LoggerAttributes

    module ClassMethods
      def logger_attr_default_options
        Class
          .new
          .extend(ActiveModel::LoggerAttributes::ClassMethods)
          .logger_attr_default_options
          .merge(save_on_write: true)
      end

      def logger_attr(attribute, options = {})
        attribute = attribute.to_sym
        setup_logger_attr(attribute, options)
      end
    end

    def logger_for_logger_attribute(attribute, logger_class, &block)
      device = ActiveRecord::LoggerAttributes::Device.new(attribute, self)
      logger_class.new(device).tap do |l|
        progname = [self.class.name]
        progname << id if persisted?
        progname << attribute
        l.progname = progname.join('.') if l.respond_to?(:progname)
        yield l if block_given?
      end
    end
  end
end

ActiveRecord::Base.send :include, ActiveRecord::LoggerAttributes
