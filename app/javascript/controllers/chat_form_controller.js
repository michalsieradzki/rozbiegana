import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "submit"]
  
  connect() {
    this.inputTarget.focus()
  }
  
  handleKeydown(event) {
    if (event.key === "Enter" && !event.shiftKey) {
      event.preventDefault()
      if (this.inputTarget.value.trim()) {
        this.submitTarget.click()
      }
    }
  }
  
  autoResize(event) {
    const textarea = event.target
    textarea.style.height = 'auto'
    textarea.style.height = textarea.scrollHeight + 'px'
  }
  
  clearInput() {
    this.inputTarget.value = ""
    this.inputTarget.style.height = 'auto'
    this.inputTarget.focus()
  }
}