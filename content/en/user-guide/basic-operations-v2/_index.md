---
title: "Basic Operations"
description: "Step-by-step video guides to configure master data, customer/supplier records, catalogue items, and financial defaults."
weight: 30
---

<style>
.tl-hero{background:linear-gradient(135deg,#0f3d8c 0%,#1a5cbf 60%,#1e6fd4 100%);padding:32px 28px 28px;border-radius:12px;margin-bottom:24px;color:#fff;position:relative;overflow:hidden}
.tl-hero::before{content:'';position:absolute;inset:0;background:url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.04'%3E%3Ccircle cx='30' cy='30' r='20'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");pointer-events:none}
.tl-back{display:inline-flex;align-items:center;gap:6px;color:rgba(255,255,255,.85)!important;font-size:13px;text-decoration:none!important;margin-bottom:14px}
.tl-back:hover{color:#fff!important}
.tl-hero-title{font-size:28px;font-weight:700;margin:0 0 6px;line-height:1.2;color:#ffffff!important}
.tl-hero-meta{font-size:14px;color:rgba(255,255,255,.85)!important;margin:0}
main h1:not(.tl-hero-title) { display: none !important; }
main > br { display: none !important; }
main > h1 + .hx\:mb-16 { display: none !important; }
main > .content { margin-top: 0 !important; }
main > .hx\:content { margin-top: 0 !important; }
.tl-body{display:grid;grid-template-columns:1fr 340px;gap:16px;align-items:start;margin-bottom:28px}
.tl-player-wrap{border-radius:12px;overflow:hidden;background:#000;box-shadow:0 4px 24px rgba(0,0,0,.15)}
.tl-player-frame{position:relative;padding-bottom:56.25%;height:0;overflow:hidden}
.tl-player-frame iframe{position:absolute;top:0;left:0;width:100%;height:100%;border:0}
.tl-player-info{padding:14px 16px 4px}
.tl-player-title{font-size:15px;font-weight:600;color:#111;margin:0 0 6px;line-height:1.4}
.tl-player-desc{font-size:13px;color:#555;line-height:1.55;margin:0 0 12px}
.tl-player-nav{display:flex;gap:8px;padding-top:10px;border-top:1px solid #eee}
.tl-nav-btn{display:inline-flex;align-items:center;gap:5px;padding:7px 14px;border-radius:7px;font-size:13px;font-weight:500;cursor:pointer;border:1px solid #d0ceca;background:#fff;color:#333;transition:all .12s;font-family:inherit}
.tl-nav-btn:hover:not(:disabled){border-color:#888;color:#111}
.tl-nav-btn.tl-next{background:#1a5cbf;color:#fff!important;border-color:#1a5cbf}
.tl-nav-btn.tl-next:hover:not(:disabled){background:#0f3d8c;border-color:#0f3d8c}
.tl-nav-btn:disabled{opacity:.35;cursor:not-allowed}
.tl-playlist{background:#f2f6ff;border-radius:12px;overflow:hidden;border:1px solid #d6e4f7;max-height:600px;overflow-y:auto}
.tl-pl-head{padding:14px 16px;background:#1a5cbf;color:#fff;position:sticky;top:0;z-index:2}
.tl-pl-head-title{font-size:13px;font-weight:600;margin:0 0 2px}
.tl-pl-head-meta{font-size:12px;color:rgba(255,255,255,.75);margin:0}
.tl-pl-item{display:flex;align-items:center;gap:10px;padding:13px 16px;cursor:pointer;border-bottom:1px solid #dce8f8;background:#fff;transition:background .12s}
.tl-pl-item:last-child{border-bottom:none}
.tl-pl-item:hover{background:#ebf2ff}
.tl-pl-item.tl-active{background:#1a5cbf}
.tl-pl-icon{width:32px;height:32px;border-radius:50%;border:2px solid #c5d8f0;display:flex;align-items:center;justify-content:center;flex-shrink:0;background:#fff}
.tl-active .tl-pl-icon{background:#fff;border-color:#fff}
.tl-pl-icon svg{width:14px;height:14px;color:#1a5cbf}
.tl-active .tl-pl-icon svg{color:#1a5cbf}
.tl-pl-text{flex:1;min-width:0}
.tl-pl-name{font-size:13px;font-weight:500;color:#222;line-height:1.35;margin:0}
.tl-active .tl-pl-name{color:#fff;font-weight:600}
.tl-pl-dur{font-size:11px;color:#888;margin:2px 0 0;display:flex;align-items:center;gap:3px}
.tl-active .tl-pl-dur{color:rgba(255,255,255,.75)}
@media(max-width:760px){.tl-body{grid-template-columns:1fr}.tl-hero-title{font-size:20px}}
</style>

<div class="tl-hero">
<a href="/user-guide/" class="tl-back">← Back to User Guide</a>
<h1 class="tl-hero-title">Basic Operations</h1>
<p class="tl-hero-meta">7 Videos</p>
</div>

<div class="tl-body">

<div>
<div class="tl-player-wrap">
<div class="tl-player-frame">
<iframe id="tlIframe" src="https://www.youtube.com/embed/QF00MlsTEBw?rel=0&modestbranding=1" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
</div>
<div class="tl-player-info">
<p class="tl-player-title" id="tlTitle">How to Manage Customer</p>
<p class="tl-player-desc" id="tlDesc">Master the Customer Maintenance Applet. Learn how to create, edit, group, and configure profile parameters for your customers.</p>
<div class="tl-player-nav">
<button class="tl-nav-btn" id="tlPrev" onclick="tlNav(-1)" disabled>← Previous</button>
<button class="tl-nav-btn tl-next" id="tlNext" onclick="tlNav(1)">Next video →</button>
</div>
</div>
</div>

<div class="tl-playlist">
<div class="tl-pl-head">
<p class="tl-pl-head-title">Basic Operations</p>
<p class="tl-pl-head-meta">7 videos</p>
</div>
<div class="tl-pl-item tl-active" onclick="tlPlay(0)">
<div class="tl-pl-icon"><svg viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg></div>
<div class="tl-pl-text">
<p class="tl-pl-name">How to Manage Customer</p>
<p class="tl-pl-dur">27:12</p>
</div>
</div>
<div class="tl-pl-item" onclick="tlPlay(1)">
<div class="tl-pl-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M10 8l6 4-6 4V8z" fill="currentColor" stroke="none"/></svg></div>
<div class="tl-pl-text">
<p class="tl-pl-name">How to Manage Supplier</p>
<p class="tl-pl-dur">15:12</p>
</div>
</div>
<div class="tl-pl-item" onclick="tlPlay(2)">
<div class="tl-pl-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M10 8l6 4-6 4V8z" fill="currentColor" stroke="none"/></svg></div>
<div class="tl-pl-text">
<p class="tl-pl-name">How to Manage Doc Item</p>
<p class="tl-pl-dur">13:50</p>
</div>
</div>
<div class="tl-pl-item" onclick="tlPlay(3)">
<div class="tl-pl-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M10 8l6 4-6 4V8z" fill="currentColor" stroke="none"/></svg></div>
<div class="tl-pl-text">
<p class="tl-pl-name">How to Manage Inventory Item</p>
<p class="tl-pl-dur">4:13</p>
</div>
</div>
<div class="tl-pl-item" onclick="tlPlay(4)">
<div class="tl-pl-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M10 8l6 4-6 4V8z" fill="currentColor" stroke="none"/></svg></div>
<div class="tl-pl-text">
<p class="tl-pl-name">Manage & Sync Products to E-Commerce | Doc Item Maintenance Applet</p>
<p class="tl-pl-dur">21:38</p>
</div>
</div>
<div class="tl-pl-item" onclick="tlPlay(5)">
<div class="tl-pl-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M10 8l6 4-6 4V8z" fill="currentColor" stroke="none"/></svg></div>
<div class="tl-pl-text">
<p class="tl-pl-name">How to Manage your Chart of Accounts</p>
<p class="tl-pl-dur">33:41</p>
</div>
</div>
<div class="tl-pl-item" onclick="tlPlay(6)">
<div class="tl-pl-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M10 8l6 4-6 4V8z" fill="currentColor" stroke="none"/></svg></div>
<div class="tl-pl-text">
<p class="tl-pl-name">How to Create Tax Codes and Rates</p>
<p class="tl-pl-dur">1:52</p>
</div>
</div>
</div>

</div>

<script>
var tlVideos=[
{id:"QF00MlsTEBw",start:0,title:"How to Manage Customer",desc:"Master the Customer Maintenance Applet. Learn how to create, edit, group, and configure profile parameters for your customers."},
{id:"0BSykg6Ke9w",start:0,title:"How to Manage Supplier",desc:"Configure and maintain your suppliers' profiles, categories, and account defaults."},
{id:"omcu01BQTFs",start:0,title:"How to Manage Doc Item",desc:"Create and configure items/services in your catalogue. Learn about fields, codes, descriptions, and tax mappings."},
{id:"wBAbnAasGyY",start:0,title:"How to Manage Inventory Item",desc:"Set up and track inventory-specific items. Learn to define SKU parameters, item codes, and units of measure."},
{id:"Pr-rYs01cfc",start:0,title:"Manage & Sync Products to E-Commerce | Doc Item Maintenance Applet",desc:"Step-by-step guide on how to sync catalog items and products to your connected e-commerce channels."},
{id:"5aRVUqoPJwo",start:0,title:"How to Manage your Chart of Accounts",desc:"Set up the fundamental financial ledger system. Learn to configure account levels, types, codes, and balance flows."},
{id:"vH5BxB9gc6s",start:0,title:"How to Create Tax Codes and Rates",desc:"Quick tutorial to configure tax codes, tax rates, and calculate taxes for compliance."}
];
var tlCur=0;
function tlPlay(i){
tlCur=i;
var v=tlVideos[i];
var s=v.start?'&start='+v.start:'';
document.getElementById('tlIframe').src='https://www.youtube.com/embed/'+v.id+'?rel=0&modestbranding=1&autoplay=1'+s;
document.getElementById('tlTitle').textContent=v.title;
document.getElementById('tlDesc').textContent=v.desc;
document.querySelectorAll('.tl-pl-item').forEach(function(el,idx){el.classList.toggle('tl-active',idx===i);});
document.getElementById('tlPrev').disabled=i===0;
document.getElementById('tlNext').disabled=i===tlVideos.length-1;
document.getElementById('tlNext').textContent=i===tlVideos.length-1?'✓ Completed':'Next video →';
}
function tlNav(d){if(tlCur+d>=0&&tlCur+d<tlVideos.length)tlPlay(tlCur+d);}
</script>

---

## What's next?

{{< cards >}}
{{< card link="/user-guide/getting-started-v2/" title="Getting Started" subtitle="Watch the walkthroughs to set up your account and organization setup" >}}
{{< card link="/user-guide/daily-tasks/" title="Daily Tasks" subtitle="Learn about purchase orders, sales orders, invoicing, and payments" >}}
{{< card link="/user-guide/administration/" title="Administration" subtitle="Learn about user setups, roles, permissions, and group matrices" >}}
{{< /cards >}}
