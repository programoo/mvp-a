// app/javascript/controllers/flash_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message"]

  connect() {
    if (this.hasMessageTarget) {
      setTimeout(() => {
        this.hide()
      }, 5000) // hide after 3 seconds
    }
  }

  hide() {
    this.messageTarget.style.display = "none";
  }
}
