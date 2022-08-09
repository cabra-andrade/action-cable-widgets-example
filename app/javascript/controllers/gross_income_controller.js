import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  connect() {
    console.log("Connecting to gross income channel.");

    this.channel = consumer.subscriptions.create("GrossIncomeChannel", {
      connected: this.#cableConnected.bind(this),
      received: this.#cableReceived.bind(this)
    });    
  }

  #cableConnected() {
    console.log("Connected succesfully to GrossIncomeChannel");
  }

  #cableReceived(data) {
    console.log(data);
  }
}
