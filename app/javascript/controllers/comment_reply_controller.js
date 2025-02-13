import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["form", "replies","link"]
    
    connect(){
    }

    toggleForm(event) {
        event.preventDefault()
        this.formTarget.classList.toggle("d-none")
    }
    toggleReplies(event) {
        event.preventDefault()
        this.repliesTarget.classList.toggle("d-none")
    }
    changeText(event) {
        event.preventDefault()
        const linkText = this.linkTarget.textContent;
            if (linkText.includes('show')) {
            this.linkTarget.textContent = "Hide all replies";
        }
            else if (linkText.includes('hide')){
            this.linkTarget.textContent = "Show all #{ pluralize(comment.comments.count, 'reply' )}";
            console.log(this.linkTarget.textContent)
            }
    }

}
