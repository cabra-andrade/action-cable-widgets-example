class WidgetLoaderChannel < ApplicationCable::Channel
  def subscribed
    # When the client subscribes, the job is fired, the Job will be responsible for doing the broadcast back to client via ActionCable
    # I'm namespacing the class to avoid unwanted classes being loaded
    job_class = "Widget::#{params[:class_name]}Job".safe_constantize

    # job_class will be nil if there's no such job... which... might be overengineering. We could be able to solve this with just one job class.
    # But this gives us a chance for a catch to do something in case of error (which... would be developer and not user error, mostly.)
    job_class.perform_later(id: params[:id])

    # Client is listening to the string (following Payton's example) that can be composed of multiple values (using just id here)
    stream_for "some-stuff-#{params[:id]}-#{params[:class_name]}" # I don't like this as a magic string... I might be missing a class to help build this
  end
end
