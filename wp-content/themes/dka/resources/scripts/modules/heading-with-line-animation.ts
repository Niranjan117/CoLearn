import { gsap } from 'gsap'
import { SplitText } from 'gsap/SplitText'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(SplitText, ScrollTrigger)

export function headingWithLineAnimation(element: HTMLElement) {
  let split1: SplitText, split2: SplitText, tl: GSAPTimeline
  let mm = gsap.matchMedia()

  function init(): void {
    mm.add('(min-width: 850px)', () => {
      const text = element.querySelector('.text-reveal')
      const line = element.querySelector('.line')

      split1 = new SplitText(text, {
        type: 'lines',
        linesClass: 'line-child',
        tag: 'span'
      })

      split2 = new SplitText(text, {
        type: 'lines',
        linesClass: 'line-parent',
        tag: 'span'
      })

      tl = gsap.timeline({
        scrollTrigger: {
          trigger: element,
          start: 'top+=100px bottom',
          toggleActions: 'play none play none'
        }
      })

      gsap.set(text, { opacity: 1 })

      if (line) {
        tl.to(element.querySelectorAll('.line-child'), {
          y: 0,
          stagger: 0.1
        }).to(
          line,
          {
            scaleX: 1
          },
          '<'
        )
      } else {
        tl.to(element.querySelectorAll('.line-child'), {
          y: 0,
          stagger: 0.1
        })
      }
    })
  }

  function destroy(): void {
    if (split1) {
      split1.revert()
    }
    if (split2) {
      split2.revert()
    }
    if (tl) {
      tl.kill()
    }
    gsap.set(element, { clearProps: 'all' })
    mm.revert()
  }

  return {
    init,
    destroy
  }
}
