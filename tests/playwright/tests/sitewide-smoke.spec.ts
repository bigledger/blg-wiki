import { test, expect } from '@playwright/test'

test.describe('Sitewide smoke', () => {
  test('homepage loads', async ({ page }) => {
    const response = await page.goto('/')
    expect(response?.status()).toBe(200)
    await expect(page).toHaveTitle(/BigLedger/i)
  })

  test('homepage has no broken images', async ({ page }) => {
    const broken: { url: string; status: number }[] = []
    page.on('response', r => {
      if (r.status() >= 400 && /\.(png|jpe?g|gif|svg|webp)(\?|$)/i.test(r.url())) {
        broken.push({ url: r.url(), status: r.status() })
      }
    })
    await page.goto('/', { waitUntil: 'networkidle' })
    expect(broken, broken.map(b => `${b.status} ${b.url}`).join('\n')).toHaveLength(0)
  })

  test('accounting-guides section index loads', async ({ page }) => {
    const response = await page.goto('/guides/accounting-guides/')
    expect(response?.status()).toBe(200)
  })

  test('financial-accounting module page has no broken /guides/ links', async ({ page, request }) => {
    await page.goto('/modules/financial-accounting/')
    const hrefs = await page.locator('a[href^="/guides/"]').evaluateAll(
      as => Array.from(new Set(as.map(a => (a as HTMLAnchorElement).getAttribute('href')!)))
    )
    const broken: { href: string; status: number }[] = []
    for (const href of hrefs) {
      const target = href.split('#')[0]
      const res = await request.get(target, { failOnStatusCode: false })
      if (res.status() >= 400) broken.push({ href, status: res.status() })
    }
    expect(broken, `Broken /guides/ links from financial-accounting module:\n${broken.map(b => `${b.status} ${b.href}`).join('\n')}`).toHaveLength(0)
  })

  test('search input is wired up', async ({ page }) => {
    await page.goto('/')
    // Hextra renders the search input in a collapsible modal — assert presence in DOM,
    // not visibility, because the modal is closed by default on desktop.
    const search = page.locator('input.hextra-search-input').first()
    await expect(search, 'A Hextra search input should be present in the DOM').toHaveCount(1)
    // And it should be a functional search input (correct type + aria-label).
    await expect(search).toHaveAttribute('type', 'search')
    await expect(search).toHaveAttribute('aria-label', /search/i)
  })
})
