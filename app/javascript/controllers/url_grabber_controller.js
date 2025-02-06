import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["url"]
  connect() {
  }

  copyLink(){
    const url = this.urlTarget.getAttribute('data-post-url'); // Get the URL of the post

     // copies the url
    navigator.clipboard.writeText(url);

    this.flashMessage();
  }

  flashMessage(){
    // finds the flash container
    let container = document.getElementById('stimulus-flash')

    // append the message to the container
    container.textContent = 'Link copied to the clipboard.';

    // play slide in animation
    container.classList.add("slide-in-out")

  }
}
