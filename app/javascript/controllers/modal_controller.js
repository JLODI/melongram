import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    let backdrop = document.querySelector(".modal-backdrop");
    if (backdrop) {
      backdrop.remove();
    }
    this.modal = new bootstrap.Modal(this.element);
    this.modal.show();
    this.element.addEventListener("hidden.bs.modal", (event) => {
      this.element.remove();
    });
  }
}