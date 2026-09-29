import { gsap } from 'gsap'
import { DrawSVGPlugin } from 'gsap/DrawSVGPlugin'
import Swiper from 'swiper';
import { Autoplay, Navigation, Parallax } from 'swiper/modules';

gsap.registerPlugin(DrawSVGPlugin)

export function workCarousel(element: Element) {
  const swiperEl: HTMLElement = element.querySelector('.swiper') as HTMLElement
  const progressSvg: HTMLElement = element.querySelector('.progress') as HTMLElement
  const nextButton: HTMLElement = element.querySelector('.pagination-button.next') as HTMLElement
  const prevButton: HTMLElement = element.querySelector('.pagination-button.prev') as HTMLElement
  const circle: SVGElement = progressSvg.querySelector('circle') as SVGElement
  let swiper: Swiper | null = null
  let observer: IntersectionObserver | null = null
  let circleAnimation: GSAPTimeline; 

  const handlePaginationHover = () => {
    swiper?.autoplay.stop();
    circleAnimation?.pause();
  }
  
  const handlePaginationUnhover = () => {
    swiper?.autoplay.start();
    circleAnimation?.restart();
  }

  const init = (): void => {
    // The options for the IntersectionObserver
    const observerOptions = {
      rootMargin: '100px 0px',
      threshold: 0
    }

    // Set the progress SVG/circle to 0% initially
    gsap.set(circle, { drawSVG: '0%' })

    circleAnimation = gsap.timeline({ repeat: -1, paused: true })
    circleAnimation.fromTo(circle, { drawSVG: '0%' }, { duration: 3.5, drawSVG: '100%', ease: 'linear' })

    // Callback function to be executed when the intersection changes
    const observerCallback: IntersectionObserverCallback = (entries, observer) => {
      entries.forEach(entry => {
        if (entry.isIntersecting && !swiper) {
            swiper = new Swiper(swiperEl, {
              modules: [Autoplay, Navigation, Parallax],
              loop: true,
              parallax: true,
              autoplay: {
                delay: 3500,
                pauseOnMouseEnter: false,
                disableOnInteraction: false,
                waitForTransition: false
              },
              navigation: {
                nextEl: nextButton,
                prevEl: prevButton
              },
              slidesPerView: 1,
              speed: 1000,
              grabCursor: true,
              longSwipesRatio: 0.01
            })

            // Animate the initial slide
            circleAnimation.restart()

            // Restart the animation each time the slide changes
            swiper.on('slideChange', () => {
              circleAnimation.restart()
            })

            swiper.on('slideChangeTransitionStart', swiper => {
              const thisLinkElm: HTMLElement | null = element.querySelector(
                `.carousel-text-overlay [data-index="${swiper.realIndex}"]`
              )

              if (thisLinkElm !== null) {
                const thisLink: string = thisLinkElm.dataset.link ?? ''
                const ctaElm: HTMLAnchorElement = element.querySelector('.cta-button') as HTMLAnchorElement

                ctaElm.href = thisLink
                const allTextElms = Array.from(element.querySelectorAll('.carousel-text-overlay p'))

                // Fade out the old text element and fade in the new one
                gsap.to(allTextElms, { duration: 1, opacity: 0, ease: 'power2.inOut' })
                gsap.to(allTextElms[swiper.realIndex], { duration: 1, opacity: 1, ease: 'power2.inOut' })
              }
            })
        }

        if (swiper) {
          // Pause and resume autoplay based on the visibility of the element
          if (entry.isIntersecting) {
            swiper.autoplay.start()
            circleAnimation.restart()
          } else {
            swiper.autoplay.stop()
            circleAnimation.pause()
          }
        }
      })
    }

    // Create the IntersectionObserver and observe the element
    observer = new IntersectionObserver(observerCallback, observerOptions)
    observer.observe(element)

    nextButton.addEventListener('mouseenter', handlePaginationHover);
    nextButton.addEventListener('mouseleave', handlePaginationUnhover);
    prevButton.addEventListener('mouseenter', handlePaginationHover);
    prevButton.addEventListener('mouseleave', handlePaginationUnhover);
  }

  const destroy = (): void => {
    if (swiper) {
      swiper.destroy(true, true)
      swiper = null
    }

    if (observer) {
      observer.disconnect()
      observer = null
    }

    gsap.killTweensOf(progressSvg)
    nextButton.removeEventListener('mouseenter', handlePaginationHover);
    nextButton.removeEventListener('mouseleave', handlePaginationUnhover);
    prevButton.removeEventListener('mouseenter', handlePaginationHover);
    prevButton.removeEventListener('mouseleave', handlePaginationUnhover);
  }

  return {
    init,
    destroy
  }
}
