import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["light", "dark"]

  connect() {
    const saved = localStorage.getItem("theme") || "light"
    this.apply(saved)
  }

  setLight() {
    this.apply("light")
  }

  setDark() {
    this.apply("dark")
  }

  apply(theme) {
    document.documentElement.dataset.theme = theme
    localStorage.setItem("theme", theme)
    this?.lightTarget.classList.toggle("active", theme === "light")
    this?.darkTarget.classList.toggle("active", theme === "dark")
  }
}
