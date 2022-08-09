class Widget::Loader
  attr_reader :class_name, :id

  def initialize(class_name:, title: nil, id:)
    @id = id
    @class_name = class_name
    @title = title
  end

  def title
    @title ||= @class_name.underscore.humanize
  end

  def controller
    @class_name.underscore.gsub(/_/, "-")
  end
end
