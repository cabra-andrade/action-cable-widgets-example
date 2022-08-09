class PagesController < ApplicationController
  def home
    @dashboard = OpenStruct.new(
      gross_income: build_gross_income_widget
    )
  end

  private

  def build_gross_income_widget
    OpenStruct.new(
      title: "Gross Income",
      controller: "gross-income"
    )
  end
end
