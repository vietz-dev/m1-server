import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

export default defineConfig({
  site: 'https://m1-server.local',
  integrations: [
    starlight({
      title: 'm1-server Docs',
      description: 'Beginner-friendly documentation for turning a freshly installed MacBook into the headless homelab server described in this repo.',
      social: [
        { icon: 'github', label: 'GitHub', href: 'https://github.com/example/m1-server' }
      ],
      sidebar: [
        {
          label: 'Start Here',
          items: [
            { label: 'Welcome', slug: 'index' },
            { label: 'Getting Started', slug: 'getting-started' },
            { label: 'Fresh Install Guide', slug: 'getting-started/fresh-install' },
            { label: 'Bring-Up Checklist', slug: 'getting-started/checklist' }
          ]
        },
        {
          label: 'Architecture',
          items: [
            { label: 'Overview', slug: 'architecture' }
          ]
        },
        {
          label: 'Setup Guide',
          items: [
            { label: '1. Prepare the Repo', slug: 'setup/01-prepare-repo' },
            { label: '2. Base macOS Setup', slug: 'setup/02-base-macos' },
            { label: '3. Homebrew and Fish', slug: 'setup/03-homebrew-and-fish' },
            { label: '4. OrbStack', slug: 'setup/04-orbstack' },
            { label: '5. Ollama', slug: 'setup/05-ollama' },
            { label: '6. Open WebUI', slug: 'setup/06-open-webui' },
            { label: '7. Jellyfin', slug: 'setup/07-jellyfin' },
            { label: '8. Pangolin / Newt (Optional)', slug: 'setup/08-pangolin-newt' }
          ]
        },
        {
          label: 'Operations',
          items: [
            { label: 'Health Checks', slug: 'operations/health-checks' },
            { label: 'Recovery', slug: 'operations/recovery' },
            { label: 'Security', slug: 'operations/security' },
            { label: 'Maintenance', slug: 'operations/maintenance' }
          ]
        },
        {
          label: 'Reference',
          items: [
            { label: 'Config Files', slug: 'reference/config-files' },
            { label: 'Scripts', slug: 'reference/scripts' },
            { label: 'Runbooks', slug: 'reference/runbooks' },
            { label: 'Validation', slug: 'reference/validation' }
          ]
        }
      ]
    })
  ]
});
