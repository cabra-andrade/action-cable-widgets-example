class Widget::AnotherThingJob < ApplicationJob
  queue_as :default

  def perform(id:)
    sleep rand(0.5..3.5)
    WidgetLoaderChannel.broadcast_to("some-stuff-#{id}-#{class_name}", template: render_template)
  end

  private

  def class_name
    "AnotherThing"
  end

  def render_template
    ApplicationController.render(
      partial: "dashboard/widgets/another_thing",
      locals: { widget: Widget::AnotherThing.new(some: "stuff", might: "need to be passed") }
    )
  end
end
