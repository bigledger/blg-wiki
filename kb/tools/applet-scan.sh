#!/usr/bin/env bash
# usage: applet-scan.sh <repo-dir-name> <appletCode>
R=/home/marketing/repos/refs/$1; CODE=$2; OVERRIDE=$3; SU=/home/marketing/repos/refs/blg-shared-utilities
git -C $R pull --ff-only -q 2>/dev/null
A=$(find $R/micro-fe/projects -maxdepth 4 -type d -path "*applets/*" -name "src" -not -path "*testApplet*" -not -path "*example*" | grep -v akaun-platform | head -1 | xargs dirname 2>/dev/null); [ -z "$A" ] && A=$(find $R/micro-fe/projects -maxdepth 4 -type d -path "*applets/*" -name "src" -not -path "*testApplet*" | head -1 | xargs dirname 2>/dev/null)
[ -z "$A" ] && A=$(find $R -maxdepth 3 -type d -name "src" -not -path "*/node_modules/*" | head -1 | xargs dirname)
[ -n "$OVERRIDE" ] && A=$OVERRIDE
echo "APPLET DIR: $A"
echo "#### MENU"; cat $A/src/app/models/menu-items.ts 2>/dev/null || grep -rn "menuItems" $A/src/app --include=*.ts -l | head -3
echo "#### ROUTES"; grep -oE "path: '[^']*'|mainPath = '[^']*'" $A/src/app/app.routing.ts | tr '\n' ' '; echo
echo "#### CONSTANTS"; cat $A/src/app/models/constants/applet-constants.ts 2>/dev/null | grep -E "docType|signum" 
echo "#### DEFAULT SETTINGS"; grep -oE "(<li>[^<]*:|<mat-label>[^<]*|controls\['[A-Z_0-9]+'\]|\[\((branch|location|pricingScheme|priceBook)\)\]=\"form\.controls\['[A-Z_0-9]+'\]\")" $A/src/app/components/settings-container/default-settings/default-settings.component.html 2>/dev/null | tr '\n' ' '; echo; grep -oE "\{ title: '[^']*'" $A/src/app/components/settings-container/default-settings/default-settings.component.ts 2>/dev/null | sed "s/{ title: //" | tr '\n' ' '; echo
echo "#### SETTINGS MENU (routes under settings)"; sed -n "/path: 'settings'/,/^      },$/p" $A/src/app/app.routing.ts | grep -oE "path: '[^']*'" | tr '\n' ' '; echo
echo "#### VALIDATORS (required)"; grep -rn "Validators.required" $A/src/app/components --include=*.ts | grep -v spec | grep -v payment/ | sed -E "s#^$A/src/app/components/##" | grep -oE "^[^:]+:[0-9]+:\s*[a-zA-Z_]+" | sed -E 's/:[0-9]+:\s*/ → /' | sort -u | head -40
echo "#### FIELD CONFIG applicable toggles"
python3 - "$A" "$CODE" <<'EOF'
import re,sys,html
A,code=sys.argv[1],sys.argv[2]
SU='/home/marketing/repos/refs/blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component'
ts=open(SU+'.ts',encoding='utf-8').read(); src=open(SU+'.html',encoding='utf-8').read()
m={}
for k,v in re.findall(r"this\.([a-z_0-9]+_text)\s*=\s*this\.translate\.getLabel\('[^']*',\s*'((?:[^'\\]|\\.)*)'",ts): m.setdefault(k,v)
for k,v in re.findall(r'this\.([a-z_0-9]+_text)\s*=\s*this\.translate\.getLabel\("[^"]*",\s*"([^"]*)"',ts): m.setdefault(k,v)
def res(s): return re.sub(r'\{\{\s*([a-z_0-9]+)\s*\}\}',lambda mm:m.get(mm.group(1),'??'+mm.group(1)),s)
try: keys=set(re.findall(r'^\s*([A-Z_0-9]+)\??:',open(A+'/src/app/models/applet-settings.model.ts').read(),re.M))
except Exception as e: print("no applet-settings.model.ts",e); keys=set()
tok=re.compile(r'<span class="field-header">([^<]*)</span>|<mat-slide-toggle([^>]*)>(.*?)</mat-slide-toggle>|<mat-label>([^<]*)</mat-label>\s*<(?:input|mat-select|textarea)([^>]*)>|<mat-checkbox([^>]*)>(.*?)</mat-checkbox>',re.S)
section='';seen=set();out=[]
for mm in tok.finditer(src):
    if mm.group(1): section=res(mm.group(1).strip()); continue
    attrs=mm.group(2) or mm.group(5) or mm.group(6) or ''
    label=mm.group(3) or mm.group(4) or mm.group(7) or ''
    fc=re.search(r"formControlName=\"([A-Z_0-9]+)\"|controls\['([A-Z_0-9]+)'\]",attrs); fc=(fc.group(1) or fc.group(2)) if fc else '?'
    label=html.unescape(re.sub(r'\s+',' ',re.sub(r'<[^>]+>','',label))).strip()
    if fc in keys and fc not in seen:
        seen.add(fc); out.append(f"{section} | {fc} | {res(label)}")
print(len(out),"toggles on shared screen for this applet")
print("\n".join(out))
print("KEYS NOT ON SCREEN:",sorted(keys-seen))
# applet-code specific gating
print("APPLET-CODE MENTIONS in shared ts:", [l.strip()[:120] for l in ts.splitlines() if code.lower() in l.lower()][:12])
EOF
echo "#### HIDE_*_MENU handling in app.component"; grep -n "updateMenuItem\|_MENU" $A/src/app/app.component.ts | head -12
echo "#### TABS (create/edit)"; grep -rhoE "<mat-tab[^>]*label=\"[^\"]*\"" $A/src/app/components/*/*create/*.component.html $A/src/app/components/*/*edit/*.component.html 2>/dev/null | sort -u | tr '\n' ' '; echo
echo "#### KO tabs"; grep -rhoE "mat-tab[^>]*label=\"Search [^\"]*\"" $A/src/app/components --include=*.html | sort -u | tr '\n' ' '; echo
echo "#### DOC TYPES referenced"; grep -rhoE "'INTERNAL_[A-Z_]+'" $A/src/app --include=*.ts | sort | uniq -c | sort -rn | head -12
echo "#### COMMITS"; git -C $R log --no-merges --format='%s' -60 | cut -c1-170
