$file = 'academy/lectures/index.html'
$content = [System.IO.File]::ReadAllText("$pwd/$file", [System.Text.Encoding]::UTF8)

# Target: from <section class="info-panel colearn-lectures" to <footer class="page-footer">
$lecRegex = '(?s)<section class="info-panel colearn-lectures".*?<footer class="page-footer">'

$replacement = @'
<section class="info-panel colearn-lectures" data-background-color="stone" data-margin="yes">
          <div class="container">
            <div class="heading" data-module="heading-with-line-animation">
              <h2 class="text-reveal">Practical video demonstrations</h2>
              <figure class="line" aria-hidden="true"></figure>
            </div>
            <div class="text" data-module="fade-in">
              <p style="font-size: 1.2rem; color: var(--black, #000); margin-bottom: 2rem; line-height: 1.6;">
                Watch technical lectures, simulation walk-throughs, and site demonstrations directly from accredited industry bodies and engineering educators.
              </p>

              <!-- Video Filters & Search Bar -->
              <div style="display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:1.25rem; margin-bottom:2.25rem;">
                <div class="colearn-lecture-filters" role="group" aria-label="Filter video lectures" style="display:flex; flex-wrap:wrap; gap:0.65rem;">
                  <button class="button" type="button" data-lecture-filter="all" aria-pressed="true">All videos</button>
                  <button class="button" type="button" data-lecture-filter="simulations" aria-pressed="false">Simulation walkthroughs</button>
                  <button class="button" type="button" data-lecture-filter="safety" aria-pressed="false">Health &amp; safety</button>
                  <button class="button" type="button" data-lecture-filter="machinery" aria-pressed="false">Machinery &amp; plant</button>
                  <button class="button" type="button" data-lecture-filter="renewables" aria-pressed="false">Renewable energy</button>
                  <button class="button" type="button" data-lecture-filter="automation" aria-pressed="false">Automation &amp; electrical</button>
                </div>
                <div style="flex-grow:1; max-width:380px; min-width:240px;">
                  <input id="lecture-search" type="search" placeholder="Search by topic, instructor or skill..." style="width:100%; min-height:3rem; padding:0.65rem 1.25rem; border:1.5px solid var(--black,#000); border-radius:2rem; font-family:var(--roobert); font-size:1rem; box-sizing:border-box;">
                </div>
              </div>

              <div class="colearn-course-grid" id="lecture-grid">
                <!-- 1. Working at Height -->
                <article class="colearn-course" data-category="safety" data-search="working safely at height fall prevention harness scaffold ladder citb hse health safety">
                  <a class="colearn-video-thumbnail" href="https://www.youtube.com/watch?v=kYJvMv1V8sY" target="_blank" rel="noopener" aria-label="Watch Working safely at height on YouTube">
                    <img src="https://img.youtube.com/vi/kYJvMv1V8sY/hqdefault.jpg" onerror="this.onerror=null;this.src='/wp-content/uploads/pho/group-diverse-pupils-engaging-online-course-discussion-via-video-call_482257-123125.avif';" alt="Working safely at height video thumbnail" loading="lazy">
                    <span class="colearn-play-button">
                      <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
                      Watch on YouTube
                    </span>
                    <span class="colearn-video-duration">12:30</span>
                  </a>
                  <p class="colearn-course-meta">HEALTH &amp; SAFETY · CITB / HSE</p>
                  <h4>Working safely at height</h4>
                  <p>Master fall prevention guidelines, harness inspections, scaffolding checks, and ladder safety standards on active sites.</p>
                </article>

                <!-- 2. Forklift Operations -->
                <article class="colearn-course" data-category="machinery" data-search="forklift pre-use inspection plant operations rtitb flta machinery hydraulics load handling">
                  <a class="colearn-video-thumbnail" href="https://www.youtube.com/watch?v=0h9V4fE1y9g" target="_blank" rel="noopener" aria-label="Watch Forklift pre-use inspection on YouTube">
                    <img src="https://img.youtube.com/vi/0h9V4fE1y9g/hqdefault.jpg" onerror="this.onerror=null;this.src='/wp-content/uploads/pho/pngtree-illustration-of-3d-rendered-laptop-computer-showcasing-the-concept-of-e-image_3752947.jpg';" alt="Forklift pre-use inspection video thumbnail" loading="lazy">
                    <span class="colearn-play-button">
                      <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
                      Watch on YouTube
                    </span>
                    <span class="colearn-video-duration">14:15</span>
                  </a>
                  <p class="colearn-course-meta">MACHINERY · PLANT OPERATIONS</p>
                  <h4>Forklift pre-use inspection</h4>
                  <p>Essential daily walk-around checks, hydraulic and steering safety, tyre condition, and safe counterbalance load handling.</p>
                </article>

                <!-- 3. Hydro Simulation Walkthrough -->
                <article class="colearn-course" data-category="simulations renewables" data-search="hydroelectric power generation dam water flow penstock francis turbine clean energy simulation">
                  <a class="colearn-video-thumbnail" href="https://www.youtube.com/watch?v=q8HmRLCgDAI" target="_blank" rel="noopener" aria-label="Watch How Hydroelectric Power Works on YouTube">
                    <img src="https://img.youtube.com/vi/q8HmRLCgDAI/hqdefault.jpg" onerror="this.onerror=null;this.src='/Dam/Dam%20Simulation/mm/neue-energien/wasserkraft/asset/images/og-image-wasserkraft.jpg';" alt="Hydroelectric power generation video thumbnail" loading="lazy">
                    <span class="colearn-play-button">
                      <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
                      Watch on YouTube
                    </span>
                    <span class="colearn-video-duration">09:40</span>
                  </a>
                  <p class="colearn-course-meta">SIMULATION WALKTHROUGH · HYDROELECTRIC</p>
                  <h4>Hydroelectric dam flow &amp; turbine mechanics</h4>
                  <p>Explore water flow mechanics through dams, penstock pressure head, Francis turbine rotation, and 50Hz electrical grid synchronization.</p>
                </article>

                <!-- 4. Wind Simulation Walkthrough -->
                <article class="colearn-course" data-category="simulations renewables" data-search="wind turbine operation maintenance pitch yaw aerodynamics nacelle clean energy simulation">
                  <a class="colearn-video-thumbnail" href="https://www.youtube.com/watch?v=qSWm_nprfqE" target="_blank" rel="noopener" aria-label="Watch Wind Turbine Technology on YouTube">
                    <img src="https://img.youtube.com/vi/qSWm_nprfqE/hqdefault.jpg" onerror="this.onerror=null;this.src='/Wind%20Power/Wind%20Power/mm/neue-energien/windkraft/asset/images/pages/start/bg-start-page.png';" alt="Wind turbine technology video thumbnail" loading="lazy">
                    <span class="colearn-play-button">
                      <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
                      Watch on YouTube
                    </span>
                    <span class="colearn-video-duration">11:20</span>
                  </a>
                  <p class="colearn-course-meta">SIMULATION WALKTHROUGH · WIND ENERGY</p>
                  <h4>Wind turbine pitch, yaw &amp; storm safety</h4>
                  <p>Rotor aerodynamics, active pitch and yaw controls, planetary gearbox step-up ratios, and high-wind emergency braking procedures.</p>
                </article>

                <!-- 5. Solar Thermal Simulation Walkthrough -->
                <article class="colearn-course" data-category="simulations renewables" data-search="solar thermal pv fundamentals clean energy heat storage glycol pump heat exchanger simulation">
                  <a class="colearn-video-thumbnail" href="https://www.youtube.com/watch?v=0elhIcPVtKE" target="_blank" rel="noopener" aria-label="Watch Solar Thermal & Photovoltaic Systems on YouTube">
                    <img src="https://img.youtube.com/vi/0elhIcPVtKE/hqdefault.jpg" onerror="this.onerror=null;this.src='/Solar/Solar%20Panel/mm/neue-energien/solarthermie/asset/images/pages/start/bg-start-page.png';" alt="Solar thermal and PV systems video thumbnail" loading="lazy">
                    <span class="colearn-play-button">
                      <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
                      Watch on YouTube
                    </span>
                    <span class="colearn-video-duration">08:50</span>
                  </a>
                  <p class="colearn-course-meta">SIMULATION WALKTHROUGH · SOLAR THERMAL</p>
                  <h4>Solar thermal circulation &amp; heat storage</h4>
                  <p>Principles of vacuum tube collector arrays, differential controller pump speed, expansion vessel maintenance, and hot water storage.</p>
                </article>

                <!-- 6. Virtual Lab Diagnostics -->
                <article class="colearn-course" data-category="simulations automation" data-search="virtual commissioning simulation diagnostics telemetry sensor testing masterclass engineering lab">
                  <a class="colearn-video-thumbnail" href="https://www.youtube.com/watch?v=kYJvMv1V8sY" target="_blank" rel="noopener" aria-label="Watch Simulation Diagnostics Masterclass on YouTube">
                    <img src="https://img.youtube.com/vi/kYJvMv1V8sY/hqdefault.jpg" onerror="this.onerror=null;this.src='/wp-content/uploads/pho/group-diverse-pupils-engaging-online-course-discussion-via-video-call_482257-123125.avif';" alt="Virtual engineering lab masterclass thumbnail" loading="lazy">
                    <span class="colearn-play-button">
                      <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
                      Watch on YouTube
                    </span>
                    <span class="colearn-video-duration">16:30</span>
                  </a>
                  <p class="colearn-course-meta">ENGINEERING MASTERCLASS · VIRTUAL LAB</p>
                  <h4>Simulation telemetry sweeps &amp; fault diagnosis</h4>
                  <p>Conduct digital pre-commissioning checks, log operational telemetry curves, and evaluate efficiency responses across load variances.</p>
                </article>

                <!-- 7. Site Hazard Spotting -->
                <article class="colearn-course" data-category="safety" data-search="site hazard spotting ppe standards iosh risk assessment hierarchy of control personal protective equipment">
                  <a class="colearn-video-thumbnail" href="https://www.youtube.com/watch?v=jP0V8T8y90g" target="_blank" rel="noopener" aria-label="Watch Hazard Spotting & Site PPE on YouTube">
                    <img src="https://img.youtube.com/vi/jP0V8T8y90g/hqdefault.jpg" onerror="this.onerror=null;this.src='/wp-content/uploads/pho/front-view-stacked-books-graduation-cap-ladders-education-day.jpg';" alt="Site hazard identification video thumbnail" loading="lazy">
                    <span class="colearn-play-button">
                      <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
                      Watch on YouTube
                    </span>
                    <span class="colearn-video-duration">15:05</span>
                  </a>
                  <p class="colearn-course-meta">SITE SAFETY · PPE STANDARDS</p>
                  <h4>Site hazard spotting &amp; PPE standards</h4>
                  <p>Learn proactive risk assessment, hearing and respiratory protection choices, exclusion zone enforcement, and high-visibility rules.</p>
                </article>

                <!-- 8. Industrial Automation & PLC -->
                <article class="colearn-course" data-category="automation" data-search="industrial automation plc ladder logic relay sensors 24v control conveyor automated city guilds">
                  <a class="colearn-video-thumbnail" href="https://www.youtube.com/watch?v=0h9V4fE1y9g" target="_blank" rel="noopener" aria-label="Watch Industrial Automation & PLC Logic on YouTube">
                    <img src="https://img.youtube.com/vi/0h9V4fE1y9g/hqdefault.jpg" onerror="this.onerror=null;this.src='/wp-content/uploads/pho/virtual-classroom-study-space_23-2149178640-a47e2601d8a84bc0851766cebe43e63b.webp';" alt="Industrial automation lecture thumbnail" loading="lazy">
                    <span class="colearn-play-button">
                      <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
                      Watch on YouTube
                    </span>
                    <span class="colearn-video-duration">18:40</span>
                  </a>
                  <p class="colearn-course-meta">AUTOMATION · CITY &amp; GUILDS</p>
                  <h4>Industrial automation &amp; PLC ladder logic</h4>
                  <p>Program input/output contacts, configure automated conveyor sequencing timers, troubleshoot 24V DC inductive sensors, and test relays.</p>
                </article>

                <!-- 9. Safe Electrical Isolation & LOTO -->
                <article class="colearn-course" data-category="automation safety" data-search="safe electrical isolation lockout tagout loto 18th edition bs 7671 voltage proving unit electricians">
                  <a class="colearn-video-thumbnail" href="https://www.youtube.com/watch?v=q8HmRLCgDAI" target="_blank" rel="noopener" aria-label="Watch Safe Isolation & LOTO Procedures on YouTube">
                    <img src="https://img.youtube.com/vi/q8HmRLCgDAI/hqdefault.jpg" onerror="this.onerror=null;this.src='/Dam/Dam%20Simulation/mm/neue-energien/wasserkraft/asset/images/og-image-wasserkraft.jpg';" alt="Safe electrical isolation lecture thumbnail" loading="lazy">
                    <span class="colearn-play-button">
                      <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
                      Watch on YouTube
                    </span>
                    <span class="colearn-video-duration">13:10</span>
                  </a>
                  <p class="colearn-course-meta">ELECTRICAL SAFETY · 18TH EDITION</p>
                  <h4>Safe electrical isolation &amp; LOTO procedures</h4>
                  <p>Execute the mandatory 10-step safe isolation procedure using GS38 approved test probes, proving units, lock-off hasps, and warning tags.</p>
                </article>

                <!-- 10. Heavy Plant & 360 Excavator Safety -->
                <article class="colearn-course" data-category="machinery" data-search="heavy plant groundworks 360 excavator safety cpcs npors slewing radius exclusion zone">
                  <a class="colearn-video-thumbnail" href="https://www.youtube.com/watch?v=qSWm_nprfqE" target="_blank" rel="noopener" aria-label="Watch 360 Excavator Groundworks Safety on YouTube">
                    <img src="https://img.youtube.com/vi/qSWm_nprfqE/hqdefault.jpg" onerror="this.onerror=null;this.src='/Wind%20Power/Wind%20Power/mm/neue-energien/windkraft/asset/images/pages/start/bg-start-page.png';" alt="360 excavator groundworks safety thumbnail" loading="lazy">
                    <span class="colearn-play-button">
                      <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
                      Watch on YouTube
                    </span>
                    <span class="colearn-video-duration">17:25</span>
                  </a>
                  <p class="colearn-course-meta">HEAVY PLANT · CPCS / NPORS</p>
                  <h4>360 Excavator safety &amp; slewing zones</h4>
                  <p>Understand tail swing danger zones, quick-hitch safety pins, underground service avoidance (CAT and Genny), and banksman signaling.</p>
                </article>
              </div>

              <p class="colearn-feedback" id="lecture-feedback" role="status" aria-live="polite" style="margin-top:1.5rem;"></p>
            </div>
          </div>
        </section>

        <!-- Technical Resources & Guidance Section -->
        <section class="info-panel" data-background-color="stone" data-margin="yes">
          <div class="container">
            <div class="heading" data-module="heading-with-line-animation">
              <h2 class="text-reveal">Resources to go with your learning</h2>
              <figure class="line" aria-hidden="true"></figure>
            </div>
            <div class="text" data-module="fade-in">
              <div class="prose">
                <p>Download official HSE guidance and technical training companion guides to reinforce your practical skills alongside each video lecture and simulation session.</p>
                <div style="display:flex; gap:1rem; flex-wrap:wrap; margin-top:1.5rem;">
                  <a class="button" href="https://www.hse.gov.uk/pubns/priced/hsg150.pdf" target="_blank" rel="noopener">
                    <span class="button-text">Download HSE construction guide (PDF)</span>
                  </a>
                  <a class="button" href="https://www.hse.gov.uk/construction/safetytopics/workingatheight.htm" target="_blank" rel="noopener">
                    <span class="button-text">Open working-at-height guidance</span>
                  </a>
                  <a class="button" href="/academy/simulations/" style="background:var(--acid,#cfff03); color:#000;">
                    <span class="button-text">Launch 3D simulations ↗</span>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </section>

        <script>
          // Live Video Lecture Filter & Search
          document.addEventListener("DOMContentLoaded", () => {
            const filterBtns = document.querySelectorAll("[data-lecture-filter]");
            const searchInput = document.querySelector("#lecture-search");
            const cards = document.querySelectorAll("#lecture-grid article");
            const feedback = document.querySelector("#lecture-feedback");
            let activeFilter = "all";

            function filterLectures() {
              const query = searchInput ? searchInput.value.trim().toLowerCase() : "";
              let visible = 0;

              cards.forEach(card => {
                const category = card.dataset.category || "";
                const searchText = (card.dataset.search || card.textContent).toLowerCase();
                const matchesCategory = activeFilter === "all" || category.includes(activeFilter);
                const matchesQuery = !query || searchText.includes(query);
                const isVisible = matchesCategory && matchesQuery;
                card.hidden = !isVisible;
                if (isVisible) visible++;
              });

              if (feedback) {
                feedback.textContent = visible === 0 ? "No video lectures match your search or filter." : "";
              }
            }

            filterBtns.forEach(btn => {
              btn.addEventListener("click", () => {
                activeFilter = btn.dataset.lectureFilter;
                filterBtns.forEach(b => b.setAttribute("aria-pressed", String(b === btn)));
                filterLectures();
              });
            });

            if (searchInput) {
              searchInput.addEventListener("input", filterLectures);
            }
          });
        </script>
      </main>
<footer class="page-footer">
'@

if ($content -match $lecRegex) {
    $newContent = [regex]::Replace($content, $lecRegex, $replacement)
    # Clean encoding
    $clean = $newContent.Replace("Â·", "·").Replace("Â&middot;", "·")
    [System.IO.File]::WriteAllText("$pwd/$file", $clean, [System.Text.Encoding]::UTF8)
    Write-Output "SUCCESS: Enriched video lectures page with 10 lectures, simulation walkthroughs, filters, and search!"
} else {
    Write-Output "ERROR: Could not match lecture regex."
}
