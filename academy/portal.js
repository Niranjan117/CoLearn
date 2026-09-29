(() => {
  const root = document.querySelector("#colearn-portal");
  if (!root) return;

  const storageKey = "colearn-ncct-demo";
  const initialState = {
    enrolled: [],
    completedModules: [0, 1, 2],
    currentModule: 3,
    quizPassed: false,
    attendanceCheckedIn: false,
    savedJobs: [],
    dismissedNotifications: [],
    certificateId: "",
  };

  let state = initialState;
  try {
    const savedState = JSON.parse(localStorage.getItem(storageKey));
    if (savedState && typeof savedState === "object") {
      state = { ...initialState, ...savedState };
    }
  } catch {
    state = initialState;
  }

  const save = () => localStorage.setItem(storageKey, JSON.stringify(state));
  const feedback = (id, message) => {
    const target = root.querySelector(`#${id}`);
    if (target) target.textContent = message;
  };
  const modules = [...root.querySelectorAll("[data-module-index]")];
  const completed = new Set(state.completedModules);

  function updateCertificate() {
    const ready = completed.size === modules.length && state.quizPassed;
    const downloadButton = root.querySelector("#download-certificate");
    const status = root.querySelector("#certificate-status");
    downloadButton.disabled = !ready;
    status.textContent = ready
      ? `Course complete · Certificate ${state.certificateId || "ready to generate"}`
      : "In progress · Complete all modules and pass the assessment to unlock your certificate.";
  }

  function renderModules() {
    modules.forEach((button) => {
      const index = Number(button.dataset.moduleIndex);
      const isComplete = completed.has(index);
      button.classList.toggle("is-complete", isComplete);
      button.classList.toggle("is-current", index === state.currentModule && !isComplete);
      button.querySelector("span:last-child").textContent = isComplete
        ? "Complete"
        : index === state.currentModule ? "In progress" : index === 5 ? "Assessment" : "Not started";
    });

    const progress = Math.round((completed.size / modules.length) * 100);
    const progressBar = root.querySelector("#course-progress-bar");
    const progressTrack = progressBar.parentElement;
    progressBar.style.width = `${progress}%`;
    progressTrack.setAttribute("aria-valuenow", String(completed.size));
    root.querySelector("#course-progress-label").textContent = `Site Safety Essentials · ${completed.size} of ${modules.length} modules complete`;
    root.querySelector("#progress-stat").textContent = `${progress}%`;
    updateCertificate();
  }

  modules.forEach((button) => {
    button.addEventListener("click", () => {
      state.currentModule = Number(button.dataset.moduleIndex);
      const moduleName = button.querySelector("span:nth-child(2)").textContent;
      root.querySelector(".colearn-lesson h4").textContent = moduleName;
      renderModules();
      save();
    });
  });

  root.querySelector("#complete-module").addEventListener("click", (event) => {
    completed.add(state.currentModule);
    state.completedModules = [...completed].sort((left, right) => left - right);
    const nextModule = modules.find((button) => !completed.has(Number(button.dataset.moduleIndex)));
    if (nextModule) state.currentModule = Number(nextModule.dataset.moduleIndex);
    event.currentTarget.querySelector(".button-text").textContent = nextModule ? "Module complete" : "All modules complete";
    renderModules();
    save();
  });

  const courseCards = [...root.querySelectorAll(".colearn-course")];
  let activeFilter = "all";
  function filterCourses() {
    const query = root.querySelector("#course-search").value.trim().toLowerCase();
    courseCards.forEach((card) => {
      const matchesCategory = activeFilter === "all" || card.dataset.category === activeFilter;
      const matchesSearch = !query || `${card.dataset.search} ${card.textContent}`.toLowerCase().includes(query);
      card.hidden = !matchesCategory || !matchesSearch;
    });
  }

  root.querySelector("#course-search").addEventListener("input", filterCourses);
  root.querySelectorAll("[data-course-filter]").forEach((button) => {
    button.addEventListener("click", () => {
      activeFilter = button.dataset.courseFilter;
      root.querySelectorAll("[data-course-filter]").forEach((filter) => {
        filter.setAttribute("aria-pressed", String(filter === button));
      });
      filterCourses();
    });
  });

  root.querySelectorAll("[data-enroll]").forEach((button) => {
    const courseId = button.dataset.enroll;
    if (state.enrolled.includes(courseId)) button.querySelector(".button-text").textContent = "Enrolled";
    button.addEventListener("click", () => {
      if (!state.enrolled.includes(courseId)) state.enrolled.push(courseId);
      button.querySelector(".button-text").textContent = "Enrolled";
      feedback("course-feedback", "You are enrolled. This course has been added to My learning.");
      save();
    });
  });

  root.querySelector("#knowledge-check").addEventListener("submit", (event) => {
    event.preventDefault();
    const answer = new FormData(event.currentTarget).get("safety-answer");
    if (answer === "a") {
      state.quizPassed = true;
      feedback("quiz-feedback", "Correct. The equipment must be level, complete and inspected before use.");
      root.querySelector("#badge-stat").textContent = "5";
    } else {
      feedback("quiz-feedback", "Not quite. Check the inspection guidance and try again.");
    }
    updateCertificate();
    save();
  });

  root.querySelector("#check-in").addEventListener("click", (event) => {
    state.attendanceCheckedIn = true;
    event.currentTarget.querySelector(".button-text").textContent = "Checked in";
    event.currentTarget.disabled = true;
    feedback("attendance-feedback", "Attendance recorded for today's NCCT session.");
    save();
  });
  if (state.attendanceCheckedIn) {
    const checkIn = root.querySelector("#check-in");
    checkIn.disabled = true;
    checkIn.querySelector(".button-text").textContent = "Checked in";
    feedback("attendance-feedback", "Attendance recorded for today's NCCT session.");
  }

  root.querySelectorAll("[data-save-job]").forEach((button) => {
    const jobId = button.dataset.saveJob;
    const renderJob = () => button.querySelector(".button-text").textContent = state.savedJobs.includes(jobId) ? "Saved" : "Save opportunity";
    renderJob();
    button.addEventListener("click", () => {
      state.savedJobs = state.savedJobs.includes(jobId)
        ? state.savedJobs.filter((savedJob) => savedJob !== jobId)
        : [...state.savedJobs, jobId];
      renderJob();
      save();
    });
  });

  function renderNotifications() {
    root.querySelectorAll("#notification-list li").forEach((item, index) => {
      item.hidden = state.dismissedNotifications.includes(index);
    });
  }

  root.querySelectorAll("#notification-list button").forEach((button, index) => {
    button.addEventListener("click", () => {
      state.dismissedNotifications = [...new Set([...state.dismissedNotifications, index])];
      renderNotifications();
      save();
    });
  });
  root.querySelector("#clear-notifications").addEventListener("click", () => {
    state.dismissedNotifications = [0, 1];
    renderNotifications();
    save();
  });

  root.querySelector("#download-certificate").addEventListener("click", () => {
    if (!state.certificateId) {
      state.certificateId = `NCCT-${new Date().getFullYear()}-${Math.floor(1000 + Math.random() * 9000)}`;
      updateCertificate();
      save();
    }
    const certificate = `<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="840" viewBox="0 0 1200 840"><rect width="1200" height="840" fill="#f7f5f2"/><rect x="30" y="30" width="1140" height="780" fill="none" stroke="#000" stroke-width="3"/><rect x="30" y="30" width="1140" height="18" fill="#cfff03"/><text x="100" y="170" font-family="Roobert,Arial,sans-serif" font-size="30" fill="#000">CoLearn · NCCT</text><text x="100" y="320" font-family="Roobert,Arial,sans-serif" font-size="58" font-weight="600" fill="#000">Certificate of completion</text><text x="100" y="410" font-family="Roobert,Arial,sans-serif" font-size="28" fill="#000">This recognises that</text><text x="100" y="490" font-family="Roobert,Arial,sans-serif" font-size="48" font-weight="600" fill="#000">Amina Patel</text><text x="100" y="570" font-family="Roobert,Arial,sans-serif" font-size="28" fill="#000">has completed NCCT Site Safety Essentials</text><text x="100" y="690" font-family="Roobert,Arial,sans-serif" font-size="22" fill="#000">Certificate ID: ${state.certificateId}</text><text x="100" y="735" font-family="Roobert,Arial,sans-serif" font-size="20" fill="#000">Verify this certificate in the CoLearn learner hub.</text></svg>`;
    const url = URL.createObjectURL(new Blob([certificate], { type: "image/svg+xml" }));
    const link = document.createElement("a");
    link.href = url;
    link.download = `${state.certificateId}.svg`;
    link.click();
    URL.revokeObjectURL(url);
    updateCertificate();
  });

  root.querySelector("#verify-certificate").addEventListener("submit", (event) => {
    event.preventDefault();
    const code = root.querySelector("#certificate-code").value.trim().toUpperCase();
    const isValid = code === state.certificateId || code === "NCCT-2026-1042";
    feedback("verification-feedback", isValid ? `Verified: ${code} is a valid NCCT demo certificate.` : "No certificate found for that ID.");
  });

  const viewer = root.querySelector("#factory-viewer");
  const scene = root.querySelector("#factory-scene");
  const caption = root.querySelector("#viewer-caption");
  let pointerStart = null;
  let pan = 50;

  viewer.addEventListener("pointerdown", (event) => {
    if (event.target.closest(".colearn-hotspot")) return;
    pointerStart = { x: event.clientX, pan };
    viewer.setPointerCapture(event.pointerId);
  });
  viewer.addEventListener("pointermove", (event) => {
    if (!pointerStart) return;
    pan = Math.max(0, Math.min(100, pointerStart.pan - (event.clientX - pointerStart.x) / viewer.clientWidth * 100));
    scene.style.setProperty("--pan-x", `${pan}%`);
  });
  viewer.addEventListener("pointerup", () => pointerStart = null);
  viewer.addEventListener("pointercancel", () => pointerStart = null);
  root.querySelectorAll("[data-hotspot]").forEach((hotspot) => {
    hotspot.addEventListener("click", () => {
      const descriptions = {
        conveyor: "Conveyor controls: isolate power before clearing jams or carrying out maintenance.",
        safety: "Emergency stop: know its location and test the stop function during pre-use checks.",
        guarding: "Machine guarding: keep guards in place and report damage before operation.",
      };
      caption.textContent = descriptions[hotspot.dataset.hotspot];
    });
  });

  root.querySelector("#reset-view").addEventListener("click", () => {
    pan = 50;
    scene.style.setProperty("--pan-x", "50%");
    caption.textContent = "Drag to look around the factory floor. Select a hotspot to inspect the machine.";
  });

  root.querySelector("#enter-vr").addEventListener("click", async () => {
    try {
      if (navigator.xr && await navigator.xr.isSessionSupported("immersive-vr")) {
        const session = await navigator.xr.requestSession("immersive-vr", { optionalFeatures: ["local-floor"] });
        session.addEventListener("end", () => feedback("vr-feedback", "VR session ended."), { once: true });
        feedback("vr-feedback", "VR session connected. Use your headset controls to look around.");
        return;
      }
      if (viewer.requestFullscreen) await viewer.requestFullscreen();
      feedback("vr-feedback", "Fullscreen viewer opened. For head-tracked viewing, choose Cardboard on a compatible mobile device.");
    } catch {
      feedback("vr-feedback", "VR is unavailable in this browser. Try the interactive viewer or Cardboard on a compatible mobile device.");
    }
  });

  root.querySelector("#enter-cardboard").addEventListener("click", async () => {
    try {
      if (typeof DeviceOrientationEvent === "undefined") throw new Error("unsupported");
      if (typeof DeviceOrientationEvent.requestPermission === "function") {
        const permission = await DeviceOrientationEvent.requestPermission();
        if (permission !== "granted") throw new Error("permission");
      }
      if (viewer.requestFullscreen && !document.fullscreenElement) await viewer.requestFullscreen();
      viewer.classList.add("is-cardboard");
      window.addEventListener("deviceorientation", (event) => {
        if (event.gamma === null) return;
        pan = Math.max(0, Math.min(100, 50 + event.gamma / 1.8));
        scene.style.setProperty("--pan-x", `${pan}%`);
      });
      feedback("vr-feedback", "Cardboard mode is on. Place your phone in the viewer and turn your head to look around.");
    } catch {
      feedback("vr-feedback", "Motion sensors are not available or permission was declined. You can still drag the panorama on screen.");
    }
  });

  root.querySelectorAll("[data-portal-view]").forEach((link) => {
    link.addEventListener("click", () => root.querySelector(`#${link.dataset.portalView === "profile" ? "learner-profile" : link.dataset.portalView}`).scrollIntoView({ behavior: "smooth" }));
  });

  renderModules();
  renderNotifications();
  save();
})();