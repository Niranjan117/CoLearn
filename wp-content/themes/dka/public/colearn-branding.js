(() => {
  const pageNames = {
    "/": "NCCT Skills & Learning",
    "/academy/": "NCCT Learning",
    "/academy/courses/": "NCCT Courses",
    "/academy/learner/": "Learner Hub",
    "/academy/simulations/": "Learning Simulations",
    "/academy/lectures/": "Video Lectures",
    "/contact/": "Learner Support",
    "/insights/": "Learning Resources",
    "/work/": "Career Pathways",
  };
  const path = window.location.pathname.replace(/index\.html$/, "");
  document.title = `CoLearn | ${pageNames[path] || "NCCT Learning"}`;
  document.body.classList.add("colearn");

  document.querySelectorAll("a.brand").forEach((brand) => {
    brand.href = "/";
    brand.setAttribute("aria-label", "CoLearn home");
    if (brand.querySelector(".colearn-wordmark")) return;

    const logoImages = [...brand.querySelectorAll("img")];
    logoImages.forEach((image) => {
      image.alt = "CoLearn";
      image.classList.add("colearn-brand-image");
      image.hidden = true;
      const wordmark = document.createElement("span");
      wordmark.className = `${[...image.classList].filter((name) => name.startsWith("logo-")).join(" ")} colearn-wordmark`;
      wordmark.textContent = "CoLearn";
      wordmark.setAttribute("aria-hidden", "true");
      image.after(wordmark);
    });
  });

  document.querySelectorAll(".academy-link a.academy-button").forEach((link) => {
    link.href = "/academy/learner/";
    const label = link.querySelector("span");
    if (label) label.textContent = "My learning";
  });

  document.querySelectorAll(".nav-primary ul, .mobile-menu ul").forEach((list) => {
    if (list.querySelector('a[href="/academy/simulations/"]')) return;
    const item = document.createElement("li");
    item.className = "top-level-link";
    const link = document.createElement("a");
    link.href = "/academy/simulations/";
    link.textContent = "Simulations";
    item.append(link);
    list.append(item);
  });

  document.querySelectorAll("link[rel='icon'], link[rel='apple-touch-icon']").forEach((icon) => {
    icon.href = "/wp-content/themes/dka/resources/svg/colearn-mark.svg";
  });
  document.querySelectorAll("meta[name='msapplication-TileImage']").forEach((meta) => {
    meta.content = "/wp-content/themes/dka/resources/svg/colearn-mark.svg";
  });

  const labelMap = new Map([
    ["Work", "Careers"],
    ["Expertise", "Courses"],
    ["Academy", "Academy"],
    ["Insights", "Videos"],
    ["Contact", "Support"],
    ["Services", "Courses"],
    ["Culture", "Paths"],
    ["Coaching", "Simulations"],
    ["Talks", "Lectures"],
    ["Learning paths", "Courses"],
    ["Learning resources", "Videos"],
    ["Learner support", "Support"],
    ["NCCT learning", "Academy"],
    ["Video lectures", "Videos"],
    ["My learning", "Learn"],
  ]);

  document.querySelectorAll(".nav-primary a, .mobile-menu a").forEach((link) => {
    const label = link.textContent.trim();
    if (!labelMap.has(label)) return;
    const textNode = [...link.childNodes].find((node) => node.nodeType === Node.TEXT_NODE && node.nodeValue.trim());
    if (textNode) textNode.nodeValue = textNode.nodeValue.replace(label, labelMap.get(label));
  });

  const menuCopy = new Map([
    ["Dismantling inequalities & instilling anti-racism in Welsh education", "Site Safety Essentials"],
    ["Putting the customer first with South Western Railway", "Forklift Operations"],
    ["Design research", "Hazard identification"],
    ["Vision & purpose", "Working at height"],
    ["Service & experience design", "Machine operations"],
    ["Brand strategy", "Digital skills"],
    ["Business proposition", "Skills assessments"],
    ["Change management", "Qualifications & badges"],
    ["Executive training", "Learning support"],
    ["Equity by design", "Inclusive learning"],
    ["Frame", "Foundation"],
    ["Create", "Practice"],
    ["Implement", "Apply"],
    ["Build", "Progress"],
  ]);

  document.querySelectorAll(".dropdown-case-studies, .services-menu").forEach((menu) => {
    const walker = document.createTreeWalker(menu, NodeFilter.SHOW_TEXT);
    while (walker.nextNode()) {
      const node = walker.currentNode;
      menuCopy.forEach((replacement, original) => {
        node.nodeValue = node.nodeValue.replaceAll(original, replacement);
      });
    }
  });

  if (path === "/academy/") {
    const pathwayMarquee = document.querySelector(".home-partners .marquee .inner");
    const pathways = [
      { label: "NCCT courses", image: "/wp-content/uploads/pho/group-diverse-pupils-engaging-online-course-discussion-via-video-call_482257-123125.avif" },
      { label: "Hydroelectric learning", image: "/Dam/Dam%20Simulation/mm/neue-energien/wasserkraft/asset/images/og-image-wasserkraft.jpg" },
      { label: "Solar thermal learning", image: "/Solar/Solar%20Panel/mm/neue-energien/solarthermie/asset/images/pages/start/bg-start-page.png" },
      { label: "Wind power learning", image: "/Wind%20Power/Wind%20Power/mm/neue-energien/windkraft/asset/images/pages/start/bg-start-page.png" },
      { label: "Career pathways", image: "/wp-content/uploads/pho/Online-Education-scaled-1.jpg" },
    ];

    if (pathwayMarquee) {
      const items = pathways.map((pathway) => {
        const item = document.createElement("div");
        item.className = "logo";
        const image = document.createElement("img");
        image.className = "fill";
        image.src = pathway.image;
        image.alt = pathway.label;
        image.width = 320;
        image.height = 320;
        image.loading = "lazy";
        image.decoding = "async";
        item.append(image);
        return item;
      });
      pathwayMarquee.replaceChildren(...items, ...items.map((item) => item.cloneNode(true)));
    }
  }

  document.querySelectorAll("a[href]").forEach((link) => {
    let url;
    try {
      url = new URL(link.href, window.location.origin);
    } catch {
      return;
    }
    if (url.origin !== window.location.origin) return;

    const originalPath = url.pathname;
    if (originalPath === "/work" || originalPath.startsWith("/work/")) {
      link.href = "/academy/learner/#careers";
    } else if (originalPath === "/insights" || originalPath.startsWith("/insights/")) {
      link.href = "/academy/lectures/";
    } else if (originalPath === "/contact" || originalPath.startsWith("/contact/")) {
      link.href = `/contact/${url.search}${url.hash}`;
    } else if (originalPath.startsWith("/services/") || originalPath.startsWith("/expertise/")) {
      link.href = "/academy/courses/#discover";
    } else if (originalPath.startsWith("/academy/culture/")) {
      link.href = "/academy/courses/#discover";
    } else if (originalPath.startsWith("/academy/coaching/")) {
      link.href = "/academy/simulations/";
    } else if (originalPath.startsWith("/academy/talks/")) {
      link.href = "/academy/lectures/";
    } else if (originalPath === "/our-story/" || originalPath === "/terms-conditions/") {
      link.href = "/academy/";
    } else {
      link.href = `${originalPath}${url.search}${url.hash}`;
    }
  });

  if (path === "/work/" || path === "/work") {
    const heading = document.querySelector("#main .case-studies-hero h1");
    const filters = document.querySelector("#main .filters");
    const cards = document.querySelector("#main .case-studies-list .facetwp-template");

    if (heading && filters && cards) {
      document.body.classList.add("career-directory");
      heading.textContent = "Career opportunities";
      filters.removeAttribute("data-module");
      filters.innerHTML = `
        <div class="container">
          <p class="heading">Explore career pathways</p>
          <label for="career-search">Search roles</label>
          <input class="career-search" id="career-search" type="search" placeholder="Search roles or locations">
          <div class="career-filters" role="group" aria-label="Filter career opportunities">
            <button class="button career-filter" type="button" data-career-filter="all" aria-pressed="true">All roles</button>
            <button class="button career-filter" type="button" data-career-filter="apprenticeship" aria-pressed="false">Apprenticeships</button>
            <button class="button career-filter" type="button" data-career-filter="entry-level" aria-pressed="false">Entry level</button>
            <button class="button career-filter" type="button" data-career-filter="renewable" aria-pressed="false">Renewable energy</button>
          </div>
        </div>`;

      const opportunities = [
        { title: "Mechanical Engineering Apprentice", location: "Leeds", type: "apprenticeship", category: "Apprenticeship", summary: "Learn maintenance, inspection and safe workshop practice with a qualified team.", image: "/Dam/Dam%20Simulation/mm/neue-energien/wasserkraft/asset/images/og-image-wasserkraft.jpg" },
        { title: "Manufacturing Operative", location: "Manchester", type: "entry-level", category: "Entry level", summary: "Build production experience, quality awareness and reliable site safety habits.", image: "/wp-content/uploads/pho/virtual-classroom-study-space_23-2149178640-a47e2601d8a84bc0851766cebe43e63b.webp" },
        { title: "Wind Turbine Service Trainee", location: "Newcastle", type: "renewable", category: "Renewable energy", summary: "Start a practical pathway in inspections, maintenance and renewable generation.", image: "/Wind%20Power/Wind%20Power/mm/neue-energien/windkraft/asset/images/pages/start/bg-start-page.png" },
        { title: "Solar Thermal Installation Assistant", location: "Bristol", type: "apprenticeship", category: "Apprenticeship", summary: "Support solar thermal installations while developing electrical and customer skills.", image: "/Solar/Solar%20Panel/mm/neue-energien/solarthermie/asset/images/pages/start/bg-start-page.png" },
      ];

      cards.innerHTML = opportunities.map((opportunity) => `
        <a class="project-card" href="/academy/learner/#careers" data-career-category="${opportunity.type}" data-career-search="${opportunity.title} ${opportunity.location} ${opportunity.summary}">
          <figure class="image">
            <div class="tags"><div class="tag">${opportunity.category}</div></div>
            <div class="project-heading fill"><p>${opportunity.summary}</p></div>
            <div class="cover fill"></div>
            <img class="fill" src="${opportunity.image}" alt="${opportunity.title} career pathway" loading="lazy">
          </figure>
          <p class="project-title"><span>${opportunity.title}</span><br><span>${opportunity.location}</span></p>
        </a>`).join("") + '<p class="career-empty" id="career-empty" hidden>No career opportunities match your search.</p>';

      const search = filters.querySelector("#career-search");
      const careerCards = [...cards.querySelectorAll("[data-career-category]")];
      const filterButtons = [...filters.querySelectorAll("[data-career-filter]")];
      let activeFilter = "all";
      const applyCareerFilters = () => {
        const query = search.value.trim().toLowerCase();
        let visible = 0;
        careerCards.forEach((card) => {
          const matchesType = activeFilter === "all" || card.dataset.careerCategory === activeFilter;
          const matchesQuery = !query || card.dataset.careerSearch.toLowerCase().includes(query);
          card.hidden = !matchesType || !matchesQuery;
          if (!card.hidden) visible += 1;
        });
        cards.querySelector("#career-empty").hidden = visible > 0;
      };

      search.addEventListener("input", applyCareerFilters);
      filterButtons.forEach((button) => {
        button.addEventListener("click", () => {
          activeFilter = button.dataset.careerFilter;
          filterButtons.forEach((filter) => filter.setAttribute("aria-pressed", String(filter === button)));
          applyCareerFilters();
        });
      });
    }
  }

})();