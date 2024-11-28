import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["submenu"]

  connect() {
  }

  showSubmenu() {
    this.submenuTarget.classList.remove("hidden")
  }

  hideSubmenu() {
    this.submenuTarget.classList.add("hidden")
  }
}
