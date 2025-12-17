import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    contentId: String
  }

  connect() {
    const content = document.getElementById(this.contentIdValue)
    var contentElement = "";
    if (content !== null) {
      contentElement = content.innerHTML;
    }
    console.log(contentElement);
    this.popover = new window.bootstrap.Popover(this.element, {
      html: true,
      content: contentElement
    })

    this.element.addEventListener("shown.bs.popover", () => {
      this._activateStimulus()
    })
  }

  _activateStimulus() {
    const popover = document.querySelector(".popover")
    if (!popover) return

    this.application.load(popover)
  }

  disconnect() {
    this.popover?.dispose()
  }
}
