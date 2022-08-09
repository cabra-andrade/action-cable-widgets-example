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
      channel: `Widget::${this.classNameValue}Channel`,
      id: this.idValue // some random id for testing purposes
    }

    this.channel = consumer.subscriptions.create(this.params, {
      connected: this.#cableConnected.bind(this),
      received: this.#cableReceived.bind(this)
    });    
  }

  #cableConnected() {
    console.log(`Connected succesfully to GrossIncomeChannel on id ${this.params.id}`);
  }

  #cableReceived(data) {
    this.element.outerHTML = data.template
  }
}
