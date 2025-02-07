import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['charCount', 'text']
  connect() {
  }

  revealDoneButton(){
    let button = document.getElementById('done-button')
    button.classList.add("slide-in")
    this.characterCounter();
  }

  hideDoneButton(){
    let button = document.getElementById('done-button')
    button.classList.remove("slide-in")
    button.classList.add("slide-out")
    }
    
  characterCounter(){

    if (this.textTarget) {
        let characterCount = this.textTarget.value.length; //grabs the current value in the textarea
        this.charCountTarget.textContent = characterCount; //updates character counter with the value   
        
        if (characterCount < 2000) {
            this.charCountTarget.style.color = "#666";
        }
        else if (characterCount > 200 && characterCount < 2200) {
            this.charCountTarget.style.color = "#6d5555";
        }
        else {
            this.charCountTarget.style.color = "red";
            this.charCountTarget.style.fontweight = "bold";
        }
    }
    
  }

  submitForm(){
    let submit = document.getElementById('edit-form-submit')
    console.log(submit)
    submit.click();
    this.hideDoneButton();
  }

}
