import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = {
    id: Number,
    className: String
  }

  connect() {
    console.log(`Connecting to ${this.classNameValue}Channel with id ${this.idValue}`);
    this.params = {
      channel: `WidgetLoaderChannel`,
      id: this.idValue, // some random id for testing purposes
      class_name: this.classNameValue
    }

    this.channel = consumer.subscriptions.create(this.params, {
      connected: this.#cableConnected.bind(this),
      received: this.#cableReceived.bind(this)
    });    
  }

  #cableConnected() {
    console.log(`Connected succesfully to ${this.classNameValue}Channel on id ${this.params.id}`);
  }

  #cableReceived(data) {
    this.element.outerHTML = data.template
  }
}
