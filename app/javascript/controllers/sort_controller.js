import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  static targets = ["item"]

  connect() {
    console.log("### sort connected!");
    this.sortable = Sortable.create(this.element, {
      animation: 150,
      handle: ".drag-handle",   // only drag via handle
      onEnd: this.reorder.bind(this),
    })
  }

  reorder(event) {
    const ids = this.sortable.toArray()

    fetch(this.data.get("url"), {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
      },
      body: JSON.stringify({ order: ids })
    })
  }
}
