// @ts-check
import {themes as prismThemes} from 'prism-react-renderer';

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'Visual AI ML Hub',
  tagline:
    'Visual learning platform for Mathematics for Machine Learning, Statistical Methods, Machine Learning and Deep Learning',

  favicon: 'img/favicon.ico',

  future: {
    v4: true,
  },

  url: 'https://visual-ai-ml-hub.github.io',
  baseUrl: '/',

  organizationName: 'visual-ai-ml-hub',
  projectName: 'visual-ai-ml-hub.github.io',

  onBrokenLinks: 'throw',

  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: './sidebars.js',
          // Remove editUrl to disable "Edit this page" link
        },
        blog: {
          showReadingTime: true,
          feedOptions: {
            type: ['rss', 'atom'],
            xslt: true,
          },
          // Remove editUrl to disable "Edit this page" link
          onInlineTags: 'warn',
          onInlineAuthors: 'warn',
          onUntruncatedBlogPosts: 'warn',
        },
        theme: {
          customCss: './src/css/custom.css',
        },
      },
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      image: 'img/banner.png',

      colorMode: {
        defaultMode: 'dark',
        respectPrefersColorScheme: true,
      },

      navbar: {
        title: 'Visual AI ML Hub',
        logo: {
          alt: 'Visual AI ML Hub Logo',
          src: 'img/logo.svg',
        },
        items: [
          {
            type: 'docSidebar',
            sidebarId: 'tutorialSidebar',
            position: 'left',
            label: 'Courses',
          },
          {
            to: '/blog',
            label: 'Blog',
            position: 'left',
          },
          {
            href: 'https://github.com/visual-ai-ml-hub',
            label: 'GitHub',
            position: 'right',
          },
        ],
      },

      footer: {
        style: 'dark',
        links: [
          {
            title: 'Learning',
            items: [
              {
                label: 'Mathematics for Machine Learning',
                to: '/docs/intro',
              },
              {
                label: 'Statistical Methods',
                to: '/docs/intro',
              },
              {
                label: 'Machine Learning',
                to: '/docs/intro',
              },
              {
                label: 'Deep Learning',
                to: '/docs/intro',
              },
            ],
          },
          {
            title: 'Community',
            items: [
              {
                label: 'GitHub Organization',
                href: 'https://github.com/visual-ai-ml-hub',
              },
            ],
          },
        ],

        copyright: `Copyright © ${new Date().getFullYear()} Visual AI ML Hub - Built with ♥️`,
      },

      prism: {
        theme: prismThemes.github,
        darkTheme: prismThemes.dracula,
      },
    }),
};

export default config;