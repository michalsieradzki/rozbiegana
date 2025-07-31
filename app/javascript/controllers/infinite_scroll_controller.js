import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container", "loadingIndicator"]
  static values = { 
    url: String,
    page: Number,
    hasMore: Boolean 
  }

  connect() {
    this.pageValue = 1
    this.hasMoreValue = true
    this.loading = false
    
    // Obserwujemy scroll na window
    this.boundHandleScroll = this.handleScroll.bind(this)
    window.addEventListener('scroll', this.boundHandleScroll)
  }

  disconnect() {
    window.removeEventListener('scroll', this.boundHandleScroll)
  }

  handleScroll() {
    // Sprawdzamy czy jesteśmy blisko końca strony
    if (this.nearBottom() && this.hasMoreValue && !this.loading) {
      this.loadMore()
    }
  }

  nearBottom() {
    const scrollTop = window.pageYOffset
    const windowHeight = window.innerHeight
    const documentHeight = document.documentElement.scrollHeight
    
    // Ładujemy gdy zostało 200px do końca
    return scrollTop + windowHeight >= documentHeight - 200
  }

  async loadMore() {
    if (this.loading || !this.hasMoreValue) return
    
    this.loading = true
    this.showLoadingIndicator()
    
    try {
      this.pageValue += 1
      const response = await fetch(`${this.urlValue}?page=${this.pageValue}`, {
        headers: {
          'Accept': 'text/html',
          'X-Requested-With': 'XMLHttpRequest'
        }
      })
      
      if (response.ok) {
        const html = await response.text()
        
        if (html.trim() === '') {
          // Brak więcej aktywności
          this.hasMoreValue = false
        } else {
          // Dodajemy nowe aktywności do kontenera
          this.containerTarget.insertAdjacentHTML('beforeend', html)
        }
      }
    } catch (error) {
      console.error('Błąd ładowania aktywności:', error)
    } finally {
      this.loading = false
      this.hideLoadingIndicator()
    }
  }

  showLoadingIndicator() {
    if (this.hasLoadingIndicatorTarget) {
      this.loadingIndicatorTarget.style.display = 'block'
    }
  }

  hideLoadingIndicator() {
    if (this.hasLoadingIndicatorTarget) {
      this.loadingIndicatorTarget.style.display = 'none'
    }
  }
} 