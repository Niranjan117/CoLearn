import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

export function molecule(element: HTMLElement) {
  let tl: GSAPTimeline
  let mm = gsap.matchMedia()

  const init = (): void => {

    mm.add('(min-width: 769px)', () => {
      tl = gsap.timeline({
        repeat: -1,
        yoyo: true,
        scrollTrigger: {
          trigger: element,
          start: 'top-=20% bottom',
          end: 'bottom-=20% top',
          toggleActions: 'play pause play pause'
        }
      })

      tl.to(element, {
        duration: gsap.utils.random(0.5, 2),
        x: gsap.utils.random(-20, 20),
        y: gsap.utils.random(-20, 20),
        ease: 'power1.inOut'
      })
        .to(element, {
          duration: gsap.utils.random(0.5, 2),
          x: gsap.utils.random(-20, 20),
          y: gsap.utils.random(-20, 20),
          ease: 'power1.inOut'
        })
        .to(element, {
          duration: gsap.utils.random(0.5, 2),
          x: gsap.utils.random(-20, 20),
          y: gsap.utils.random(-20, 20),
          ease: 'power1.inOut'
        })
        .to(element, {
          duration: gsap.utils.random(0.5, 2),
          x: gsap.utils.random(-20, 20),
          y: gsap.utils.random(-20, 20),
          ease: 'power1.inOut'
        })
    })
  }

  const destroy = (): void => {
    if (tl) {
      tl.kill()
    }

    mm.revert()
  }

  return {
    init,
    destroy
  }
}
