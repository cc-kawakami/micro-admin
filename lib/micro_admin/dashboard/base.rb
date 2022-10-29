module MicroAdmin
  module Dashboard
    class Base < Cell::ViewModel
      include ::Cell::Erb

      self.view_paths = [
        File.join(__dir__, "..", ".."),
        __dir__
      ]

      def index(resources)
        @resources = resources
        render
      end
      
      def show(resource)
        @resource = resource
        render
      end

      def new(errors:)
        @errors = errors
        render
      end

      def edit(id:, values:, errors:)
        @id = id
        @values = values
        @errors = errors
        render
      end
    end
  end
end