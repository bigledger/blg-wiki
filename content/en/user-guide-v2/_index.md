---
title: "User Guide"
description: "Everything you need to use BigLedger — guides, demos & references for every team."
weight: 11
---

<div style="margin-bottom: 2rem;">
{{< callout type="warning" >}}
**Work in Progress** — This section is currently being updated to standardize layouts, role pathways, and workflows. We will be updating this content from time to time.
{{< /callout >}}
</div>

<style>
/* hide the auto-rendered Hextra page title */
main:has(.bl-hub) > h1 {display:none!important}
.bl-hub{padding:0;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif}
/* hero banner */
.bl-hero{background:linear-gradient(135deg,#0c3580 0%,#1a5cbf 55%,#1e72d4 100%);border-radius:12px;padding:36px 40px;margin-bottom:1.75rem;display:flex;align-items:center;justify-content:space-between;overflow:hidden;position:relative}
.bl-hero::before{content:'';position:absolute;inset:0;background-image:radial-gradient(circle,rgba(255,255,255,.06) 1px,transparent 1px);background-size:28px 28px;pointer-events:none}
.bl-hero-left{position:relative;z-index:1}
.bl-hero-title{font-size:28px;font-weight:700;color:#fff;margin:0 0 8px;line-height:1.2}
.bl-hero-sub{font-size:15px;color:rgba(255,255,255,.8);margin:0}
.bl-hero-img{position:relative;z-index:1;flex-shrink:0;width:180px;opacity:.9}
.bl-eyebrow{font-size:11px;color:#999;text-transform:uppercase;letter-spacing:.07em;margin:0 0 8px;font-weight:500}
.bl-title{font-size:26px;font-weight:700;color:#111;margin:0 0 8px;line-height:1.2}
.bl-sub{font-size:15px;color:#666;margin:0 0 1.25rem;line-height:1.5}
.bl-hero-btns{display:flex;gap:10px;flex-wrap:wrap;align-items:center}
.bl-btn-p{display:inline-flex;align-items:center;gap:7px;background:#1A4FD6;color:#fff!important;padding:9px 20px;border-radius:8px;text-decoration:none!important;font-size:14px;font-weight:500;transition:background .15s}
.bl-btn-p:hover{background:#1540b8!important;color:#fff!important}
.bl-btn-s{display:inline-flex;align-items:center;gap:6px;background:transparent;color:#333!important;padding:9px 20px;border-radius:8px;border:1px solid #d0ceca;text-decoration:none!important;font-size:14px;font-weight:500;transition:border-color .15s}
.bl-btn-s:hover{border-color:#888;color:#111!important}
.bl-filters{display:flex;gap:8px;flex-wrap:wrap;margin-bottom:1.5rem}
.bl-pill{padding:6px 14px;border-radius:20px;font-size:13px;border:1px solid #ddd;background:transparent;color:#666;cursor:pointer;transition:all .12s;font-family:inherit;white-space:nowrap;line-height:1.4}
.bl-pill.bl-on{background:#1A4FD6;color:#fff;border-color:#1A4FD6}
.bl-pill:hover:not(.bl-on){border-color:#999;color:#333}
.bl-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(180px,1fr));gap:12px;margin-bottom:2.5rem}
.bl-card{display:block;background:#fff;border:1px solid #e8e6e0;border-radius:12px;padding:1.125rem 1rem;text-decoration:none!important;transition:border-color .15s,box-shadow .15s;color:inherit}
.bl-card:hover{border-color:#bbb;box-shadow:0 2px 8px rgba(0,0,0,.07)}
.bl-icon{width:44px;height:44px;border-radius:10px;display:flex;align-items:center;justify-content:center;margin-bottom:12px;flex-shrink:0}
.bl-icon svg{width:22px;height:22px}
.bl-card-name{font-size:14px;font-weight:600;color:#111;margin:0 0 4px;line-height:1.3}
.bl-card-count{font-size:12px;color:#888;margin:0}
.bl-soon{display:inline-block;font-size:11px;padding:2px 8px;border-radius:10px;background:#f1f0ec;color:#999}
.bl-section-title{font-size:15px;font-weight:600;color:#111;margin:0 0 1rem}
.bl-paths{display:grid;grid-template-columns:repeat(auto-fill,minmax(200px,1fr));gap:10px;margin-bottom:2rem}
.bl-path{background:#f7f6f3;border-radius:10px;padding:1rem}
.bl-path-role{font-size:13px;font-weight:600;color:#111;margin:0 0 10px}
.bl-path-steps{list-style:none;margin:0;padding:0}
.bl-path-steps li{font-size:12px;color:#555;margin:5px 0;display:flex;align-items:flex-start;gap:8px;line-height:1.4}
.bl-path-steps li::before{content:'';display:block;width:5px;height:5px;border-radius:50%;background:#1A4FD6;flex-shrink:0;margin-top:4px}
.bl-path-steps a{color:#1A4FD6!important;text-decoration:none!important}
.bl-path-steps a:hover{text-decoration:underline!important}
.bl-support{padding-top:1.5rem;border-top:1px solid #e8e6e0;margin-top:.5rem}
.bl-support-title{font-size:13px;font-weight:600;color:#111;margin:0 0 10px}
.bl-support-links{display:flex;gap:1.25rem;flex-wrap:wrap}
.bl-support-links a{font-size:13px;color:#1A4FD6!important;text-decoration:none!important}
.bl-support-links a:hover{text-decoration:underline!important}
@media(max-width:640px){.bl-grid{grid-template-columns:1fr 1fr}.bl-paths{grid-template-columns:1fr}.bl-title{font-size:20px}}
</style>

<div class="bl-hub">

<div class="bl-hero">
<div class="bl-hero-left">
<h1 class="bl-hero-title">Akaun User Guide</h1>
<p class="bl-hero-sub">Learn BigLedger your way</p>
</div>
<svg class="bl-hero-img" viewBox="0 0 200 140" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect x="30" y="100" width="140" height="8" rx="4" fill="rgba(255,255,255,.25)"/>
<rect x="94" y="90" width="12" height="12" rx="2" fill="rgba(255,255,255,.2)"/>
<rect x="55" y="40" width="90" height="52" rx="6" fill="rgba(255,255,255,.15)" stroke="rgba(255,255,255,.4)" stroke-width="1.5"/>
<rect x="62" y="47" width="76" height="38" rx="3" fill="rgba(255,255,255,.12)"/>
<line x1="68" y1="55" x2="104" y2="55" stroke="rgba(255,255,255,.5)" stroke-width="2" stroke-linecap="round"/>
<line x1="68" y1="62" x2="116" y2="62" stroke="rgba(255,255,255,.35)" stroke-width="1.5" stroke-linecap="round"/>
<line x1="68" y1="69" x2="110" y2="69" stroke="rgba(255,255,255,.35)" stroke-width="1.5" stroke-linecap="round"/>
<line x1="68" y1="76" x2="96" y2="76" stroke="rgba(255,255,255,.25)" stroke-width="1.5" stroke-linecap="round"/>
<circle cx="155" cy="55" r="14" fill="rgba(255,255,255,.2)" stroke="rgba(255,255,255,.5)" stroke-width="1.5"/>
<path d="M148 54 Q151 51 154 54 Q157 51 160 54" stroke="rgba(255,255,255,.7)" stroke-width="1.2" fill="none"/>
<path d="M151 58 Q155 61 159 58" stroke="rgba(255,255,255,.7)" stroke-width="1.2" fill="none" stroke-linecap="round"/>
<path d="M143 70 Q155 66 167 70 L170 100 H140 Z" fill="rgba(255,255,255,.15)" stroke="rgba(255,255,255,.3)" stroke-width="1"/>
<rect x="20" y="18" width="22" height="18" rx="3" fill="rgba(255,255,255,.15)" stroke="rgba(255,255,255,.4)" stroke-width="1"/>
<line x1="24" y1="24" x2="38" y2="24" stroke="rgba(255,255,255,.6)" stroke-width="1.2" stroke-linecap="round"/>
<line x1="24" y1="28" x2="35" y2="28" stroke="rgba(255,255,255,.4)" stroke-width="1" stroke-linecap="round"/>
<line x1="24" y1="32" x2="37" y2="32" stroke="rgba(255,255,255,.4)" stroke-width="1" stroke-linecap="round"/>
<rect x="158" y="10" width="22" height="18" rx="3" fill="rgba(255,255,255,.15)" stroke="rgba(255,255,255,.4)" stroke-width="1"/>
<path d="M164 15 L169 22 L174 15" stroke="rgba(255,255,255,.6)" stroke-width="1.2" fill="none" stroke-linecap="round"/>
<rect x="170" y="75" width="6" height="18" rx="2" fill="rgba(255,255,255,.3)"/>
<rect x="178" y="68" width="6" height="25" rx="2" fill="rgba(255,255,255,.4)"/>
<rect x="186" y="80" width="6" height="13" rx="2" fill="rgba(255,255,255,.25)"/>
</svg>
</div>

<div class="bl-filters" id="blFilters">
  <button class="bl-pill bl-on" onclick="blFilter(this,'all')">All</button>
  <button class="bl-pill" onclick="blFilter(this,'start')">Getting started</button>
  <button class="bl-pill" onclick="blFilter(this,'ops')">Daily operations</button>
  <button class="bl-pill" onclick="blFilter(this,'admin')">Administration</button>
  <button class="bl-pill" onclick="blFilter(this,'reports')">Reports & analytics</button>
  <button class="bl-pill" onclick="blFilter(this,'industry')">Industry solutions</button>
  <button class="bl-pill" onclick="blFilter(this,'demo')">Demo platform</button>
  <button class="bl-pill" onclick="blFilter(this,'dev')">Developer</button>
</div>

<div class="bl-grid" id="blCards">

  <a class="bl-card" data-cat="start" href="/user-guide/getting-started/">
    <div class="bl-icon" style="background:#E6F1FB">
      <svg viewBox="0 0 24 24" fill="none" stroke="#185FA5" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2S7 5.5 7 11.5L12 17l5-5.5C17 5.5 12 2 12 2z"/><circle cx="12" cy="10" r="1.5" fill="#185FA5" stroke="none"/><path d="M9.5 21c0-1.4 1.1-2.5 2.5-2.5s2.5 1.1 2.5 2.5"/></svg>
    </div>
    <p class="bl-card-name">Getting started</p>
    <p class="bl-card-count">5 guides</p>
  </a>

  <a class="bl-card" data-cat="ops" href="/user-guide/basic-operations/">
    <div class="bl-icon" style="background:#EAF3DE">
      <svg viewBox="0 0 24 24" fill="none" stroke="#3B6D11" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><rect x="5" y="2" width="14" height="20" rx="2"/><path d="M9 7h6M9 11h6M9 15h4"/></svg>
    </div>
    <p class="bl-card-name">Basic operations</p>
    <p class="bl-card-count">10 guides</p>
  </a>

  <a class="bl-card" data-cat="ops" href="/user-guide/daily-tasks/">
    <div class="bl-icon" style="background:#EAF3DE">
      <svg viewBox="0 0 24 24" fill="none" stroke="#3B6D11" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="7" width="20" height="14" rx="2"/><path d="M7 7V5a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v2"/><path d="M8 13h8M8 17h5"/></svg>
    </div>
    <p class="bl-card-name">Daily operations</p>
    <p class="bl-card-count">12 guides</p>
  </a>

  <a class="bl-card" data-cat="admin" href="/user-guide/administration/">
    <div class="bl-icon" style="background:#EEEDFE">
      <svg viewBox="0 0 24 24" fill="none" stroke="#534AB7" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"/><path d="M12 1v2M12 21v2M4.22 4.22l1.42 1.42M18.36 18.36l1.42 1.42M1 12h2M21 12h2M4.22 19.78l1.42-1.42M18.36 5.64l1.42-1.42"/></svg>
    </div>
    <p class="bl-card-name">Administration</p>
    <p class="bl-card-count">8 guides</p>
  </a>

  <a class="bl-card" data-cat="reports" href="/user-guide/reports-analytics/">
    <div class="bl-icon" style="background:#EBF3FE">
      <svg viewBox="0 0 24 24" fill="none" stroke="#1A5CBF" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M18 20V10M12 20V4M6 20v-6"/></svg>
    </div>
    <p class="bl-card-name">Reports &amp; analytics</p>
    <p class="bl-card-count">6 guides</p>
  </a>

  <a class="bl-card" data-cat="industry" href="/user-guide/industry-solutions">
    <div class="bl-icon" style="background:#E1F5EE">
      <svg viewBox="0 0 24 24" fill="none" stroke="#0F6E56" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M3 21h18"/><path d="M9 21V9l6-6v18"/><path d="M3 21V13l6-4"/><path d="M13 21v-5h2v5"/></svg>
    </div>
    <p class="bl-card-name">Industry solutions</p>
    <p class="bl-card-count">6 guides</p>
  </a>

  <a class="bl-card" data-cat="demo" href="/user-guide/demo">
    <div class="bl-icon" style="background:#FAEEDA">
      <svg viewBox="0 0 24 24" fill="none" stroke="#854F0B" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="3" width="20" height="14" rx="2"/><path d="M8 21h8M12 17v4"/><path d="M10 8l5 3.5L10 15V8z" fill="#854F0B" stroke="none"/></svg>
    </div>
    <p class="bl-card-name">Demo platform</p>
    <p class="bl-card-count">11 demos</p>
  </a>

  <a class="bl-card" data-cat="dev" href="/developers">
    <div class="bl-icon" style="background:#FAECE7">
      <svg viewBox="0 0 24 24" fill="none" stroke="#993C1D" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg>
    </div>
    <p class="bl-card-name">Developer resources</p>
    <p class="bl-card-count">APIs, SDKs &amp; webhooks</p>
  </a>

</div>

<p class="bl-section-title">Learning paths by role</p>
<div class="bl-paths">
  <div class="bl-path">
    <p class="bl-path-role">🚀 New user · Week 1–2</p>
    <ul class="bl-path-steps">
      <li><a href="/user-guide/getting-started/">Getting started guide</a></li>
      <li><a href="/user-guide/basic-operations/">Basic operations</a></li>
      <li><a href="/user-guide/daily-tasks/">Daily operations</a></li>
    </ul>
  </div>
  <div class="bl-path">
    <p class="bl-path-role">💰 Finance / accounting</p>
    <ul class="bl-path-steps">
      <li><a href="/modules/financial-accounting/">Financial Accounting module</a></li>
      <li><a href="/modules/e-invoice">E-Invoice module</a></li>
      <li><a href="/user-guide/reports-analytics/">Financial reports</a></li>
    </ul>
  </div>
  <div class="bl-path">
    <p class="bl-path-role">⚙️ System admin · Week 2–4</p>
    <ul class="bl-path-steps">
      <li><a href="/user-guide/administration/">Administration guide</a></li>
      <li><a href="/user-guide/administration/">Access control</a></li>
      <li><a href="/user-guide/administration/">Group management</a></li>
    </ul>
  </div>
  <div class="bl-path">
    <p class="bl-path-role">👨‍💻 Developer · Ongoing</p>
    <ul class="bl-path-steps">
      <li><a href="/developers/applets/getting-started/">Developer quickstart</a></li>
      <li><a href="/developers/api-reference">API reference</a></li>
      <li><a href="/developers/applets/applet-development/">Applet development</a></li>
    </ul>
  </div>
</div>

<div class="bl-support">
  <p class="bl-support-title">Need help?</p>
  <div class="bl-support-links">
    <a href="mailto:sales@bigledger.com">General inquiries</a>
    <a href="mailto:support@bigledger.com">Technical support</a>
    <a href="https://github.com/bigledger/blg-wiki/edit/main/content/en/user-guide-v2/_index.md">Edit this page →</a>
  </div>
</div>

</div>

<script>
function blFilter(btn,cat){document.querySelectorAll('.bl-pill').forEach(function(b){b.classList.remove('bl-on')});btn.classList.add('bl-on');document.querySelectorAll('#blCards .bl-card').forEach(function(c){c.style.display=(cat==='all'||c.getAttribute('data-cat')===cat)?'':'none'})}
</script>
