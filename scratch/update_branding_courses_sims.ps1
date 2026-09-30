$cssToAdd = @'

/* ==========================================================================
   Courses Section Layout & Enrichment (Fixes 8-column squishing)
   ========================================================================== */
.info-panel.colearn-portal .container,
.colearn-portal .container,
.info-panel.colearn-lectures .container,
.colearn-lectures .container,
.info-panel.colearn-active-simulation .container,
.colearn-active-simulation .container {
  display: block !important;
  width: 100% !important;
  max-width: 1400px !important;
  margin-left: auto !important;
  margin-right: auto !important;
  padding-left: clamp(1.25rem, 4vw, 3.5rem) !important;
  padding-right: clamp(1.25rem, 4vw, 3.5rem) !important;
}

.colearn-portal .heading,
.colearn-lectures .heading,
.colearn-active-simulation .heading {
  display: block !important;
  width: 100% !important;
  grid-column: span 12 !important;
  margin-bottom: 2.25rem !important;
}

.colearn-portal .text,
.colearn-lectures .text,
.colearn-active-simulation .text {
  display: block !important;
  width: 100% !important;
  grid-column: span 12 !important;
}

.colearn-portal .colearn-course-grid,
.colearn-lectures .colearn-course-grid {
  display: grid !important;
  grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)) !important;
  gap: 1.75rem !important;
  width: 100% !important;
}

.colearn-portal .colearn-course,
.colearn-lectures .colearn-course {
  display: flex !important;
  flex-direction: column !important;
  justify-content: space-between !important;
  padding: 1.85rem !important;
  background: #ffffff !important;
  border: 1.5px solid var(--black, #000) !important;
  border-radius: 14px !important;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.04) !important;
  transition: transform 0.25s cubic-bezier(0.16, 1, 0.3, 1), box-shadow 0.25s cubic-bezier(0.16, 1, 0.3, 1) !important;
}

.colearn-portal .colearn-course:hover,
.colearn-lectures .colearn-course:hover {
  transform: translateY(-4px) !important;
  box-shadow: 0 10px 26px rgba(0, 0, 0, 0.08) !important;
}

.colearn-portal .colearn-course h4,
.colearn-lectures .colearn-course h4 {
  font-size: 1.4rem !important;
  font-weight: 700 !important;
  margin: 0.6rem 0 0.75rem !important;
  color: var(--black, #000) !important;
}

.colearn-portal .colearn-course p,
.colearn-lectures .colearn-course p {
  font-size: 1rem !important;
  line-height: 1.55 !important;
  color: #333333 !important;
}

.colearn-portal .colearn-learning-layout {
  display: grid !important;
  grid-template-columns: minmax(280px, 380px) minmax(0, 1fr) !important;
  gap: 2.25rem !important;
  align-items: start !important;
}

@media (max-width: 920px) {
  .colearn-portal .colearn-learning-layout {
    grid-template-columns: 1fr !important;
  }
}

.colearn-portal .colearn-overview {
  display: grid !important;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)) !important;
  gap: 1.25rem !important;
  padding: 2rem 0 !important;
  border-bottom: 1.5px solid var(--black, #000) !important;
}

/* ==========================================================================
   Vocational Accreditation & Matrix Styles
   ========================================================================== */
.colearn-matrix-wrap {
  width: 100%;
  margin-top: 2rem;
  overflow-x: auto;
  background: #ffffff;
  border: 1.5px solid var(--black, #000);
  border-radius: 14px;
  box-shadow: 0 4px 16px rgba(0,0,0,0.04);
}

.colearn-matrix-table {
  width: 100%;
  border-collapse: collapse;
  text-align: left;
  font-size: 0.95rem;
}

.colearn-matrix-table th {
  background: #f0eee9;
  font-weight: 700;
  padding: 1.1rem 1.25rem;
  border-bottom: 2px solid var(--black, #000);
  color: var(--black, #000);
  text-transform: uppercase;
  font-size: 0.8rem;
  letter-spacing: 0.05em;
}

.colearn-matrix-table td {
  padding: 1.1rem 1.25rem;
  border-bottom: 1px solid #e5e2dc;
  color: #222;
  vertical-align: middle;
}

.colearn-matrix-table tr:last-child td {
  border-bottom: none;
}

.colearn-matrix-badge {
  display: inline-block;
  padding: 3px 8px;
  border-radius: 6px;
  font-size: 0.78rem;
  font-weight: 700;
  background: #e5f7ed;
  color: #0b6b2b;
  border: 1px solid #a3e0be;
}

.colearn-matrix-badge.level3 {
  background: #eef2ff;
  color: #3730a3;
  border-color: #c7d2fe;
}

/* ==========================================================================
   Simulations Page & Simulation Videos Styling
   ========================================================================== */
.colearn-simulation-list {
  background-color: var(--putty, #d3c3ac) !important;
  padding: 4rem 0 !important;
}

.colearn-simulation-list .sectors-block {
  width: 100% !important;
  max-width: 1400px !important;
  margin: 0 auto !important;
  padding: 0 clamp(1.25rem, 4vw, 3.5rem) !important;
  box-sizing: border-box !important;
}

.colearn-simulation-list .sector-row {
  display: grid !important;
  grid-template-columns: repeat(12, 1fr) !important;
  gap: 2.75rem !important;
  align-items: center !important;
  padding: 3.5rem 0 !important;
  border-bottom: 1.5px solid rgba(0, 0, 0, 0.15) !important;
}

.colearn-simulation-list .sector-row:last-child {
  border-bottom: none !important;
}

.colearn-simulation-list .sector-row .image {
  grid-column: 1 / span 5 !important;
  width: 100% !important;
  max-width: none !important;
  aspect-ratio: 16 / 10 !important;
  border-radius: 14px !important;
  border: 1.5px solid var(--black, #000) !important;
  overflow: hidden !important;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08) !important;
  background: #000 !important;
}

.colearn-simulation-list .sector-row .image img {
  width: 100% !important;
  height: 100% !important;
  object-fit: cover !important;
  transition: transform 0.4s cubic-bezier(0.16, 1, 0.3, 1) !important;
}

.colearn-simulation-list .sector-row:hover .image img {
  transform: scale(1.04) !important;
}

.colearn-simulation-list .sector-row .text {
  grid-column: 6 / span 7 !important;
  display: flex !important;
  flex-direction: column !important;
  align-items: flex-start !important;
  width: 100% !important;
}

.colearn-simulation-list .sector-row:nth-child(even) .image {
  grid-column: 8 / span 5 !important;
  grid-row: 1 !important;
}

.colearn-simulation-list .sector-row:nth-child(even) .text {
  grid-column: 1 / span 7 !important;
  grid-row: 1 !important;
}

@media (max-width: 850px) {
  .colearn-simulation-list .sector-row,
  .colearn-simulation-list .sector-row:nth-child(even) {
    display: flex !important;
    flex-direction: column !important;
    gap: 1.5rem !important;
  }
  .colearn-simulation-list .sector-row .image,
  .colearn-simulation-list .sector-row:nth-child(even) .image {
    width: 100% !important;
    grid-column: auto !important;
    grid-row: auto !important;
  }
  .colearn-simulation-list .sector-row .text,
  .colearn-simulation-list .sector-row:nth-child(even) .text {
    width: 100% !important;
    grid-column: auto !important;
    grid-row: auto !important;
  }
}

.colearn-sim-specs-row {
  display: flex;
  flex-wrap: wrap;
  gap: 0.6rem;
  margin: 1.25rem 0 1.5rem;
}

.colearn-sim-spec-tag {
  display: inline-flex;
  align-items: center;
  gap: 0.4rem;
  padding: 0.4rem 0.85rem;
  background: rgba(255, 255, 255, 0.85);
  border: 1px solid var(--black, #000);
  border-radius: 20px;
  font-size: 0.82rem;
  font-weight: 600;
  color: var(--black, #000);
}

.colearn-sim-spec-tag svg {
  width: 14px;
  height: 14px;
  color: #333;
}

/* Simulation Videos Section */
.colearn-sim-videos-section {
  padding: 5rem 0;
  background-color: var(--stone, #f7f5f2);
  border-top: 1.5px solid var(--black, #000);
  border-bottom: 1.5px solid var(--black, #000);
}

.colearn-sim-videos-section .container {
  display: block !important;
  width: 100% !important;
  max-width: 1400px !important;
  margin: 0 auto !important;
  padding-left: clamp(1.25rem, 4vw, 3.5rem) !important;
  padding-right: clamp(1.25rem, 4vw, 3.5rem) !important;
}

.colearn-sim-video-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
  gap: 2rem;
  margin-top: 2.5rem;
}

.colearn-sim-video-card {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  background: #ffffff;
  border: 1.5px solid var(--black, #000);
  border-radius: 14px;
  padding: 1.5rem;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.04);
  transition: transform 0.25s cubic-bezier(0.16, 1, 0.3, 1), box-shadow 0.25s cubic-bezier(0.16, 1, 0.3, 1);
}

.colearn-sim-video-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 10px 28px rgba(0, 0, 0, 0.08);
}

.colearn-sim-video-card .colearn-video-thumbnail {
  aspect-ratio: 16 / 9;
  border-radius: 10px;
  overflow: hidden;
  margin-bottom: 1.25rem;
  position: relative;
  background: #000;
  border: 1.5px solid var(--black, #000);
}

.colearn-sim-video-card h3 {
  font-size: 1.3rem;
  font-weight: 700;
  margin: 0.6rem 0 0.6rem;
  color: var(--black, #000);
  line-height: 1.3;
}

.colearn-sim-video-card p {
  font-size: 0.95rem;
  line-height: 1.55;
  color: #444;
  margin: 0 0 1.25rem;
}

.colearn-sim-video-card .colearn-course-meta {
  font-size: 0.78rem;
  font-weight: 700;
  letter-spacing: 0.05em;
  text-transform: uppercase;
  color: #666;
}

.colearn-sim-video-card .colearn-video-footer {
  margin-top: auto;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding-top: 1rem;
  border-top: 1px solid #ebe8e2;
}

.colearn-sim-video-card .colearn-video-footer a.button {
  margin: 0;
}

/* Simulation Active Frame Viewer */
.colearn-active-simulation {
  padding: 5rem 0 !important;
}

.colearn-simulation-frame-wrap {
  width: 100% !important;
  min-height: 560px !important;
  border-radius: 14px !important;
  border: 2px solid var(--black, #000) !important;
  box-shadow: 0 8px 32px rgba(0,0,0,0.12) !important;
  overflow: hidden !important;
  background: #000 !important;
  margin-top: 1.5rem !important;
}

.colearn-simulation-frame-wrap iframe {
  width: 100% !important;
  height: 560px !important;
  border: none !important;
  display: block !important;
}

/* Video Lecture Filters */
.colearn-lecture-filters {
  display: flex !important;
  flex-direction: row !important;
  flex-wrap: wrap !important;
  gap: 0.75rem !important;
  margin-bottom: 2.25rem !important;
}

.colearn-lecture-filters .button[aria-pressed="true"] {
  background-color: var(--acid, #cfff03) !important;
  color: var(--black, #000) !important;
  font-weight: 700 !important;
  border-color: var(--black, #000) !important;
}
'@

Add-Content -Path 'wp-content/themes/dka/public/colearn-branding.css' -Value $cssToAdd -Encoding utf8
Write-Output "Successfully updated colearn-branding.css with Courses, Simulations, and Videos layout rules."
