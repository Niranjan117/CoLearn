import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

export function homeServicesWork(element: Element) {
  let bodyScrollTrigger: ScrollTrigger
  let ampersandScrollTrigger: ScrollTrigger
  let ampersandOpacityTrigger: ScrollTrigger
  let timeline: GSAPTimeline
  let mm : any = gsap.matchMedia()

  const init = (): void => {
    mm.add('(min-width: 850px)', () => {
      const body = document.querySelector('body')
      const workPanel = element.querySelector('.home-work')
      const servicesPanel = element.querySelector('.home-services')

      const transitionBackgroundColor = (color: string, duration: number = 0.3) => {
        gsap.to(body, {
          duration,
          backgroundColor: color,
          ease: 'none'
        })
      }

      bodyScrollTrigger = ScrollTrigger.create({
        trigger: workPanel,
        start: 'top bottom',
        end: 'bottom top',
        onEnter: () => {
          transitionBackgroundColor('#d3c3ac')
        },
        onLeave: () => {
          transitionBackgroundColor('#f7f5f2')
        },
        onEnterBack: () => {
          transitionBackgroundColor('#d3c3ac', 0)
        },
        onLeaveBack: () => {
          transitionBackgroundColor('#f7f5f2')
        }
      })

      const ampersand = element.querySelector('.ampersand')
      const ampersandSvg = element.querySelector('.ampersand svg')
      const workCarousel = document.querySelector('.work-carousel')


      ampersandScrollTrigger = ScrollTrigger.create({
        trigger: ampersand,
        endTrigger: workCarousel,
        start: 'top top',
        end: 'top top',
        pin: true
      })

      ampersandOpacityTrigger = ScrollTrigger.create({
        trigger: ampersand,
        endTrigger: servicesPanel,
        start: 'top top',
        end: '+=300',
        onLeave: () => {
          gsap.to(ampersand, { opacity: 1 })
        },
        onEnterBack: () => {
          gsap.to(ampersand, { opacity: 0, duration: 0.25 })
        }
      })

      timeline = gsap.timeline({
        scrollTrigger: {
          trigger: ampersand,
          endTrigger: workCarousel,
          start: 'top bottom-=80%'
        }
      })

      timeline.to(ampersandSvg, {
        duration: 1,
        opacity: 1,
        rotate: 0,
        ease: 'power2.out'
      })
    })
  }

  const destroy = (): void => {
    // Kill GSAP animations and ScrollTriggers
    if (bodyScrollTrigger) bodyScrollTrigger.kill()
    if (ampersandScrollTrigger) ampersandScrollTrigger.kill()
    if (timeline) timeline.kill()
    mm.revert()
  }

  return {
    init,
    destroy
  }
}
