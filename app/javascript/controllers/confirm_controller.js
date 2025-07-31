// app/javascript/controllers/confirm_controller.js
import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"

export default class extends Controller {
  static values = { 
    message: String, 
    type: String 
  }

  static targets = ["modal"]

  connect() {
    this.ensureModalExists()
  }

  ensureModalExists() {
    // Sprawdź czy modal już istnieje
    let existingModal = document.getElementById('confirmModal')
    
    if (!existingModal) {
      this.createModal()
      existingModal = document.getElementById('confirmModal')
    }
    
    // Utwórz instancję Bootstrap Modal tylko raz
    if (!window.confirmModalInstance) {
      window.confirmModalInstance = new Modal(existingModal)
    }
    
    this.modal = window.confirmModalInstance
  }

  createModal() {
    const modalHTML = `
      <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header bg-danger text-white">
              <h5 class="modal-title" id="confirmModalLabel">
                <i class="bi bi-exclamation-triangle me-2"></i>
                Potwierdź akcję
              </h5>
              <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <p id="confirmModalBody">Czy na pewno chcesz wykonać tę akcję?</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Anuluj</button>
              <button type="button" class="btn btn-danger" id="confirmModalButton">Potwierdź</button>
            </div>
          </div>
        </div>
      </div>
    `

    document.body.insertAdjacentHTML('beforeend', modalHTML)
  }

  show(event) {
    event.preventDefault()
    
    const message = this.messageValue || "Czy na pewno chcesz wykonać tę akcję?"
    const type = this.typeValue || "danger"
    
    // Update modal content
    document.getElementById('confirmModalBody').textContent = message
    
    // Update modal styling
    const modalHeader = document.querySelector('#confirmModal .modal-header')
    const confirmButton = document.getElementById('confirmModalButton')
    
    // Reset classes
    modalHeader.className = 'modal-header text-white'
    confirmButton.className = 'btn'
    
    // Apply type-specific styling
    switch(type) {
      case 'warning':
        modalHeader.classList.add('bg-warning', 'text-dark')
        confirmButton.classList.add('btn-warning')
        break
      case 'info':
        modalHeader.classList.add('bg-info')
        confirmButton.classList.add('btn-info')
        break
      default:
        modalHeader.classList.add('bg-danger')
        confirmButton.classList.add('btn-danger')
    }

    // Store the form reference
    this.targetForm = this.element.tagName === 'FORM' ? this.element : this.element.closest('form')
    
    // Ensure modal works
    this.ensureModalExists()
    
    // Clear any existing handlers
    const confirmBtn = document.getElementById('confirmModalButton')
    confirmBtn.onclick = null
    
    // Set up new confirm button handler
    confirmBtn.onclick = (e) => {
      e.preventDefault()
      this.modal.hide()
      
      // Small delay to let modal hide animation complete
      setTimeout(() => {
        if (this.targetForm) {
          // Remove stimulus controller to prevent re-showing modal
          this.targetForm.removeAttribute('data-controller')
          this.targetForm.submit()
        }
      }, 150)
    }
    
    // Show modal
    this.modal.show()
  }

  disconnect() {
    // Cleanup when controller is removed
    if (this.modal) {
      this.modal.hide()
    }
  }
}
