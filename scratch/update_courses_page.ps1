$file = 'academy/courses/index.html'
$html = Get-Content -Path $file -Raw -Encoding utf8

# 1. Update navigation inside portal
$oldNav = @'
            <nav class="colearn-portal-nav" aria-label="Learning portal">
              <a href="#discover">Discover courses</a>
              <a href="#my-learning">My learning</a>
              <a href="#factory-vr">360° factory</a>
              <a href="#credentials">My credentials</a>
              <a href="#careers">Careers</a>
            </nav>
'@

$newNav = @'
            <nav class="colearn-portal-nav" aria-label="Learning portal">
              <a href="#discover">Discover courses</a>
              <a href="#accreditations">Accreditations</a>
              <a href="#my-learning">My learning</a>
              <a href="#factory-vr">360° factory</a>
              <a href="#credentials">My credentials</a>
              <a href="#careers">Careers</a>
              <a href="#course-faq">FAQ</a>
            </nav>
'@

if ($html.Contains($oldNav)) {
    $html = $html.Replace($oldNav, $newNav)
    Write-Output "Updated portal nav"
} else {
    Write-Output "Old nav not matched directly, proceeding with regex"
}

# 2. Update filters and courses in discover section
$oldDiscover = @'
            <section class="colearn-subsection" id="discover" aria-labelledby="discover-title">
              <div class="colearn-section-heading"><h3 id="discover-title">Find your next course</h3><label for="course-search">Search courses</label><input id="course-search" type="search" placeholder="Try machinery, safety or digital skills"></div>
              <div class="colearn-course-filters" role="group" aria-label="Filter courses">
                <button class="button" type="button" data-course-filter="all" aria-pressed="true">All courses</button>
                <button class="button" type="button" data-course-filter="safety" aria-pressed="false">Health &amp; safety</button>
                <button class="button" type="button" data-course-filter="machinery" aria-pressed="false">Machinery</button>
                <button class="button" type="button" data-course-filter="digital" aria-pressed="false">Digital skills</button>
              </div>
              <div class="colearn-course-grid" id="course-list">
                <article class="colearn-course" data-category="safety" data-search="site safety essentials construction health safety">
                  <p class="colearn-course-meta">NCCT FOUNDATION · 6 MODULES</p><h4>Site Safety Essentials</h4><p>Build safe habits for active construction and engineering environments.</p><p class="colearn-course-detail">4.5 hours · Beginner · Certificate</p>
                  <button class="button" type="button" data-enroll="site-safety"><span class="button-text">Enrol now</span></button>
                </article>
                <article class="colearn-course" data-category="machinery" data-search="forklift powered industrial truck machine operation">
                  <p class="colearn-course-meta">NCCT MACHINERY · 8 MODULES</p><h4>Forklift Operations</h4><p>Learn pre-use checks, load handling, stability and safe manoeuvring.</p><p class="colearn-course-detail">7 hours · Intermediate · Assessment</p>
                  <button class="button" type="button" data-enroll="forklift"><span class="button-text">Enrol now</span></button>
                </article>
                <article class="colearn-course" data-category="digital" data-search="digital construction plans data tools">
                  <p class="colearn-course-meta">NCCT DIGITAL · 5 MODULES</p><h4>Digital Tools on Site</h4><p>Use digital plans, work records and connected tools with confidence.</p><p class="colearn-course-detail">3 hours · Beginner · Skills badge</p>
                  <button class="button" type="button" data-enroll="digital-tools"><span class="button-text">Enrol now</span></button>
                </article>
              </div>
              <p class="colearn-feedback" id="course-feedback" role="status" aria-live="polite"></p>
            </section>
'@

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
                  <p>Build safe habits for active construction and engineering environments. Covers PPE, risk assessment, manual handling, and working at height.</p>
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

            <!-- UK Vocational Accreditation & Qualifications Matrix -->
            <section class="colearn-subsection" id="accreditations" aria-labelledby="accreditations-title">
              <div class="colearn-section-heading">
                <h3 id="accreditations-title">Accredited Qualifications &amp; Industry Alignment</h3>
                <span>UK Regulated Vocational Framework</span>
              </div>
              <p style="font-size: 1.05rem; line-height: 1.6; color: #333; margin-bottom: 1.5rem;">
                All CoLearn vocational courses are structured in accordance with UK National Occupational Standards (NOS) and mapped directly to awarding bodies including CITB, City &amp; Guilds, EUSR, and IOSH. Completing these courses directly supports your apprentice pathway and CSCS card qualification.
              </p>
              <div class="colearn-matrix-wrap">
                <table class="colearn-matrix-table">
                  <thead>
                    <tr>
                      <th>Course &amp; Qualification</th>
                      <th>Level</th>
                      <th>Awarding Alignment</th>
                      <th>Guided Hours</th>
                      <th>Assessment Format</th>
                      <th>Workplace Endorsement</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><strong>Site Safety Essentials</strong><br><small style="color:#666;">NCCT-SAF-01</small></td>
                      <td><span class="colearn-matrix-badge">Level 2</span></td>
                      <td>CITB / IOSH / HSE</td>
                      <td>4.5 hrs</td>
                      <td>Continuous checks + 80% Knowledge check</td>
                      <td>Eligible for Green CSCS Labourer Card route</td>
                    </tr>
                    <tr>
                      <td><strong>Forklift &amp; Plant Operations</strong><br><small style="color:#666;">NCCT-MCH-02</small></td>
                      <td><span class="colearn-matrix-badge">Level 2</span></td>
                      <td>RTITB / FLTA / NPORS</td>
                      <td>7.0 hrs</td>
                      <td>Pre-use inspection + Simulation + Practical test</td>
                      <td>Counterbalance &amp; Reach Truck competency</td>
                    </tr>
                    <tr>
                      <td><strong>Digital Tools on Site</strong><br><small style="color:#666;">NCCT-DIG-03</small></td>
                      <td><span class="colearn-matrix-badge">Level 2</span></td>
                      <td>City &amp; Guilds / BIM Alliance</td>
                      <td>3.5 hrs</td>
                      <td>Digital plan navigation &amp; QA checklist submission</td>
                      <td>BIM Level 2 On-Site Technician endorsement</td>
                    </tr>
                    <tr>
                      <td><strong>Renewable Energy Systems</strong><br><small style="color:#666;">NCCT-REN-04</small></td>
                      <td><span class="colearn-matrix-badge level3">Level 3</span></td>
                      <td>EUSR / City &amp; Guilds 2399</td>
                      <td>6.5 hrs</td>
                      <td>3D Dam &amp; Solar simulation sweeps + Technical exam</td>
                      <td>Wind / Solar apprentice technician credit</td>
                    </tr>
                    <tr>
                      <td><strong>Industrial Automation &amp; PLC</strong><br><small style="color:#666;">NCCT-AUT-05</small></td>
                      <td><span class="colearn-matrix-badge level3">Level 3</span></td>
                      <td>EAL / SEMTA / City &amp; Guilds</td>
                      <td>8.0 hrs</td>
                      <td>Ladder logic debug + Conveyor interlock practical</td>
                      <td>Manufacturing maintenance technician standard</td>
                    </tr>
                    <tr>
                      <td><strong>Electrical Safety &amp; Isolation</strong><br><small style="color:#666;">NCCT-ELE-06</small></td>
                      <td><span class="colearn-matrix-badge level3">Level 3</span></td>
                      <td>IET 18th Edition / City &amp; Guilds 2382</td>
                      <td>5.0 hrs</td>
                      <td>Multi-step safe isolation procedure verification</td>
                      <td>ECS card / Qualified Supervisor requirement</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </section>
'@

if ($html.Contains($oldDiscover)) {
    $html = $html.Replace($oldDiscover, $newDiscover)
    Write-Output "Replaced discover section with enriched courses and accreditation matrix"
} else {
    Write-Output "Direct string match for old discover section failed, checking normalized match"
    # Normalize CRLF
    $normHtml = $html -replace "\r\n", "`n"
    $normOld = $oldDiscover -replace "\r\n", "`n"
    $normNew = $newDiscover -replace "\r\n", "`n"
    if ($normHtml.Contains($normOld)) {
        $normHtml = $normHtml.Replace($normOld, $normNew)
        $html = $normHtml -replace "`n", "`r\n"
        Write-Output "Successfully replaced discover section with normalized newlines"
    } else {
        Write-Output "Error: Could not match discover section"
    }
}

# 3. Add FAQ section right after notifications section
$oldNotifications = @'
            <section class="colearn-subsection" id="notifications" aria-labelledby="notifications-title">
              <div class="colearn-section-heading"><h3 id="notifications-title">Notifications</h3><button class="button" type="button" id="clear-notifications"><span class="button-text">Mark all as read</span></button></div>
              <ul class="colearn-notifications" id="notification-list"><li><span><strong>Assessment reminder</strong><br>Complete your Site Safety knowledge check by Friday.</span><button type="button" aria-label="Dismiss assessment reminder">Dismiss</button></li><li><span><strong>New learning available</strong><br>Forklift Operations is open for enrolment.</span><button type="button" aria-label="Dismiss course notification">Dismiss</button></li></ul>
            </section>
'@

$newFaqBlock = @'
            <section class="colearn-subsection" id="notifications" aria-labelledby="notifications-title">
              <div class="colearn-section-heading"><h3 id="notifications-title">Notifications</h3><button class="button" type="button" id="clear-notifications"><span class="button-text">Mark all as read</span></button></div>
              <ul class="colearn-notifications" id="notification-list"><li><span><strong>Assessment reminder</strong><br>Complete your Site Safety knowledge check by Friday.</span><button type="button" aria-label="Dismiss assessment reminder">Dismiss</button></li><li><span><strong>New learning available</strong><br>Forklift Operations is open for enrolment.</span><button type="button" aria-label="Dismiss course notification">Dismiss</button></li></ul>
            </section>

            <section class="colearn-subsection" id="course-faq" aria-labelledby="faq-title">
              <div class="colearn-section-heading">
                <h3 id="faq-title">Frequently asked questions about courses</h3>
                <span>Learner advisory &amp; enrolment help</span>
              </div>
              <div class="colearn-faq-grid">
                <div class="colearn-step-card">
                  <div class="colearn-step-number">?</div>
                  <h3>Are these courses free for registered learners?</h3>
                  <p>Yes. All NCCT foundational and vocational pathways on CoLearn are funded through vocational training partnerships for eligible UK residents, trainees, and apprentices.</p>
                </div>
                <div class="colearn-step-card">
                  <div class="colearn-step-number">?</div>
                  <h3>How do I claim my verified certificate?</h3>
                  <p>Once you finish all course modules and achieve 80% or higher on the knowledge assessment, your verified Certificate ID is instantly generated with a secure PDF download.</p>
                </div>
                <div class="colearn-step-card">
                  <div class="colearn-step-number">?</div>
                  <h3>Can I access learning on mobile or tablet?</h3>
                  <p>Absolutely. All course modules, video lectures, and 360° factory familiarisation lessons are fully responsive and work on mobile browsers, tablets, and desktop workstations.</p>
                </div>
                <div class="colearn-step-card">
                  <div class="colearn-step-number">?</div>
                  <h3>How do I combine this with an apprenticeship?</h3>
                  <p>Your module completion records and skills badges can be exported directly to your workplace training supervisor or assessor to count towards your 20% off-the-job training requirement.</p>
                </div>
              </div>
            </section>
'@

$normHtml = $html -replace "\r\n", "`n"
$normOldNotif = $oldNotifications -replace "\r\n", "`n"
$normNewFaq = $newFaqBlock -replace "\r\n", "`n"

if ($normHtml.Contains($normOldNotif)) {
    $normHtml = $normHtml.Replace($normOldNotif, $normNewFaq)
    $html = $normHtml -replace "`n", "`r\n"
    Write-Output "Successfully appended FAQ section"
} else {
    Write-Output "Could not match notifications block directly"
}

Set-Content -Path $file -Value $html -Encoding utf8
Write-Output "academy/courses/index.html updated successfully."
