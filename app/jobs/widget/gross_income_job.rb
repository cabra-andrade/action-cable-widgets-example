class Widget::GrossIncomeJob < ApplicationJob
  queue_as :default

  def perform(id:)
    sleep 2
    Widget::GrossIncomeChannel.broadcast_to("some-stuff-#{id}", template: render_template)
  end

  private

  def render_template
    ApplicationController.render(
      partial: "dashboard/widgets/gross_income",
      locals: { widget: Widget::GrossIncome.new(some: "stuff", might: "need to be passed") }
    )
  end
end
