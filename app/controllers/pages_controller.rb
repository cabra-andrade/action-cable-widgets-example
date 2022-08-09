class PagesController < ApplicationController
  def home
    @dashboard = OpenStruct.new(
      gross_income: Widget::Loader.new(class_name: "GrossIncome")
    )
  end
end
