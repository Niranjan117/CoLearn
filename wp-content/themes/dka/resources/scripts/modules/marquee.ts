export function marqueeAnimation(marquee: HTMLElement) {
  let observer: IntersectionObserver | null = null

  const init = () => {
    // Create an observer
    observer = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        // There can be multiple inner elements, so we need to loop through them
        entry.target.querySelectorAll('.inner').forEach((inner: Element) => {
          const innerHTMLElement = inner as HTMLElement
          // If the marquee is in view, play the animation
          if (entry.isIntersecting) {
            innerHTMLElement.style.animationPlayState = 'running'
          } else {
            // If the marquee is not in view, pause the animation
            innerHTMLElement.style.animationPlayState = 'paused'
          }
        })
      })
    })

    // Observe the marquee element
    observer.observe(marquee)
  }

  const destroy = () => {
    // If the observer was created, disconnect it
    if (observer) {
      observer.disconnect()
      observer = null
    }

    // Reset the CSS property of the marquee's child elements
    marquee.querySelectorAll('.inner').forEach((inner: Element) => {
      const innerHTMLElement = inner as HTMLElement
      innerHTMLElement.style.animationPlayState = 'initial'
    })
  }

  return {
    init,
    destroy
  }
}
