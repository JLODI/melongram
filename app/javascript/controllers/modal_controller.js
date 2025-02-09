import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
    static values = {showModal : Boolean}
  connect() {
    let backdrop = document.querySelector(".modal-backdrop");
    if (backdrop) {
      backdrop.remove();
    }
    this.modal = new bootstrap.Modal(this.element);
    if (this.showModalValue) {
      this.modal.show();
    }
    this.element.addEventListener("hidden.bs.modal", (event) => {
      this.element.remove();
      console.log(this.element)
    });
  }
}