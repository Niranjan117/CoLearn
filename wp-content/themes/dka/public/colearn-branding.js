(() => {
  const pageNames = {
    "/": "NCCT Skills & Learning",
    "/academy/": "NCCT Learning",
    "/academy/courses/": "Courses & Learner Hub",
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

  document.querySelectorAll("link[rel='icon'], link[rel='apple-touch-icon']").forEach((icon) => {
    icon.href = "/wp-content/themes/dka/resources/svg/colearn-mark.svg";
  });
  document.querySelectorAll("meta[name='msapplication-TileImage']").forEach((meta) => {
    meta.content = "/wp-content/themes/dka/resources/svg/colearn-mark.svg";
  });

  const labelMap = new Map([
    ["Work", "Career pathways"],
    ["Expertise", "Learning paths"],
    ["Academy", "NCCT learning"],
    ["Insights", "Resources"],
    ["Contact", "Learner support"],
    ["Services", "Courses & skills"],
    ["Culture", "Skills pathways"],
    ["Coaching", "Mentoring"],
    ["Talks", "Video lectures"],
    ["Insights", "Learning resources"],
    ["Work", "Career pathways"],
    ["Contact us", "Learner support"],
    ["Academy", "NCCT learning"],
    ["Filter by:", "Filter learning resources by:"],
    ["Sectors", "Course pathway"],
    ["Services", "Resource type"],
    ["Category", "Topic"],
    ["Case studies", "Learning resources"],
    ["Our expertise", "NCCT learning paths"],
    ["Making design social", "Practical skills for real work"],
    ["Our work", "Career pathways"],
    ["Our story", "Learn together"],
    ["What our clients say", "Learner feedback (demo)"],
    ["Testimonials", "Learner feedback (demo)"],
    ["Insights", "Learning resources"],
    ["Work", "Career pathways"],
    ["Contact us", "Learner support"],
    ["Academy", "CoLearn for NCCT"],
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
    } else if (originalPath.startsWith("/services/") || originalPath.startsWith("/expertise/")) {
      link.href = "/academy/courses/#discover";
    } else if (originalPath.startsWith("/academy/culture/")) {
      link.href = "/academy/courses/#discover";
    } else if (originalPath.startsWith("/academy/coaching/") || originalPath.startsWith("/academy/talks/")) {
      link.href = "/academy/courses/#my-learning";
    } else if (originalPath.startsWith("/academy/courses/")) {
      link.href = "/academy/courses/";
    } else {
      link.href = `${originalPath}${url.search}${url.hash}`;
    }
  });

  document.querySelectorAll(".page-footer a[href^='mailto:info@optimisticfutures.co.uk']").forEach((link) => {
    link.href = "/contact/";
    const textNode = [...link.childNodes].find((node) => node.nodeType === Node.TEXT_NODE && node.nodeValue.trim());
    if (textNode) textNode.nodeValue = textNode.nodeValue.replace("info@optimisticfutures.co.uk", "Learner support");
  });

  document.querySelectorAll("a[href^='mailto:info@optimisticfutures.co.uk']").forEach((link) => {
    link.href = "/contact/";
    const textNode = [...link.childNodes].find((node) => node.nodeType === Node.TEXT_NODE && node.nodeValue.trim());
    if (textNode) textNode.nodeValue = textNode.nodeValue.replace("info@optimisticfutures.co.uk", "Learner support");
  });

  const contentMap = new Map([
    ["Dismantling inequalities & instilling anti-racism in Welsh education", "Site Safety Essentials: learn to work safely"],
    ["Putting the customer first with South Western Railway", "Forklift Operations: build safe machine skills"],
    ["Design research", "Hazard identification"],
    ["Vision & purpose", "Working safely at height"],
    ["Service & experience design", "Machine operations"],
    ["Brand strategy", "Digital tools on site"],
    ["Business proposition", "Skills assessment"],
    ["Change management", "Qualifications & badges"],
    ["Executive training", "Learning support"],
    ["Equity by design", "Inclusive learning"],
    ["Our clients", "Learning for industry"],
    ["View project", "Explore courses"],
    ["Related pages", "More learning"],
    ["Let's chat", "Start learning"],
  ]);

  const textNodes = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT);
  const replacements = [];
  while (textNodes.nextNode()) {
    const node = textNodes.currentNode;
    if (node.parentElement.closest("script, style")) continue;
    if ([...contentMap.keys(), "Optimistic Futures"].some((value) => node.nodeValue.includes(value))) replacements.push(node);
  }
  replacements.forEach((node) => {
    node.nodeValue = node.nodeValue.replaceAll("Optimistic Futures Academy", "CoLearn NCCT").replaceAll("Optimistic Futures", "CoLearn");
    contentMap.forEach((replacement, original) => {
      node.nodeValue = node.nodeValue.replaceAll(original, replacement);
    });
  });
})();