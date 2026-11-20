#!/usr/bin/env python3
"""print_active.py -- print active entries of papers/M2/WRITE_LOG.md, and no retired one.

  python3 papers/M2/checks/print_active.py --statements     the statement of every active entry
  python3 papers/M2/checks/print_active.py --list           the numbers of the active entries
  python3 papers/M2/checks/print_active.py 231 233          the named entries whole, with their marks

A retired entry is never printed: if one is named, the script says so and prints nothing of it.
A working aid (the PI, Decision Log P300: reading of the unretired results is open).
"""
import re, sys
s = open('papers/M2/WRITE_LOG.md').read()
parts = re.split(r'(?m)^(### M2-W(\d+) · (active|retired)\n)', s)
ent = {int(parts[i+1]): (parts[i+2], parts[i], parts[i+3]) for i in range(1, len(parts), 4)}
args = sys.argv[1:]
if not args or args == ['--list']:
    print(' '.join('M2-W%03d' % n for n in sorted(ent) if ent[n][0] == 'active'))
elif args == ['--statements']:
    for n in sorted(ent):
        st, head, body = ent[n]
        if st != 'active': continue
        m = re.search(r'```tex\n(.*?)```', body, re.S)
        print(head.strip()); print(m.group(1).strip() if m else '(no statement)'); print()
else:
    for a in args:
        n = int(re.sub(r'\D', '', a))
        if n not in ent: print('M2-W%03d: no such entry' % n); continue
        st, head, body = ent[n]
        if st != 'active': print('M2-W%03d is retired and is not printed.' % n); continue
        print(head + body)
