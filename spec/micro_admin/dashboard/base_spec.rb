RSpec.describe MicroAdmin::Dashboard::Base do
  class TestModel
    attr_reader :id, :name

    def initialize(id:, name:)
      @id = id
      @name = name
    end
  end

  class TestDashboard < MicroAdmin::Dashboard::Base
    self.view_paths = [File.join(__dir__, "fixtures")]

    def index_attributes
      [:id, :name]
    end

    def show_attributes
      [:id, :name]
    end

    def form_attributes
      [:name]
    end

    def model_class
      TestModel
    end
  end

  describe "index" do
    it_is_asserted_by {
      TestDashboard.new.index([TestModel.new(id: 1, name: "test")])
    }
  end

  describe "show" do
    it_is_asserted_by {
      TestDashboard.new.show(TestModel.new(id: 1, name: "test"))
    }
  end

  describe "new" do
    it_is_asserted_by {
      TestDashboard.new.new(errors: ["Name is required"])
    }
  end

  describe "edit" do
    it_is_asserted_by {
      TestDashboard.new.edit(id: 1, values: {name: "test"}, errors:["Name is required"])
    }
  end
end