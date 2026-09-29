import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

export function footer(element: HTMLElement) {
  const footerInner = element.querySelector('.footer-inner')
  let trigger: GSAPTween | null = null
  let mm = gsap.matchMedia()

  function init() {
    mm.add('(min-width: 850px)', () => {
      trigger = gsap.fromTo(
        footerInner,
        {
          yPercent: '-25'
        },
        {
          yPercent: 0,
          ease: 'none',
          scrollTrigger: {
            trigger: element,
            start: `top bottom`,
            end: `bottom bottom`,
            scrub: true
          }
        }
      )
    })
  }

  function destroy() {
    if (trigger && trigger.scrollTrigger) {
      trigger.scrollTrigger.kill() // Kill the ScrollTrigger
      trigger = null
    }
    gsap.set(footerInner, { clearProps: 'all' }) // Clear gsap properties
    mm.revert()
  }

  return {
    init,
    destroy
  }
}
