class GrossIncomeChannel < ApplicationCable::Channel
  def subscribed
    stream_for "some-stuff-#{params[:id]}"
  end
end
