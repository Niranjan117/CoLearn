import { gsap } from 'gsap'
import Matter from 'matter-js'
import 'matter-attractors'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

Matter.use('matter-attractors')

export function homeMatter(element: Element) {
  let fadeInOutAnimation: GSAPAnimation,
    scrollTriggerInstance: ScrollTrigger,
    engine: Matter,
    render: Matter,
    runner: Matter
  let mm = gsap.matchMedia()

  const init = (): void => {
    mm.add('(min-width: 850px)', () => {
      const animationContainer = element.querySelector('.animation')

      fadeInOutAnimation = gsap.fromTo(animationContainer, { opacity: 0 }, { opacity: 1 })

      scrollTriggerInstance = ScrollTrigger.create({
        trigger: animationContainer,
        animation: fadeInOutAnimation,
        start: '25% bottom',
        end: '50% top',
        toggleActions: 'play reverse play reverse'
      })

      // Create a matter physics simulation engine and a debugging canvas renderer. We won't need to do
      // this ourselves when working with Phaser later.
      engine = Matter.Engine.create()
      engine.world.gravity.scale = 0
      render = Matter.Render.create({
        element: animationContainer,
        engine: engine,
        options: {
          width: window.innerWidth,
          height: window.innerHeight * 2,
          wireframes: false,
          background: 'transparent'
        }
      })

      // Add the BALLS
      var balls = Matter.Composites.stack(20, 20, 7, 2, 0, 0, function (x, y) {
        return Matter.Bodies.polygon(x, y, 1, Matter.Common.random(5, 150), {
          render: { fillStyle: '#CEFE02' },
          frictionAir: 0,
          friction: 0.0001,
          restitution: 0.5,
          mass: 0.8
        })
      })

      // create a body with an attractor
      var attractiveBody = Matter.Bodies.circle(render.options.width / 2, render.options.height / 2, 50, {
        isStatic: true,
        render: { fillStyle: 'transparent', strokeStyle: 'transparent', lineWidth: 0 },

        // example of an attractor function that
        // returns a force vector that applies to bodyB
        plugin: {
          attractors: [
            function (bodyA, bodyB) {
              return {
                x: (bodyA.position.x - bodyB.position.x) * 1e-6,
                y: (bodyA.position.y - bodyB.position.y) * 1e-6
              }
            }
          ]
        }
      })

      Matter.Events.on(engine, 'afterUpdate', function () {
        if (!mouse.position.x) {
          return
        }

        // smoothly move the attractor body towards the mouse
        Matter.Body.translate(attractiveBody, {
          x: (mouse.position.x - attractiveBody.position.x) * 0.25,
          y: (mouse.position.y - attractiveBody.position.y) * 0.25
        })
      })

      // Create slippery, static floors and walls. The walls are positioned off screen. A static body
      // can't move or rotate.
      const floor = Matter.Bodies.rectangle(
        window.innerWidth,
        window.innerHeight * 2 + 26,
        -window.innerWidth * 2,
        50,
        {
          isStatic: true
        }
      )
      const ceiling = Matter.Bodies.rectangle(window.innerWidth, -26, -window.innerWidth * 2, 50, {
        isStatic: true
      })
      const leftWall = Matter.Bodies.rectangle(-25, window.innerHeight, 50, window.innerHeight, {
        isStatic: true
      })
      const rightWall = Matter.Bodies.rectangle(
        window.innerWidth + 25,
        window.innerHeight / 2,
        50,
        window.innerHeight,
        {
          isStatic: true
        }
      )

      // Add mouse control to the simulation. This will allow us to drag and drop the balls.
      const mouse = Matter.Mouse.create(render.canvas)

      // set mouse to be intiially position at the top of the canvas
      mouse.position.x = 0
      mouse.position.y = 0

      const mouseConstraint = Matter.MouseConstraint.create(engine, {
        mouse: mouse,
        constraint: {
          stiffness: 0.2,
          render: {
            visible: false
          }
        }
      })
      Matter.World.add(engine.world, mouseConstraint)

      // Bodies won't do anything unless they are added to the world
      Matter.World.add(engine.world, [floor, ceiling, leftWall, rightWall, balls, attractiveBody])

      // Kick off the simulation and the render loops
      Matter.Render.run(render)
      runner = Matter.Runner.create()
      Matter.Runner.run(runner, engine)
    })
  }

  const destroy = (): void => {
    // Kill GSAP animations and ScrollTriggers
    if (fadeInOutAnimation) fadeInOutAnimation?.kill()
    if (scrollTriggerInstance) scrollTriggerInstance?.kill()

    mm.revert()

    // Stop the Matter.js engine and clear the worldMatter.Runner.stop(runner)
    if (render) {
      Matter.Render.stop(render)
      Matter.Engine.clear(engine)
      Matter.Runner.stop(runner)
      Matter.World.clear(engine.world)
      render.canvas.remove();
      render.canvas = null;
      render.context = null;
      render.textures = {};
    }
  }

  return {
    init,
    destroy
  }
}
