import { gsap } from 'gsap'
import lottie, { LottiePlayer } from 'lottie-web'
import animationData from '../lottie/main-page-cta.json'

interface MouseCoordinates {
  x: number
  y: number
}

export function ctaSection(element: HTMLElement) {
  const cursor = element.querySelector('.cursor') as HTMLElement
  const target: EventTarget = element
  const mouse: MouseCoordinates = { x: 0, y: 0 }
  const lottieEl: HTMLElement = element.querySelector('.lottie') as HTMLElement
  let lottieAnimation: LottiePlayer
  let mm = gsap.matchMedia()

  let animationFrameId: number = 0 // ID of the animation frame

  const updateCoordinates = (e: MouseEvent) => {
    mouse.x = e.clientX
    mouse.y = e.clientY
  }

  const updateCursor = () => {
    const translate = `translate3d(${mouse.x}px, ${mouse.y}px, 0)`

    cursor.style.transform = translate
  }

  function loop() {
    updateCursor()
    animationFrameId = requestAnimationFrame(loop)
  }

  const init = () => {
    mm.add('(min-width: 769px)', () => {
      target.addEventListener('mousemove', updateCoordinates)

      // When the mouse enters the element, add the class 'hover' to the cursor element.
      element.addEventListener('mouseenter', () => {
        cursor.classList.add('hover')
      })

      // When the mouse leaves the element, remove the class 'hover' from the cursor element.
      element.addEventListener('mouseleave', () => {
        cursor.classList.remove('hover')
      })

      animationFrameId = requestAnimationFrame(loop)
    })
  }

  mm.add('(min-width: 850px)', () => {
    lottieAnimation = lottie.loadAnimation({
      container: lottieEl,
      renderer: 'canvas',
      loop: true,
      autoplay: true,
      animationData: animationData,
    })
  })

  mm.add('(max-width: 849px)', () => {
    lottieAnimation = lottie.loadAnimation({
      container: lottieEl,
      renderer: 'svg',
      loop: true,
      autoplay: true,
      animationData: animationData,
      rendererSettings: {
        preserveAspectRatio: 'xMinYMid slice'
      }
    })
  })

  const destroy = () => {
    mm.revert()

    target.removeEventListener('mousemove', updateCoordinates)

    element.removeEventListener('mouseenter', () => {
      cursor.classList.add('hover')
    })

    element.removeEventListener('mouseleave', () => {
      cursor.classList.remove('hover')
    })

    if (animationFrameId) cancelAnimationFrame(animationFrameId)
    if (lottieAnimation) lottieAnimation.destroy()
  }

  return { init, destroy }
}
