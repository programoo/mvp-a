import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    height: { type: Number, default: 1.7 }
  }

  connect() {
    const saved = localStorage.getItem("lineHeight")
    if (saved) {
      this.heightValue = parseFloat(saved)
    }
    this.apply()
  }

  increase() {
    this.heightValue = Math.min(this.heightValue + 0.1, 2.2)
    this.apply()
  }

  decrease() {
    this.heightValue = Math.max(this.heightValue - 0.1, 1.3)
    this.apply()
  }

  reset() {
    this.heightValue = window.innerWidth < 768 ? 1.6 : 1.7
    this.apply()
  }

  apply() {
    document.documentElement.style.setProperty(
      "--reader-line-height",
      this.heightValue
    )
    localStorage.setItem("lineHeight", this.heightValue)
  }
}
