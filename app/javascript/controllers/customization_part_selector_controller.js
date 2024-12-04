import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["customizable_part_id", "customizable_part_customization", "customizable_part_option"]

  connect() {
    alert()
  }

  showSubmenu() {
    this.submenuTarget.classList.remove("hidden")
  }

  hideSubmenu() {
    this.submenuTarget.classList.add("hidden")
  }
}
