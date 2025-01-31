import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["output"]
  connect() {
    console.log("Hello, Stimulus is working!");
  }

  greet() {
    
    this.outputTarget.textContent = "Hello, Stimulus!";
  }
}
