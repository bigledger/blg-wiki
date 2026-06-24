import { test, expect, Page } from '@playwright/test'

const GUIDES = [
  { slug: 'chart-of-accounts-setup', title: /Chart of Accounts Setup/i },
  { slug: 'journal-entries',         title: /Journal Entries/i },
  { slug: 'bank-reconciliation-guide', title: /Bank Reconciliation/i },
  { slug: 'financial-reporting',     title: /Financial Reporting/i },
]

async function collectConsoleErrors(page: Page): Promise<string[]> {
  const errors: string[] = []
  page.on('console', m => { if (m.type() === 'error') errors.push(m.text()) })
  page.on('pageerror', e => errors.push(String(e)))
  return errors
}

async function collectFailedRequests(page: Page): Promise<{ url: string; status: number }[]> {
  const failed: { url: string; status: number }[] = []
  page.on('response', r => {
    const status = r.status()
    if (status >= 400) failed.push({ url: r.url(), status })
  })
  return failed
}

for (const guide of GUIDES) {
  test.describe(`Accounting guide: ${guide.slug}`, () => {
    const url = `/guides/accounting-guides/${guide.slug}/`

    test('loads with HTTP 200', async ({ page }) => {
      const response = await page.goto(url, { waitUntil: 'domcontentloaded' })
      expect(response?.status(), `${url} should return 200, got ${response?.status()}`).toBe(200)
    })

    test('has the expected page title', async ({ page }) => {
      await page.goto(url)
      await expect(page).toHaveTitle(guide.title)
    })

    test('renders a real H1, not raw frontmatter', async ({ page }) => {
      await page.goto(url)
      // The H1 (the page title) should be visible
      const h1 = page.locator('main h1').first()
      await expect(h1).toBeVisible()
      const h1Text = (await h1.textContent())?.trim() ?? ''
      expect(h1Text.length, 'H1 should be non-empty').toBeGreaterThan(0)
      expect(h1Text, 'H1 should not be raw markdown').not.toContain('---')
    })

    test('no JS console errors', async ({ page }) => {
      const errors = await collectConsoleErrors(page)
      await page.goto(url, { waitUntil: 'networkidle' })
      // Filter known-acceptable noise (e.g., third-party analytics that may be blocked)
      const real = errors.filter(e => !/favicon|preload/i.test(e))
      expect(real, `console errors on ${url}:\n${real.join('\n')}`).toHaveLength(0)
    })

    test('all images on the page load (no 404s)', async ({ page }) => {
      const failed = await collectFailedRequests(page)
      await page.goto(url, { waitUntil: 'networkidle' })
      const brokenImages = failed.filter(f => /\.(png|jpe?g|gif|svg|webp)(\?|$)/i.test(f.url))
      expect(brokenImages, `broken images on ${url}:\n${brokenImages.map(f => `${f.status} ${f.url}`).join('\n')}`).toHaveLength(0)
    })

    test('all in-page internal links resolve to 200', async ({ page, request }) => {
      await page.goto(url, { waitUntil: 'domcontentloaded' })
      // Collect internal hrefs from the main content area only (skip sidebar/footer chrome — those are sitewide concerns)
      const hrefs = await page.locator('main a[href^="/"]').evaluateAll(
        as => Array.from(new Set(as.map(a => (a as HTMLAnchorElement).getAttribute('href')!).filter(h => h && !h.startsWith('#'))))
      )
      const broken: { href: string; status: number }[] = []
      for (const href of hrefs) {
        const target = href.split('#')[0]
        const res = await request.get(target, { failOnStatusCode: false })
        if (res.status() >= 400) broken.push({ href, status: res.status() })
      }
      expect(broken, `broken in-page links on ${url}:\n${broken.map(b => `${b.status} ${b.href}`).join('\n')}`).toHaveLength(0)
    })

    test('has a left sidebar / navigation visible', async ({ page }) => {
      await page.goto(url)
      // Hextra renders the page nav in an <aside> or with a sidebar role
      const sidebarCandidate = page.locator('aside, [role="navigation"]').first()
      await expect(sidebarCandidate, `${url} should render some navigation`).toBeVisible()
    })

    test('renders no unresolved Hextra shortcodes', async ({ page }) => {
      await page.goto(url, { waitUntil: 'domcontentloaded' })
      const main = await page.locator('main').innerText()
      expect(main, 'unrendered {{< shortcode >}} leaked into output').not.toContain('{{<')
      expect(main, 'unrendered {{% shortcode %}} leaked into output').not.toContain('{{%')
    })
  })
}
