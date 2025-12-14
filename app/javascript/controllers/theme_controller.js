import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const saved = localStorage.getItem("theme")
    if (saved) {
      document.documentElement.dataset.theme = saved
    }
  }

  toggle() {
    const current = document.documentElement.dataset.theme
    const next = current === "dark" ? "light" : "dark"

    document.documentElement.dataset.theme = next
    localStorage.setItem("theme", next)
  }
}
