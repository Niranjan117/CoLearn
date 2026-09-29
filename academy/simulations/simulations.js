(() => {
  const simulations = {
    dam: {
      title: "Hydroelectric power",
      source: "/Dam/Dam%20Simulation/mm/neue-energien/wasserkraft/index.html",
    },
    solar: {
      title: "Solar thermal",
      source: "/Solar/Solar%20Panel/mm/neue-energien/solarthermie/index.html",
    },
    wind: {
      title: "Wind power",
      source: "/Wind%20Power/Wind%20Power/mm/neue-energien/windkraft/index.html",
    },
  };

  const frame = document.querySelector("#simulation-frame");
  const title = document.querySelector("#simulation-view-title");
  const instructions = document.querySelector("#simulation-instructions");

  function launch(name) {
    const simulation = simulations[name];
    if (!simulation) return;
    frame.src = simulation.source;
    frame.title = `${simulation.title} interactive simulation`;
    title.textContent = simulation.title;
    instructions.textContent = "Simulation controls are provided by the original learning activity. Use the full-screen control for an expanded view.";
    document.querySelectorAll("[data-simulation]").forEach((button) => {
      button.setAttribute("aria-pressed", String(button.dataset.simulation === name));
    });
  }

  document.querySelectorAll("[data-simulation]").forEach((button) => {
    button.addEventListener("click", () => launch(button.dataset.simulation));
  });
  document.querySelectorAll("[data-launch-simulation]").forEach((button) => {
    button.addEventListener("click", () => {
      launch(button.dataset.launchSimulation);
      document.querySelector(".colearn-active-simulation").scrollIntoView({ behavior: "smooth" });
    });
  });
})();
