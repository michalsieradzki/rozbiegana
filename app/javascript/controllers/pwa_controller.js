import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["installButton", "devTools"]
  
  connect() {
    console.log('[PWA Controller] Connected!')
    console.log('[PWA] User Agent:', navigator.userAgent)
    console.log('[PWA] Browser:', this.detectBrowser())
    
    this.deferredPrompt = null
    this.setupInstallPrompt()
    this.setupDevMode()
    this.checkPWARequirements()
    
    // Wait longer for beforeinstallprompt in development
    if (window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1') {
      setTimeout(() => {
        this.checkInstallPrompt()
      }, 10000) // Wait 10 seconds
    }
  }

  detectBrowser() {
    const userAgent = navigator.userAgent
    if (userAgent.includes('Chrome')) return 'Chrome'
    if (userAgent.includes('Safari') && !userAgent.includes('Chrome')) return 'Safari'
    if (userAgent.includes('Firefox')) return 'Firefox'
    if (userAgent.includes('Edge')) return 'Edge'
    return 'Unknown'
  }

  setupInstallPrompt() {
    window.addEventListener('beforeinstallprompt', (e) => {
      console.log('[PWA] Real install prompt available!')
      e.preventDefault()
      this.deferredPrompt = e
      if (this.hasInstallButtonTarget) {
        this.installButtonTarget.style.display = 'block'
        console.log('[PWA] Install button shown')
      }
    })

    window.addEventListener('appinstalled', () => {
      console.log('[PWA] App installed successfully!')
      if (this.hasInstallButtonTarget) {
        this.installButtonTarget.style.display = 'none'
      }
      this.deferredPrompt = null
    })
  }

  setupDevMode() {
    console.log('[PWA Controller] Setting up dev mode, hostname:', window.location.hostname)
    // Show dev tools in development
    if (window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1') {
      if (this.hasDevToolsTarget) {
        console.log('[PWA Controller] Showing dev tools')
        this.devToolsTarget.style.display = 'block'
      }
    }
  }

  checkPWARequirements() {
    console.log('[PWA] Checking requirements...')
    
    // Check if service worker is registered
    if ('serviceWorker' in navigator) {
      navigator.serviceWorker.getRegistration().then(registration => {
        if (registration) {
          console.log('[PWA] Service Worker registered:', registration.scope)
        } else {
          console.log('[PWA] No Service Worker registered')
        }
      })
    } else {
      console.log('[PWA] Service Worker not supported')
    }

    // Check if manifest is loaded
    const manifestLink = document.querySelector('link[rel="manifest"]')
    if (manifestLink) {
      console.log('[PWA] Manifest link found:', manifestLink.href)
      fetch(manifestLink.href)
        .then(response => response.json())
        .then(manifest => {
          console.log('[PWA] Manifest loaded:', manifest)
        })
        .catch(error => {
          console.error('[PWA] Manifest error:', error)
        })
    } else {
      console.log('[PWA] No manifest link found')
    }

    // Check if app is already installed
    if (window.matchMedia('(display-mode: standalone)').matches) {
      console.log('[PWA] App is already installed (standalone mode)')
    } else {
      console.log('[PWA] App is not installed (browser mode)')
    }

    // Check PWA criteria
    this.checkPWACriteria()
  }

  checkPWACriteria() {
    console.log('[PWA] Checking PWA criteria...')
    
    // Check if running in secure context
    console.log('[PWA] Secure context:', window.isSecureContext)
    
    // Check if manifest is valid
    const manifestLink = document.querySelector('link[rel="manifest"]')
    if (manifestLink) {
      fetch(manifestLink.href)
        .then(response => response.json())
        .then(manifest => {
          console.log('[PWA] Manifest validation:')
          console.log('- name:', manifest.name ? '✓' : '✗')
          console.log('- short_name:', manifest.short_name ? '✓' : '✗')
          console.log('- start_url:', manifest.start_url ? '✓' : '✗')
          console.log('- display:', manifest.display ? '✓' : '✗')
          console.log('- icons:', manifest.icons && manifest.icons.length > 0 ? '✓' : '✗')
        })
    }
  }

  checkInstallPrompt() {
    console.log('[PWA] Checking if install prompt should be available...')
    if (!this.deferredPrompt) {
      console.log('[PWA] Install prompt not available after 10 seconds')
      console.log('[PWA] This might be because:')
      console.log('1. App is already installed')
      console.log('2. Manifest has errors')
      console.log('3. Service worker issues')
      console.log('4. Chrome needs more time')
      console.log('5. User engagement too low')
      
      // Try to trigger install prompt manually
      console.log('[PWA] Trying to trigger install prompt manually...')
      this.triggerInstallPrompt()
    }
  }

  triggerInstallPrompt() {
    // Sometimes Chrome needs user interaction to show install prompt
    console.log('[PWA] Manual install prompt trigger - this is a workaround')
    if (this.hasInstallButtonTarget) {
      this.installButtonTarget.style.display = 'block'
      this.installButtonTarget.textContent = 'Zainstaluj (Manual)'
    }
  }

  install(event) {
    console.log('[PWA] Install clicked, deferredPrompt:', this.deferredPrompt)
    
    if (!this.deferredPrompt) {
      alert('Install prompt not available. Check console for PWA requirements.')
      return
    }

    this.deferredPrompt.prompt()
    
    // Fix: Check if userChoice exists (for real PWA) or handle simulation
    if (this.deferredPrompt.userChoice) {
      this.deferredPrompt.userChoice.then((choiceResult) => {
        if (choiceResult.outcome === 'accepted') {
          console.log('[PWA] User accepted the install prompt')
        } else {
          console.log('[PWA] User dismissed the install prompt')
        }
        this.deferredPrompt = null
      })
    } else {
      // For simulation, the prompt() returns a promise with userChoice
      this.deferredPrompt.prompt().then((result) => {
        if (result && result.userChoice) {
          result.userChoice.then((choiceResult) => {
            if (choiceResult.outcome === 'accepted') {
              console.log('[PWA] User accepted the install prompt')
            } else {
              console.log('[PWA] User dismissed the install prompt')
            }
            this.deferredPrompt = null
          })
        }
      })
    }
  }

  // Development helper methods
  clearCaches(event) {
    console.log('[PWA DEV] Clearing caches...')
    if ('caches' in window) {
      caches.keys().then(function(cacheNames) {
        cacheNames.forEach(function(cacheName) {
          caches.delete(cacheName)
          console.log('[PWA DEV] Deleted cache:', cacheName)
        })
      }).then(() => {
        alert('Cache cleared! Refresh the page.')
      })
    }
  }

  forceUpdate(event) {
    console.log('[PWA DEV] Force update...')
    if ('serviceWorker' in navigator && navigator.serviceWorker.controller) {
      navigator.serviceWorker.controller.postMessage({ command: 'skipWaiting' })
      window.location.reload()
    }
  }

  // New method to force show install button for testing
  forceShowInstall(event) {
    console.log('[PWA DEV] Force showing install button...')
    if (this.hasInstallButtonTarget) {
      this.installButtonTarget.style.display = 'block'
      // Create a fake deferred prompt for testing
      this.deferredPrompt = {
        prompt: () => {
          return new Promise((resolve) => {
            const result = confirm('Czy chcesz zainstalować aplikację Rozbiegana?')
            resolve({
              userChoice: Promise.resolve({
                outcome: result ? 'accepted' : 'dismissed'
              })
            })
          })
        }
      }
    }
  }
}
