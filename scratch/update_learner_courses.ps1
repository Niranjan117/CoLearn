$file = 'academy/learner/index.html'
$content = [System.IO.File]::ReadAllText("$pwd/$file", [System.Text.Encoding]::UTF8)

$oldDiscover = '(?s)<section class="colearn-subsection" id="discover" aria-labelledby="discover-title">.*?</section>\s*<section class="colearn-subsection" id="my-learning"'

$newDiscover = @'
<section class="colearn-subsection" id="discover" aria-labelledby="discover-title">
                <div class="colearn-section-heading">
                  <h3 id="discover-title">Find your next course</h3>
                  <label for="course-search">Search courses</label>
                  <input id="course-search" type="search" placeholder="Try machinery, safety, renewables or automation">
                </div>
                <div class="colearn-course-filters" role="group" aria-label="Filter courses">
                  <button class="button" type="button" data-course-filter="all" aria-pressed="true">All courses</button>
                  <button class="button" type="button" data-course-filter="safety" aria-pressed="false">Health &amp; safety</button>
                  <button class="button" type="button" data-course-filter="machinery" aria-pressed="false">Machinery</button>
                  <button class="button" type="button" data-course-filter="digital" aria-pressed="false">Digital skills</button>
                  <button class="button" type="button" data-course-filter="clean-energy" aria-pressed="false">Clean energy</button>
                  <button class="button" type="button" data-course-filter="automation" aria-pressed="false">Automation &amp; Electrical</button>
                </div>
                <div class="colearn-course-grid" id="course-list">
                  <article class="colearn-course" data-category="safety" data-search="site safety essentials construction health safety hazard ppe">
                    <p class="colearn-course-meta">NCCT FOUNDATION · 6 MODULES</p>
                    <h4>Site Safety Essentials</h4>
                    <p>Build safe habits for active construction and engineering environments. Covers PPE, hazard spotting, manual handling, and working at height.</p>
                    <p class="colearn-course-detail">4.5 hours · Beginner · Level 2 Certificate</p>
                    <button class="button" type="button" data-enroll="site-safety"><span class="button-text">Enrol now</span></button>
                  </article>

                  <article class="colearn-course" data-category="machinery" data-search="forklift powered industrial truck machine operation hydraulics stability">
                    <p class="colearn-course-meta">NCCT MACHINERY · 8 MODULES</p>
                    <h4>Forklift &amp; Plant Operations</h4>
                    <p>Learn daily walk-around pre-use checks, load center of gravity, hydraulic stability, ramp maneuvering, and safe stacking protocols.</p>
                    <p class="colearn-course-detail">7.0 hours · Intermediate · Practical Assessment</p>
                    <button class="button" type="button" data-enroll="forklift"><span class="button-text">Enrol now</span></button>
                  </article>

                  <article class="colearn-course" data-category="digital" data-search="digital construction plans data tools bim tablet cad">
                    <p class="colearn-course-meta">NCCT DIGITAL · 5 MODULES</p>
                    <h4>Digital Tools on Site</h4>
                    <p>Navigate 2D/3D BIM models on site tablets, record digital quality assurance inspections, cloud job ticketing, and connected smart tools.</p>
                    <p class="colearn-course-detail">3.5 hours · Beginner · Technical Skills Badge</p>
                    <button class="button" type="button" data-enroll="digital-tools"><span class="button-text">Enrol now</span></button>
                  </article>

                  <article class="colearn-course" data-category="clean-energy" data-search="renewable clean energy wind turbine solar thermal power generation pv inverter grid">
                    <p class="colearn-course-meta">NCCT CLEAN ENERGY · 7 MODULES</p>
                    <h4>Renewable Energy Systems (Wind &amp; Solar)</h4>
                    <p>Master wind turbine aerodynamics, solar thermal collectors, PV inverter safety, thermal storage calculations, and grid connection principles.</p>
                    <p class="colearn-course-detail">6.5 hours · Intermediate · Level 3 Certificate</p>
                    <button class="button" type="button" data-enroll="renewable-energy"><span class="button-text">Enrol now</span></button>
                  </article>

                  <article class="colearn-course" data-category="automation" data-search="industrial automation programmable logic controller plc sensor ladder logic motor control relay">
                    <p class="colearn-course-meta">NCCT AUTOMATION · 8 MODULES</p>
                    <h4>Industrial Automation &amp; PLC Logic</h4>
                    <p>Program ladder logic diagrams, troubleshoot 24V industrial sensor loops, calibrate automated conveyor sequencing, and test safety interlocks.</p>
                    <p class="colearn-course-detail">8.0 hours · Intermediate · Technical Badge</p>
                    <button class="button" type="button" data-enroll="plc-automation"><span class="button-text">Enrol now</span></button>
                  </article>

                  <article class="colearn-course" data-category="automation" data-search="electrical safety isolation lockout tagout loto 18th edition test instruments wiring regulations">
                    <p class="colearn-course-meta">NCCT ELECTRICAL · 6 MODULES</p>
                    <h4>Electrical Safety &amp; Safe Isolation</h4>
                    <p>Perform approved multi-stage safe isolation procedures, verify two-pole test instruments, implement Lockout/Tagout (LOTO), and review BS 7671 rules.</p>
                    <p class="colearn-course-detail">5.0 hours · Intermediate · Industry Qualification</p>
                    <button class="button" type="button" data-enroll="electrical-isolation"><span class="button-text">Enrol now</span></button>
                  </article>
                </div>
                <p class="colearn-feedback" id="course-feedback" role="status" aria-live="polite"></p>
              </section>

              <section class="colearn-subsection" id="my-learning"
'@

if ($content -match $oldDiscover) {
    $newContent = [regex]::Replace($content, $oldDiscover, $newDiscover)
    $clean = $newContent.Replace("Â·", "·").Replace("Â&middot;", "·")
    [System.IO.File]::WriteAllText("$pwd/$file", $clean, [System.Text.Encoding]::UTF8)
    Write-Output "SUCCESS: Synchronized 6 courses in learner hub (academy/learner/index.html)"
} else {
    Write-Output "ERROR: Could not match discover section in learner hub."
}
