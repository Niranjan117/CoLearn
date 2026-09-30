# CoLearn | Vocational Skills & NCCT Learning Platform

[![Vercel Deployment](https://img.shields.io/badge/Vercel-Ready-black?style=flat&logo=vercel)](https://vercel.com)
[![Platform](https://img.shields.io/badge/Platform-Static%20HTML5%20%7C%20CSS3%20%7C%20Vanilla%20JS-blue)](#technology-stack)
[![Typography](https://img.shields.io/badge/Font-Roobert%20%26%20Aeonik-cfff03?color=000000&labelColor=cfff03)](#design-system--typography)
[![Accreditation](https://img.shields.io/badge/Standards-CITB%20%7C%20City%20%26%20Guilds%20%7C%20EUSR%20%7C%20IOSH-green)](#vocational-accreditation-framework)

**CoLearn** is an accredited vocational education platform built for National Construction College & Training (NCCT) pathways. It empowers UK learners, apprentices, and technical professionals with structured vocational courses, 3D interactive physics simulations, video walkthrough demonstrations, real-time career directory listings, and an automated credentials verification engine.

---

## Table of Contents

- [Executive Overview](#executive-overview)
- [Project Directory Structure](#project-directory-structure)
- [Core Features & Modules](#core-features--modules)
  - [1. Vocational Courses Portal](#1-vocational-courses-portal)
  - [2. Interactive 3D Simulations & Video Walkthroughs](#2-interactive-3d-simulations--video-walkthroughs)
  - [3. Video Lectures Library](#3-video-lectures-library)
  - [4. Career Pathways & Wage Guide](#4-career-pathways--wage-guide)
  - [5. Learner Hub & Credentials Engine](#5-learner-hub--credentials-engine)
  - [6. CoLearn AI Vocational Assistant](#6-colearn-ai-vocational-assistant)
  - [7. Learner Support & Advisory Desk](#7-learner-support--advisory-desk)
- [Design System & Typography](#design-system--typography)
- [Technology Stack](#technology-stack)
- [Local Development](#local-development)
- [Deployment on Vercel](#deployment-on-vercel)
- [Performance & Security](#performance--security)
- [License](#license)

---

## Executive Overview

CoLearn combines contemporary web design aesthetics with vocational training rigor. The platform delivers:

* **Authentic Vocational Curriculum**: Mapped directly to UK National Occupational Standards (NOS) across Health & Safety, Plant Operations, Digital Construction (BIM), Clean Energy, and Automation.
* **3D Energy Physics Simulations**: Standalone Three.js simulations allowing learners to experiment with penstock water head, wind turbine blade pitch/yaw dynamics, and solar thermal glycol loops.
* **Integrated Learner Engine**: Client-side state persistence (`localStorage`) managing course enrolments, multi-step module tracking, interactive 5-question safety assessments, and instant PDF-ready certificate generation (`NCCT-YYYY-XXXX`).
* **Intelligent AI Assistant**: A bottom-left floating chatbot widget supporting live OpenAI API streaming with a built-in context-aware vocational fallback knowledge engine.

---

## Project Directory Structure

```
CoLearn Website/
|-- 404.html                              # Branded 404 error page with quick pathway navigation
|-- index.html                            # Platform homepage & vocational pathway overview
|-- package.json                          # Project metadata and local development scripts
|-- README.md                             # Comprehensive platform documentation (this file)
|-- serve.js                              # Node.js static server with HTTP 206 Range streaming
|-- vercel.json                           # Vercel production edge deployment & routing configuration
|-- .gitignore                            # Clean repository exclusions (caches, scratch files)
|
|-- academy/                              # Academy & Vocational Learning Ecosystem
|   |-- index.html                        # Academy landing page and sector overview
|   |-- portal.css                        # Learner hub, module player & course catalog styles
|   |-- portal.js                         # Client-side module navigation, quiz engine & state
|   |-- courses/                          # 6 Accredited Vocational Courses & Accreditation Matrix
|   |   `-- index.html                    # Course catalog, search/filter, matrix table & FAQs
|   |-- simulations/                      # Interactive 3D Energy Simulations
|   |   |-- index.html                    # Technical specs, video walkthroughs & live viewer
|   |   |-- simulations.css               # Simulation rows, badges & iframe viewer styles
|   |   `-- simulations.js                # Simulation launcher & in-page tab controller
|   |-- lectures/                         # Video Lectures & Practical Demonstrations
|   |   `-- index.html                    # 10 Technical masterclasses with live search & filters
|   `-- learner/                          # Personalized Learner Hub
|       `-- index.html                    # Attendance, skills badges, 360 factory & certificate claim
|
|-- work/                                 # Career Opportunities & Vocational Pathways
|   `-- index.html                        # 9 High-demand roles, UK wage guide, & 4-step career engine
|
|-- contact/                              # Learner Support & Advisory Services
|   `-- index.html                        # Multi-channel advisory desk, ticket generator & FAQs
|
|-- insights/                             # Industry Insights & Educational Resources
|   `-- index.html                        # Technical articles and lecture hub redirects
|
|-- Dam/                                  # Hydroelectric Dam Simulation Engine
|   `-- Dam Simulation/                   # Standalone 3D Francis turbine & penstock physics model
|       |-- index.html                    # Simulation web application
|       |-- global_assets/                # Shared 3D tracking & font resources
|       `-- mm/neue-energien/wasserkraft/ # Three.js meshes, shaders, audio, and physics scripts
|
|-- Solar/                                # Solar Thermal Simulation Engine
|   `-- Solar Panel/                      # Standalone evacuated tube & glycol loop simulation
|       `-- mm/neue-energien/solarthermie/# Collector efficiency curves, heat exchanger & controls
|
|-- Wind Power/                           # Wind Turbine Simulation Engine
|   `-- Wind Power/                       # Standalone aerodynamic lift & yaw/pitch simulation
|       `-- mm/neue-energien/windkraft/   # Blade aerofoils, planetary gearbox & storm brake logic
|
|-- global_assets/                        # Root-level mirror of simulation runtime assets
|   `-- trk/                              # Tracking and shared simulation dependencies
|
|-- wp-content/                           # Design System, Assets & Theme Engine
|   |-- themes/dka/public/                # Core design system bundles
|   |   |-- colearn-branding.css          # Theme layout overrides, custom cards, tables & widgets
|   |   |-- colearn-branding.js           # AI Chatbot, link normalizer & interactive components
|   |   |-- main-fe256391.css             # Base framework layout, grid & typography tokens
|   |   |-- main-a8b798b6.js              # Theme interaction & animation runtime
|   |   `-- subset-Roobert-*.woff2        # Embedded brand fonts (Medium, SemiBold, Bold)
|   |-- resources/svg/                    # Vector brand assets, wordmarks, icons, and badges
|   `-- uploads/                          # High-resolution photography, diagrams, and video posters
|
`-- wp-includes/                          # Web platform standard utility libraries
```

---

## Core Features & Modules

### 1. Vocational Courses Portal
* **Location**: [`academy/courses/index.html`](academy/courses/index.html)
* **6 Accredited Disciplines**:
  1. *Site Safety Essentials* (NCCT Level 2 · 6 Modules · CITB/HSE)
  2. *Forklift & Plant Operations* (NCCT Level 2 · 8 Modules · RTITB/FLTA)
  3. *Digital Tools on Site* (NCCT Level 2 · 5 Modules · BIM Ready)
  4. *Renewable Energy Systems (Wind & Solar)* (NCCT Level 3 · 7 Modules · EUSR)
  5. *Industrial Automation & PLC Logic* (NCCT Level 3 · 8 Modules · City & Guilds)
  6. *Electrical Safety & Safe Isolation* (NCCT Level 3 · 6 Modules · 18th Edition BS 7671)
* **Accreditation Matrix Table**: Full vocational framework mapping qualification level, accrediting body, guided learning hours, assessment format, and employer card route (e.g. Green CSCS Labourer card eligibility, CPCS Plant endorsement).
* **Live Course Filters**: Dynamic filtering across `All courses`, `Health & safety`, `Machinery`, `Digital skills`, `Clean energy`, and `Automation & Electrical`.

### 2. Interactive 3D Simulations & Video Walkthroughs
* **Location**: [`academy/simulations/index.html`](academy/simulations/index.html)
* **3 Physics Simulation Engines**:
  * **Hydroelectric Power Plant**: Francis reaction turbine, 45–120m water head, 250 MW output, 50 Hz grid sync.
  * **Solar Thermal Circulation**: Vacuum tube collectors, 78% absorber efficiency, 92°C peak temperature, propylene glycol closed loop, 300L dual-coil storage.
  * **Wind Power Generation**: 3.5 m/s cut-in wind speed, 2.0 MW rated power, 82m rotor diameter, 1:110 planetary gearbox, 25 m/s emergency aerodynamic tip brake.
* **Simulation Video Walkthroughs**: 4 instructor-led demonstration videos with 16:9 previews, YouTube duration badges, and direct links.
* **Interactive Lab Viewer**: Embedded responsive canvas with seamless in-page tab switching between models.

### 3. Video Lectures Library
* **Location**: [`academy/lectures/index.html`](academy/lectures/index.html)
* **10 Curated Vocational Demonstrations**: CITB working at height, FLTA forklift inspections, IOSH hazard spotting, City & Guilds PLC wiring, and 18th Edition Lockout/Tagout (LOTO) procedures.
* **Real-Time Keyword Search & Category Pills**: Instant live filtering across video categories without page reloads.

### 4. Career Pathways & Wage Guide
* **Location**: [`work/index.html`](work/index.html)
* **9 Technical Roles**: Searchable directory covering CAD/BIM technicians, Hydroelectric maintenance, Robotics trainees, Site safety coordinators, and Turbine service specialists.
* **UK Vocational Wage & Progression Guide**: Detailed 4-tier salary progression table (Trainee, Qualified, Senior/Lead) with industry accreditation badges.
* **4-Step Career Engine**: Step-by-step roadmap from skills audit and simulator hours to employer interviews.

### 5. Learner Hub & Credentials Engine
* **Location**: [`academy/learner/index.html`](academy/learner/index.html)
* **Personalized Dashboard**: Track pathway progress (percentage bar), sessions attended, and earned skills badges.
* **5-Question Knowledge Assessment**: Form validation requiring 80% pass mark (4 of 5 correct) to unlock verified certificates.
* **Certificate Issuance & Verification**: Dynamically generates unique certificate IDs (`NCCT-YYYY-XXXX`) and provides verification lookup.
* **360° Factory Familiarisation**: Interactive virtual factory floor with clickable inspection hotspots.

### 6. CoLearn AI Vocational Assistant
* **Implementation**: Bottom-left floating widget in [`wp-content/themes/dka/public/colearn-branding.js`](wp-content/themes/dka/public/colearn-branding.js).
* **Dual-Engine Architecture**:
  * **Live OpenAI API Streaming**: Accepts user-supplied OpenAI API key stored securely in browser `localStorage`.
  * **Context-Aware Built-in Knowledge Engine**: Instant offline fallback providing structured advice on courses, simulations, apprenticeships, and support desks.

### 7. Learner Support & Advisory Desk
* **Location**: [`contact/index.html`](contact/index.html)
* **Multi-Channel Contact**: Freephone advisory helpline (`0800 456 7890`), specialized email inboxes, campus hub addresses (London, Coventry, Leeds), and instant ticket confirmation generator (`REF-XXXXXX`).

---

## Design System & Typography

The design system maintains strict fidelity with the platform's visual identity:

| Token | CSS Variable | Hex / Value | Usage |
| :--- | :--- | :--- | :--- |
| **Black** | `--black` | `#000000` | Primary text, borders, headers, buttons |
| **Acid Lime** | `--acid` | `#cfff03` | Primary accents, hover highlights, active tabs, progress bars |
| **Putty** | `--putty` | `#d3c3ac` | Secondary backgrounds, simulation block contrast |
| **Stone** | `--stone` | `#f7f5f2` | Primary section canvas, card panels, clean light backgrounds |
| **White** | `--white` | `#ffffff` | Card surfaces, modal backdrops, form inputs |
| **Primary Font**| `--roobert` | `Roobert, sans-serif` | Clean, geometric sans-serif for UI elements, labels, buttons |
| **Display Font**| `--aeonik` | `Aeonik, sans-serif` | Editorial display typography for large expressive headings |

---

## Technology Stack

* **Frontend**: HTML5, Vanilla CSS3 (Custom Design System, CSS Grid, Flexbox), Vanilla JavaScript (ES6+).
* **3D Graphics & Physics**: Three.js, WebGL, FBXLoader, OrbitControls.
* **State Management**: Client-side reactive state using HTML5 `localStorage` (offline-capable).
* **Audio & Media**: HTML5 Audio & Video with HTTP 206 Partial Content Range streaming.
* **Deployment & Edge**: Vercel Serverless Static Edge Runtime.

---

## Local Development

### Prerequisites
* [Node.js](https://nodejs.org/) (v16.0.0 or later recommended).

### Running Locally
1. Clone or download the repository to your local machine:
   ```bash
   git clone https://github.com/your-username/colearn-website.git
   cd colearn-website
   ```
2. Start the built-in HTTP server:
   ```bash
   node serve.js
   ```
   *(Or using npm scripts: `npm start`)*
3. Open your browser and navigate to:
   ```
   http://localhost:3000
   ```

The local server automatically supports:
* MIME-type resolution for fonts, 3D meshes (`.fbx`), JSON, and video.
* HTTP Range headers (`Accept-Ranges: bytes`) for smooth video playback.
* Path rewrites for `/global_assets/` and trailing slash normalisation.

---

## Deployment on Vercel

The platform is pre-configured for Vercel with zero additional configuration needed.

### Option 1: Deploy via GitHub (Recommended)
1. Initialize git and commit your files:
   ```bash
   git add .
   git commit -m "Deploy CoLearn to Vercel"
   git push origin main
   ```
2. Go to your [Vercel Dashboard](https://vercel.com/new).
3. Import the repository.
4. Set **Framework Preset** to **Other** (Static Site).
5. Click **Deploy**. Your site will be live across Vercel's global CDN in seconds.

### Option 2: Deploy via Vercel CLI
1. Install or run Vercel CLI from your terminal:
   ```bash
   npx vercel
   ```
2. Follow the interactive prompts to link your project.
3. For a production deployment:
   ```bash
   npx vercel --prod
   ```

### Vercel Configuration Highlights (`vercel.json`)
* **Static Output**: `"buildCommand": null`, `"outputDirectory": "."`
* **Clean URLs & Trailing Slashes**: `"cleanUrls": true`, `"trailingSlash": true`
* **Asset Rewrites**: Rewrites `/global_assets/*` to simulation assets automatically.
* **Legacy 308 Redirects**: Redirects legacy paths (`/services`, `/expertise`) to `/academy/courses/`.
* **CORS & Cache Headers**: 1-year immutable caching for fonts (`.woff2`) and theme bundles, plus security headers (`nosniff`, `SAMEORIGIN`, `strict-origin-when-cross-origin`).

---

## Performance & Security

* **Total Workspace Size**: ~22 MB (including all 3D simulation meshes, fonts, and imagery).
* **Largest Single Asset**: 12.45 MB (well below Vercel's 100 MB per-file static asset threshold).
* **Zero Layout Shift**: Strict image aspect ratios and CSS container containment.
* **Font Preloading**: Preload hints in `<head>` for critical Roobert weights.
* **No Inline Trackers**: Client-side execution with zero external analytics tracking dependencies.

---

## License

All educational content, simulation models, and design assets are developed for the **CoLearn NCCT Vocational Skills Platform**. Unauthorised reproduction or distribution is strictly prohibited.
