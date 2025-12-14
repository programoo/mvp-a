import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    size: { type: Number, default: 1 }
  }

  connect() {

    const saved = localStorage.getItem("fontSize")
    if (saved) {
      this.sizeValue = parseFloat(saved)
    }
    this.apply()
  }

  increase() {
    this.sizeValue = Math.min(this.sizeValue + 0.1, 1.6)
    this.apply()
  }

  decrease() {
    this.sizeValue = Math.max(this.sizeValue - 0.1, 0.8)
    this.apply()
  }

  reset() {
    this.sizeValue = window.innerWidth < 768 ? 1 : 1.2
    this.apply()
  }


  apply() {
    document.documentElement.style.setProperty(
      "--reader-font-scale",
      this.sizeValue
    )
    localStorage.setItem("fontSize", this.sizeValue)
  }
}
