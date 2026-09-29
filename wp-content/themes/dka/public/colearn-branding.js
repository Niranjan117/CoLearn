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

  document.querySelectorAll("link[rel='icon'], link[rel='apple-touch-icon']").forEach((icon) => {
    icon.href = "/wp-content/themes/dka/resources/svg/colearn-mark.svg";
  });
  document.querySelectorAll("meta[name='msapplication-TileImage']").forEach((meta) => {
    meta.content = "/wp-content/themes/dka/resources/svg/colearn-mark.svg";
  });

  const labelMap = new Map([
    ["Work", "Careers"],
    ["Expertise", "Learning paths"],
    ["Academy", "NCCT learning"],
    ["Insights", "Learning resources"],
    ["Contact", "Learner support"],
    ["Services", "Courses & skills"],
    ["Culture", "Skills pathways"],
    ["Coaching", "Simulations"],
    ["Talks", "Video lectures"],
  ]);

  document.querySelectorAll(".nav-primary a, .mobile-menu a").forEach((link) => {
    const label = link.textContent.trim();
    if (!labelMap.has(label)) return;
    const textNode = [...link.childNodes].find((node) => node.nodeType === Node.TEXT_NODE && node.nodeValue.trim());
    if (textNode) textNode.nodeValue = textNode.nodeValue.replace(label, labelMap.get(label));
  });

  document.querySelectorAll("a[href]").forEach((link) => {
    let url;
    try {
      url = new URL(link.href, window.location.origin);
    } catch {
      return;
    }
    if (url.hostname !== "optimisticfutures.co.uk" && url.hostname !== "www.optimisticfutures.co.uk") return;

    const originalPath = url.pathname;
    if (originalPath.startsWith("/work/")) {
      link.href = "/academy/courses/#careers";
    } else if (originalPath.startsWith("/insights/")) {
      link.href = "/academy/lectures/";
    } else if (originalPath.startsWith("/services/") || originalPath.startsWith("/expertise/")) {
      link.href = "/academy/courses/#discover";
    } else if (originalPath.startsWith("/academy/culture/")) {
      link.href = "/academy/courses/#discover";
    } else if (originalPath.startsWith("/academy/coaching/")) {
      link.href = "/academy/simulations/";
    } else if (originalPath.startsWith("/academy/talks/")) {
      link.href = "/academy/lectures/";
    } else if (originalPath.startsWith("/academy/courses/")) {
      link.href = "/academy/courses/";
    } else {
      link.href = `${originalPath}${url.search}${url.hash}`;
    }
  });

  document.querySelectorAll("a[href^='mailto:info@optimisticfutures.co.uk']").forEach((link) => {
    link.href = "/contact/";
    const textNode = [...link.childNodes].find((node) => node.nodeType === Node.TEXT_NODE && node.nodeValue.trim());
    if (textNode) textNode.nodeValue = textNode.nodeValue.replace("info@optimisticfutures.co.uk", "Learner support");
  });

})();