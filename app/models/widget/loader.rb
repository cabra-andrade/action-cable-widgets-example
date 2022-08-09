class Widget::Loader
  def initialize(class_name:, title: nil)
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
