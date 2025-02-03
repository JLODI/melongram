import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-post-form"
export default class extends Controller {
  static targets = ['preview', 'selectFileButton', 'photoFile', 'nextButton', 'textForm', 'modalSize'];

  connect() {
  }

  // stops the modal from closing and clicks the file upload button
  selectFile(e) {
    e.preventDefault();
    this.photoFileTarget.click();
  }

  preview(event) {
    const files = event.target.files; // Get the selected files
    if (files) {
      // Clear the preview container before adding new previews
      this.previewTarget.innerHTML = "";

      Array.from(files).forEach((file) => {
        const reader = new FileReader();

        reader.onload = (e) => {
          const img = document.createElement("img");
          img.src = e.target.result; // Set the source of the image to the data URL
          img.style.borderRadius = "20%"; // Apply rounded edges
          img.style.width = "75px"; // Set the width
          img.style.height = "75px"; // Set the height
          img.style.margin = "8px" // Set the margins
          img.style.objectFit = "cover"; // Ensure the image covers the area, maintaining its aspect ratio

          this.previewTarget.appendChild(img); // Append the preview image to the container
        };

        reader.readAsDataURL(file); // Read the file as a data URL
        
        this.nextButtonTarget.style.display = "block"
      });
    }
  }

  revealForm() {
    this.nextButtonTarget.style.display = "none"
    this.modalSizeTarget.classList.add("resize")
    this.textFormTarget.classList.add("fade-in")

  }
}
