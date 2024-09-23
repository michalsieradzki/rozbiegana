import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["messages", "input"]

  connect() {
    console.log("Chat controller connected")
    this.setupMutationObserver()
    this.scrollToBottom()
  }

  disconnect() {
    if (this.observer) {
      this.observer.disconnect()
    }
  }

  setupMutationObserver() {
    if (this.hasMessagesTarget) {
      this.observer = new MutationObserver(this.handleMutation.bind(this))
      this.observer.observe(this.messagesTarget, { childList: true, subtree: true })
    }
  }

  handleMutation(mutations) {
    for (let mutation of mutations) {
      if (mutation.type === 'childList' && mutation.addedNodes.length > 0) {
        this.scrollToBottom()
        break
      }
    }
  }

  scrollToBottom() {
    console.log("Scrolling to bottom")
    if (this.hasMessagesTarget) {
      this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight
    } else {
      console.log("Messages target not found")
    }
  }

  messageCreated(event) {
    console.log("Message created")
    if (this.hasInputTarget) {
      this.inputTarget.value = ""
    } else {
      console.log("Input target not found")
    }
  }
}