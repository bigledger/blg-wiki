#!/usr/bin/env python3
"""Tree-walking *ngIf gate analysis for the shared FieldConfigurationComponent template.
usage: gates.py <appletCode> [key ...]
Prints, for every formControlName / controls['X'] in the shared HTML, the chain of enclosing *ngIf
expressions, and evaluates simple show*/hide*/appletCode gates for the given applet code."""
import re, sys, html as H
CODE = sys.argv[1]
ONLY = set(sys.argv[2:])
SU = '/home/marketing/repos/refs/blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component'
src = open(SU + '.html', encoding='utf-8').read()
ts = open(SU + '.ts', encoding='utf-8').read()

# tab state: defaults from class fields + tabMappings for CODE
state = {}
for m in re.finditer(r'^\s*(show[A-Za-z]+Tab|hide[A-Za-z]+Tab)\s*:\s*boolean\s*=\s*(true|false)', ts, re.M):
    state[m.group(1)] = (m.group(2) == 'true')
tm = re.search(r"const tabMappings = \{(.*?)\n\s*\};", ts, re.S).group(1)
for line in tm.splitlines():
    m = re.match(r"\s*'([^']+)':\s*\[(.*)\]", line)
    if m and m.group(1) == CODE:
        for t in re.findall(r"'([^']+)'", m.group(2)):
            state[t] = True

VOID = {'input', 'br', 'hr', 'img', 'meta', 'link'}
tag_re = re.compile(r'<(/?)([a-zA-Z][a-zA-Z0-9\-]*)([^>]*?)(/?)>', re.S)
stack = []  # (tag, ngif or None)
results = []
pos = 0
for m in tag_re.finditer(src):
    closing, tag, attrs, selfclose = m.group(1), m.group(2), m.group(3), m.group(4)
    if closing:
        # pop to matching tag
        for i in range(len(stack) - 1, -1, -1):
            if stack[i][0] == tag:
                del stack[i:]
                break
        continue
    ngif = re.search(r'\*ngIf="([^"]*)"', attrs)
    ngif = ngif.group(1).strip() if ngif else None
    fc = re.search(r"formControlName=\"([A-Z_0-9]+)\"|controls\['([A-Z_0-9]+)'\]", attrs)
    key = (fc.group(1) or fc.group(2)) if fc else None
    chain = [g for (_, g) in stack if g] + ([ngif] if ngif else [])
    if key and (not ONLY or key in ONLY):
        results.append((key, chain))
    if selfclose or tag in VOID:
        continue
    stack.append((tag, ngif))


def evaluate(expr):
    """Return True/False/None (unknown) for a gate expression under CODE/state."""
    e = re.sub(r'\s+', ' ', expr).strip()
    e = re.sub(r'!\s*verticalSettingsOrientation\(\)', 'True', e)
    e = re.sub(r'verticalSettingsOrientation\(\)', 'False', e)
    # appletCode comparisons
    if 'appletCode' in e:
        pe = re.sub(r"appletCode\s*(===|!==|==|!=)\s*'([^']+)'", lambda m: str((CODE == m.group(2)) if m.group(1) in ('===','==') else (CODE != m.group(2))), e)
        if re.fullmatch(r"[\s()|&!TrueFals]+", pe):
            pe = pe.replace('&&', ' and ').replace('||', ' or ').replace('!', ' not ')
            try:
                return bool(eval(pe))
            except Exception:
                return None
        return None
    if e in ('True','False'):
        return e == 'True'
    if e in ('True','False'):
        return e == 'True'
    if re.fullmatch(r'!?\s*(show|hide)[A-Za-z]+Tab', e):
        neg = e.startswith('!')
        name = e.lstrip('! ').strip()
        if name in state:
            return (not state[name]) if neg else state[name]
        return None
    if re.fullmatch(r'!?\s*(show|hide)[A-Za-z]+Tab(\s*(\|\||&&)\s*!?\s*(show|hide)[A-Za-z]+Tab)+', e):
        pe = e
        for name in set(re.findall(r'(?:show|hide)[A-Za-z]+Tab', e)):
            if name not in state:
                return None
            pe = re.sub(r'\b' + name + r'\b', str(state[name]), pe)
        pe = pe.replace('&&', ' and ').replace('||', ' or ').replace('!', ' not ')
        try:
            return bool(eval(pe))
        except Exception:
            return None
    return None

seen = {}
for key, chain in results:
    verdict = 'RENDERED'
    unknown = []
    for g in chain:
        v = evaluate(g)
        if v is False:
            verdict = 'GATED-OUT'
            break
        if v is None:
            unknown.append(g)
    if verdict == 'RENDERED' and unknown:
        verdict = 'RENDERED?(runtime: ' + ' ; '.join(u[:70] for u in unknown) + ')'
    # keep the best verdict per key (rendered anywhere counts)
    prev = seen.get(key)
    rank = {'RENDERED': 2, 'GATED-OUT': 0}.get(verdict.split('?')[0], 1)
    if prev is None or rank > prev[0]:
        seen[key] = (rank, verdict, chain)
for key in sorted(seen):
    rank, verdict, chain = seen[key]
    print(f"{key}\t{verdict}\t{' > '.join(c[:60] for c in chain)}")
