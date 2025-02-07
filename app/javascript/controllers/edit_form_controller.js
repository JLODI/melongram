import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["editForm"]
  connect() {
    console.log("Hello, Stimulus is working!");
    if (this.editForm){
    this.editForm.addEventListener("input");
    }
  }

  revealDoneButton(){
    let button = document.getElementById('done-button')
    button.classList.add("slide-in")
  }

  submitForm(){
    let submit = document.getElementById('edit-form-submit')
    submit.click();
    button.classList.remove("slide-in")
    button.classList.add("slide-out")

  }

}
