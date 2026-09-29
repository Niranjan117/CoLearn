# CoLearn

NCCT-focused learning platform for course discovery, structured learning, skills progress, credentials, career pathways and interactive factory familiarisation. The site preserves its original Roobert typography, theme components, motion design and responsive layout.

## Project Structure

```
├── index.html          # Main landing page
├── academy/            # NCCT course catalogue and learner hub
├── contact/            # Learner support
├── insights/           # Learning resources
├── work/               # Career pathways
├── wp-content/         # Assets, themes, CSS, scripts, and media
│   ├── themes/dka/     # Compiled theme stylesheets & JS bundles
│   └── uploads/        # Optimized imagery and media
├── wp-includes/        # Core utilities
└── serve.js            # Node.js high-performance static server with Range streaming
```

## Running Locally

Run the local server:
```bash
node serve.js
```
Then visit [http://localhost:3000](http://localhost:3000).
