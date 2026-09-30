$file = 'academy/simulations/index.html'
$content = [System.IO.File]::ReadAllText("$pwd/$file", [System.Text.Encoding]::UTF8)

# Target block: lines from <section class="full-sectors-list colearn-simulation-list"> to </main>
$simRegex = '(?s)<section class="full-sectors-list colearn-simulation-list">.*?</main>'

$replacement = @'
<section class="full-sectors-list colearn-simulation-list">
          <div class="sectors-block">
            <!-- Hydroelectric Simulation -->
            <article class="container sector-row" data-hash="dam">
              <figure class="image">
                <img class="fill" src="/Dam/Dam%20Simulation/mm/neue-energien/wasserkraft/asset/images/og-image-wasserkraft.jpg" alt="Hydroelectric dam simulation" loading="lazy">
              </figure>
              <div class="text">
                <div class="heading-container" data-module="heading-with-line-animation">
                  <h2 class="text-reveal">Hydroelectric power simulation</h2>
                  <figure class="line" aria-hidden="true"></figure>
                </div>
                <p class="description">
                  Follow gravitational potential energy as reservoir water accelerates through the penstock into the turbine runner. Adjust gate opening percentages, monitor head pressure, and observe 3-phase AC generator synchronisation.
                </p>
                <div class="colearn-sim-specs-row">
                  <span class="colearn-sim-spec-tag">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 2.69l5.66 5.66a8 8 0 1 1-11.31 0z"/></svg>
                    Water Head: 45–120m
                  </span>
                  <span class="colearn-sim-spec-tag">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"/></svg>
                    Francis Reaction Turbine
                  </span>
                  <span class="colearn-sim-spec-tag">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
                    Peak Output: 250 MW
                  </span>
                  <span class="colearn-sim-spec-tag">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M9 21V9"/></svg>
                    Grid Sync: 50 Hz
                  </span>
                </div>
                <div style="display:flex;gap:1.25rem;flex-wrap:wrap;align-items:center;">
                  <a class="button" href="/Dam/Dam%20Simulation/mm/neue-energien/wasserkraft/index.html" target="_blank" rel="noopener" data-launch-simulation="dam"><span class="button-text">Launch in new tab ↗</span></a>
                  <a class="colearn-direct-link" href="#simulation-viewer" data-simulation="dam">Open in embedded lab ↓</a>
                </div>
              </div>
              <hr>
            </article>

            <!-- Solar Thermal Simulation -->
            <article class="container sector-row" data-hash="solar">
              <figure class="image">
                <img class="fill" src="/Solar/Solar%20Panel/mm/neue-energien/solarthermie/asset/images/pages/start/bg-start-page.png" alt="Solar thermal simulation" loading="lazy">
              </figure>
              <div class="text">
                <div class="heading-container" data-module="heading-with-line-animation">
                  <h2 class="text-reveal">Solar thermal circulation</h2>
                  <figure class="line" aria-hidden="true"></figure>
                </div>
                <p class="description">
                  Investigate how flat-plate and evacuated tube collectors capture radiant solar flux. Regulate the solar loop circulation pump, observe heat exchanger thermal transfer into the domestic cylinder, and monitor pressure safety margins.
                </p>
                <div class="colearn-sim-specs-row">
                  <span class="colearn-sim-spec-tag">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="5"/><path d="M12 1v2M12 21v2M4.22 4.22l1.42 1.42M18.36 18.36l1.42 1.42M1 12h2M21 12h2M4.22 19.78l1.42-1.42M18.36 5.64l1.42-1.42"/></svg>
                    Absorber Efficiency: 78%
                  </span>
                  <span class="colearn-sim-spec-tag">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 14.76V3.5a2.5 2.5 0 0 0-5 0v11.26a4.5 4.5 0 1 0 5 0z"/></svg>
                    Peak Temperature: 92°C
                  </span>
                  <span class="colearn-sim-spec-tag">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 2.69l5.66 5.66a8 8 0 1 1-11.31 0z"/></svg>
                    Fluid: Propylene Glycol
                  </span>
                  <span class="colearn-sim-spec-tag">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M12 6v6l4 2"/></svg>
                    Cylinder: 300L Dual-Coil
                  </span>
                </div>
                <div style="display:flex;gap:1.25rem;flex-wrap:wrap;align-items:center;">
                  <a class="button" href="/Solar/Solar%20Panel/mm/neue-energien/solarthermie/index.html" target="_blank" rel="noopener" data-launch-simulation="solar"><span class="button-text">Launch in new tab ↗</span></a>
                  <a class="colearn-direct-link" href="#simulation-viewer" data-simulation="solar">Open in embedded lab ↓</a>
                </div>
              </div>
              <hr>
            </article>

            <!-- Wind Power Simulation -->
            <article class="container sector-row" data-hash="wind">
              <figure class="image">
                <img class="fill" src="/Wind%20Power/Wind%20Power/mm/neue-energien/windkraft/asset/images/pages/start/bg-start-page.png" alt="Wind power simulation" loading="lazy">
              </figure>
              <div class="text">
                <div class="heading-container" data-module="heading-with-line-animation">
                  <h2 class="text-reveal">Wind power generation</h2>
                  <figure class="line" aria-hidden="true"></figure>
                </div>
                <p class="description">
                  Discover how aerodynamic lift turns kinetic wind energy into rotary mechanical power. Experiment with blade pitch angle control, yaw alignment into variable wind headings, planetary step-up gearboxes, and aerodynamic tip-braking protocols during gale conditions.
                </p>
                <div class="colearn-sim-specs-row">
                  <span class="colearn-sim-spec-tag">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9.59 4.59A2 2 0 1 1 11 8H2m10.59 11.41A2 2 0 1 0 14 16H2m15.73-8.27A2.5 2.5 0 1 1 19.5 12H2"/></svg>
                    Cut-in Wind: 3.5 m/s
                  </span>
                  <span class="colearn-sim-spec-tag">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
                    Rated Power: 2.0 MW
                  </span>
                  <span class="colearn-sim-spec-tag">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M14.31 8l5.74 9.94M9.69 8h11.48M7.38 12l5.74-9.94M9.69 16L3.95 6.06M14.31 16H2.83M16.62 12l-5.74 9.94"/></svg>
                    Rotor Diameter: 82m
                  </span>
                  <span class="colearn-sim-spec-tag">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M18 10h-1.26A8 8 0 1 0 9 20h9a5 5 0 0 0 0-10z"/></svg>
                    Cut-out Brake: 25 m/s
                  </span>
                </div>
                <div style="display:flex;gap:1.25rem;flex-wrap:wrap;align-items:center;">
                  <a class="button" href="/Wind%20Power/Wind%20Power/mm/neue-energien/windkraft/index.html" target="_blank" rel="noopener" data-launch-simulation="wind"><span class="button-text">Launch in new tab ↗</span></a>
                  <a class="colearn-direct-link" href="#simulation-viewer" data-simulation="wind">Open in embedded lab ↓</a>
                </div>
              </div>
              <hr>
            </article>
          </div>
        </section>

        <!-- Simulation Video Walkthroughs Section -->
        <section class="colearn-sim-videos-section" id="simulation-videos">
          <div class="container">
            <div class="heading-container" data-module="heading-with-line-animation">
              <h2 class="text-reveal" style="font-size: 2.5rem; font-weight: 700; color: var(--black, #000); margin: 0 0 0.75rem;">
                Simulation Video Walkthroughs
              </h2>
              <figure class="line" aria-hidden="true" style="width: 100%; height: 4px; background-color: var(--acid, #cfff03); margin-bottom: 1.5rem;"></figure>
            </div>
            <p style="font-size: 1.2rem; line-height: 1.6; color: #333; max-width: 52rem; margin-bottom: 2rem;">
              Watch instructor-led video walkthroughs for each interactive model. Understand the underlying physics, diagnostic controls, and parameter sweeps before conducting your hands-on simulations.
            </p>

            <div class="colearn-sim-video-grid">
              <!-- Video 1: Hydro Dam -->
              <article class="colearn-sim-video-card">
                <a class="colearn-video-thumbnail" href="https://www.youtube.com/watch?v=q8HmRLCgDAI" target="_blank" rel="noopener" aria-label="Watch Hydroelectric Simulation Walkthrough on YouTube">
                  <img src="https://img.youtube.com/vi/q8HmRLCgDAI/hqdefault.jpg" onerror="this.onerror=null;this.src='/Dam/Dam%20Simulation/mm/neue-energien/wasserkraft/asset/images/og-image-wasserkraft.jpg';" alt="Hydroelectric dam simulation walkthrough thumbnail" loading="lazy">
                  <span class="colearn-play-button">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
                    Watch on YouTube
                  </span>
                  <span class="colearn-video-duration">12:45</span>
                </a>
                <p class="colearn-course-meta">SIMULATION WALKTHROUGH · HYDRO DYNAMICS</p>
                <h3>Hydroelectric Dam Flow &amp; Turbine Mechanics</h3>
                <p>Detailed analysis of penstock hydrostatic pressure, Francis turbine velocity triangles, guide vane positioning, and generator phase sync.</p>
                <div class="colearn-video-footer">
                  <a class="button" href="https://www.youtube.com/watch?v=q8HmRLCgDAI" target="_blank" rel="noopener">
                    <span class="button-text">Watch video (12:45) ↗</span>
                  </a>
                  <a class="button" href="/Dam/Dam%20Simulation/mm/neue-energien/wasserkraft/index.html" target="_blank" rel="noopener" style="background:var(--acid,#cfff03); color:#000;">
                    <span class="button-text">Open Model ↗</span>
                  </a>
                </div>
              </article>

              <!-- Video 2: Wind Turbine -->
              <article class="colearn-sim-video-card">
                <a class="colearn-video-thumbnail" href="https://www.youtube.com/watch?v=qSWm_nprfqE" target="_blank" rel="noopener" aria-label="Watch Wind Turbine Simulation Walkthrough on YouTube">
                  <img src="https://img.youtube.com/vi/qSWm_nprfqE/hqdefault.jpg" onerror="this.onerror=null;this.src='/Wind%20Power/Wind%20Power/mm/neue-energien/windkraft/asset/images/pages/start/bg-start-page.png';" alt="Wind turbine simulation walkthrough thumbnail" loading="lazy">
                  <span class="colearn-play-button">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
                    Watch on YouTube
                  </span>
                  <span class="colearn-video-duration">14:20</span>
                </a>
                <p class="colearn-course-meta">SIMULATION WALKTHROUGH · WIND GENERATION</p>
                <h3>Wind Turbine Pitch, Yaw &amp; High-Wind Safety</h3>
                <p>Learn anemometer readings, active yaw gear ring movement, aerofoil blade pitch regulation to prevent stalling, and mechanical disc brake fail-safes.</p>
                <div class="colearn-video-footer">
                  <a class="button" href="https://www.youtube.com/watch?v=qSWm_nprfqE" target="_blank" rel="noopener">
                    <span class="button-text">Watch video (14:20) ↗</span>
                  </a>
                  <a class="button" href="/Wind%20Power/Wind%20Power/mm/neue-energien/windkraft/index.html" target="_blank" rel="noopener" style="background:var(--acid,#cfff03); color:#000;">
                    <span class="button-text">Open Model ↗</span>
                  </a>
                </div>
              </article>

              <!-- Video 3: Solar Thermal -->
              <article class="colearn-sim-video-card">
                <a class="colearn-video-thumbnail" href="https://www.youtube.com/watch?v=0elhIcPVtKE" target="_blank" rel="noopener" aria-label="Watch Solar Thermal Simulation Walkthrough on YouTube">
                  <img src="https://img.youtube.com/vi/0elhIcPVtKE/hqdefault.jpg" onerror="this.onerror=null;this.src='/Solar/Solar%20Panel/mm/neue-energien/solarthermie/asset/images/pages/start/bg-start-page.png';" alt="Solar thermal simulation walkthrough thumbnail" loading="lazy">
                  <span class="colearn-play-button">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
                    Watch on YouTube
                  </span>
                  <span class="colearn-video-duration">10:15</span>
                </a>
                <p class="colearn-course-meta">SIMULATION WALKTHROUGH · CLEAN HEAT</p>
                <h3>Solar Thermal Circulation &amp; Heat Storage</h3>
                <p>Explore heat pipe vacuum collectors, differential temperature sensor loops, expansion vessel volume checks, and thermal stratification inside storage cylinders.</p>
                <div class="colearn-video-footer">
                  <a class="button" href="https://www.youtube.com/watch?v=0elhIcPVtKE" target="_blank" rel="noopener">
                    <span class="button-text">Watch video (10:15) ↗</span>
                  </a>
                  <a class="button" href="/Solar/Solar%20Panel/mm/neue-energien/solarthermie/index.html" target="_blank" rel="noopener" style="background:var(--acid,#cfff03); color:#000;">
                    <span class="button-text">Open Model ↗</span>
                  </a>
                </div>
              </article>

              <!-- Video 4: Masterclass -->
              <article class="colearn-sim-video-card">
                <a class="colearn-video-thumbnail" href="https://www.youtube.com/watch?v=kYJvMv1V8sY" target="_blank" rel="noopener" aria-label="Watch Simulation Diagnostics Masterclass on YouTube">
                  <img src="https://img.youtube.com/vi/kYJvMv1V8sY/hqdefault.jpg" onerror="this.onerror=null;this.src='/wp-content/uploads/pho/group-diverse-pupils-engaging-online-course-discussion-via-video-call_482257-123125.avif';" alt="Virtual engineering lab masterclass thumbnail" loading="lazy">
                  <span class="colearn-play-button">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
                    Watch on YouTube
                  </span>
                  <span class="colearn-video-duration">16:30</span>
                </a>
                <p class="colearn-course-meta">ENGINEERING MASTERCLASS · VIRTUAL LAB</p>
                <h3>Virtual Lab Parameter Sweeps &amp; Diagnostics</h3>
                <p>Masterclass on recording live operational telemetry, calculating system efficiency curves under variable environmental loads, and troubleshooting simulated alarms.</p>
                <div class="colearn-video-footer">
                  <a class="button" href="https://www.youtube.com/watch?v=kYJvMv1V8sY" target="_blank" rel="noopener">
                    <span class="button-text">Watch video (16:30) ↗</span>
                  </a>
                  <a class="button" href="/academy/courses/#accreditations" style="background:#fff; color:#000;">
                    <span class="button-text">Course Credit ↗</span>
                  </a>
                </div>
              </article>
            </div>
          </div>
        </section>

        <!-- Interactive Simulation Viewer Section -->
        <section class="info-panel colearn-active-simulation" id="simulation-viewer" data-background-color="stone" data-margin="yes" aria-labelledby="simulation-view-title">
          <div class="container">
            <div class="heading" data-module="heading-with-line-animation">
              <h2 class="text-reveal" id="simulation-view-title">Interactive Simulation Lab Viewer</h2>
              <figure class="line" aria-hidden="true"></figure>
            </div>
            <div class="text" data-module="fade-in">
              <p id="simulation-instructions" style="font-size:1.15rem; line-height:1.6; margin-bottom:1.5rem; color:#222;">
                Select any simulation model above or click the tabs below to launch in the interactive canvas. Each simulation retains full interactive physics controls, cross-section views, and operating meters.
              </p>
              <div style="display:flex; gap:0.75rem; flex-wrap:wrap; margin-bottom:1.5rem;">
                <button class="button" type="button" data-simulation="dam" aria-pressed="true"><span class="button-text">Hydroelectric Dam</span></button>
                <button class="button" type="button" data-simulation="solar" aria-pressed="false"><span class="button-text">Solar Thermal</span></button>
                <button class="button" type="button" data-simulation="wind" aria-pressed="false"><span class="button-text">Wind Turbine</span></button>
              </div>
              <div class="colearn-simulation-frame-wrap">
                <iframe id="simulation-frame" src="/Dam/Dam%20Simulation/mm/neue-energien/wasserkraft/index.html" title="Interactive energy learning simulation" loading="lazy" allow="fullscreen; autoplay; accelerometer; gyroscope" allowfullscreen></iframe>
              </div>
            </div>
          </div>
        </section>
      </main>
'@

if ($content -match $simRegex) {
    $newContent = [regex]::Replace($content, $simRegex, $replacement)
    [System.IO.File]::WriteAllText("$pwd/$file", $newContent, [System.Text.Encoding]::UTF8)
    Write-Output "SUCCESS: Updated academy/simulations/index.html with enriched specs, video walkthroughs, and viewer."
} else {
    Write-Output "ERROR: Could not match simulation section regex."
}
