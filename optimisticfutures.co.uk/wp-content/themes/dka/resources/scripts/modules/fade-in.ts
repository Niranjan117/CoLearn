import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

export function fadeIn() {
  let triggers: ScrollTrigger[] = []
  let mm = gsap.matchMedia()

  const elementsToAnimate = document.querySelectorAll('[data-module="fade-in"]')

  const animation = () => {
    if (elementsToAnimate.length) {
      triggers = ScrollTrigger.batch(elementsToAnimate, {
        start: 'top+=100px bottom',
        onEnter: e =>
          gsap.to(e, {
            opacity: 1,
            duration: 0.6,
            ease: 'none',
            stagger: 0.05
          })
      })
    }
  }

  function init() {
    mm.add('(min-width: 769px)', () => {
      animation()
    })
  }

  function destroy() {
    triggers.forEach(trigger => trigger.kill()) // Kill each ScrollTrigger
    triggers = [] // Empty the array
    mm.revert()
  }

  return {
    init,
    destroy
  }
}
