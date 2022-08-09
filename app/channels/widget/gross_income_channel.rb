class Widget::GrossIncomeChannel < ApplicationCable::Channel
  def subscribed
    # When the client subscribes, the job is fired, the Job will be responsible for doing the broadcast back to client via ActionCable
    Widget::GrossIncomeJob.perform_later(id: params[:id])
    # Client is listening to the string (following Payton's example) that can be composed of multiple values (using just id here)
    stream_for "some-stuff-#{params[:id]}"
  end
end
