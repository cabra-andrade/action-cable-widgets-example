import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  connect() {
    console.log("Connecting to gross income channel.");
    this.params = {
      channel: "GrossIncomeChannel",
      id: Number((Math.random() * 10000).toFixed(), 10) // some random id for testing purposes
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
    console.log(data);
  }
}
