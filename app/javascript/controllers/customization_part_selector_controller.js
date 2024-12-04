import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["id", "customization", "option"]

  connect() {
  }

  load() {
    const id = this.idTarget.value
    let customizable_parts_selected = Array.from(document.querySelectorAll("[name^='product[customizable_parts_attributes]'][name$='[option]']")).map(e => e.value).filter(Boolean);
    console.log(customizable_parts_selected)
    const csrfToken = document.querySelector("[name='csrf-token']").content
    fetch(`/compatible_customizable_parts/${id}`, {
      method: 'POST', // *GET, POST, PUT, DELETE, etc.
      mode: 'cors', // no-cors, *cors, same-origin
      cache: 'no-cache', // *default, no-cache, reload, force-cache, ➤only-if-cached
      credentials: 'same-origin', // include, *same-origin, omit
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify({ selected_products: customizable_parts_selected })
    })
    .then(response => response.text())
    .then(Turbo.renderStreamMessage)
  }
}
