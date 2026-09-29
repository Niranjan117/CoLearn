import { gsap } from 'gsap'

export function newsletterLightbox(element: HTMLElement) {
  let controller: AbortController | null = null;
  let signal: AbortSignal | null = null;
  const trigger = element.querySelector('[data-newsletter-trigger] button') as HTMLElement
  const lightbox: HTMLElement = document.querySelector('[data-lightbox="newsletter"]') as HTMLElement
  const portal: HTMLElement = document.querySelector('.portal') as HTMLElement
  const close: HTMLButtonElement = lightbox.querySelector('.close') as HTMLButtonElement
  const form: HTMLElement = document.querySelector('.hidden-forms #gform_wrapper_3') as HTMLElement
  const formContainer: HTMLElement = lightbox.querySelector('.form-container') as HTMLElement

  function moveLightboxToPortal() {
    portal.appendChild(lightbox)

    if (form) {
      formContainer.appendChild(form)
    }
  }

  function handleLightboxOpen() {
    lightbox.classList.add('active')
    portal.classList.add('active')

    if (window.lenis) {
      window.lenis?.stop()
    }
  }

  function handleLightboxClose() {
    lightbox.classList.remove('active')
    portal.classList.remove('active')

    if (window.lenis) {
      window.lenis?.start()
    }
  }
  
  function init() {
    controller = new AbortController();
    signal = controller.signal;

    moveLightboxToPortal()
    trigger.addEventListener('click', () => handleLightboxOpen(), { signal })
    close.addEventListener('click', () => handleLightboxClose(), { signal })
  }

  function destroy() {
    if (controller) {
      controller.abort();
    }
    trigger.removeEventListener('click', handleLightboxOpen);
    close.removeEventListener('click', handleLightboxClose);
  }

  return {
    init,
    destroy
  }
}
