module ActiveRecord
  module LoggerAttributes
    class Device < ActiveModel::LoggerAttributes::Device
      def initialize(attribute, model, save_on_write = true)
        super(attribute, model)
        @save_on_write = save_on_write
      end

      def write(message)
        super
        @model.update_column @attribute, @model.send(@attribute) if @save_on_write && @model.persisted?
      end
    end
  end
end
