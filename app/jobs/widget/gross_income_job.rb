class Widget::GrossIncomeJob < ApplicationJob
  queue_as :default

  def perform(id:)
    sleep 2
    Widget::GrossIncomeChannel.broadcast_to("some-stuff-#{id}", template: "<div>hello</div>")
  end
end
