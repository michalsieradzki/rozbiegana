// app/javascript/controllers/chat_controller.js - wersja debug
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { roomId: String }
  
  connect() {
    console.log("Chat controller connected")
    console.log("Room ID value:", this.roomIdValue)
    console.log("Container element:", this.element)
    
    // Sprawdźmy czy element istnieje
    const messagesContainer = this.element.querySelector(`#room_${this.roomIdValue}_messages`)
    console.log("Messages container selector:", `#room_${this.roomIdValue}_messages`)
    console.log("Messages container found:", messagesContainer)
    
    // Sprawdźmy wszystkie elementy w kontenerze
    console.log("All elements in container:", this.element.children)
    
    this.scrollToBottom()
    this.observeMessages()
  }
  
  observeMessages() {
    // Użyj class zamiast ID
    const messagesContainer = this.element.querySelector('.messages-container')
    console.log("Messages container by class:", messagesContainer)
    
    if (messagesContainer) {
      this.observer = new MutationObserver(() => {
        setTimeout(() => this.scrollToBottom(), 50)
      })
      this.observer.observe(messagesContainer, { childList: true })
    } else {
      console.error("Cannot find .messages-container!")
      // Debug - sprawdź wszystkie dzieci
      console.log("All children:", Array.from(this.element.children))
    }
  }
  
  scrollToBottom() {
    console.log("Scrolling to bottom...")
    
    // Sprawdź czy kontener ma scroll
    console.log("Scroll info:", {
      scrollTop: this.element.scrollTop,
      scrollHeight: this.element.scrollHeight,
      clientHeight: this.element.clientHeight
    })
    
    // Prosta metoda scroll
    this.element.scrollTop = this.element.scrollHeight
    
    console.log("After scroll:", this.element.scrollTop)
  }
  
  disconnect() {
    if (this.observer) {
      this.observer.disconnect()
    }
  }
}