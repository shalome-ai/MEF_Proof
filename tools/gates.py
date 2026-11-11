#!/usr/bin/env python3
r"""The five gates of CLAUDE.md §8 for one paper of the Mx series.

Usage:  python3 tools/gates.py M2            # all five gates
        python3 tools/gates.py M2 3 4 5      # selected gates (2 needs 1's build)

Gate 1  XeLaTeX, three passes; zero errors; zero undefined references; zero missing characters.
Gate 2  Zero overfull boxes; margin scan clean (25 mm; only footer page numbers
        outside). The scan renders each page and flags ink more than 1 mm into the
        side or top margins, or more than 2 mm below the text block (the last
        line's depth); Lean listing frames count (Decision Log P15).
Gate 3  Lint: forbidden ω names (canon/omega-definition-usage_v2.md §6a); "I "
        voice outside the acknowledgements; US spellings; hard-coded
        "Section~N"; \cite of an MEF corpus paper; "!" in prose; bullets or
        boxes in prose.
Gate 4  lake build of the paper's certificates; no `sorry`, no `axiom`; no
        Mathlib import; each certificate compiles standalone on core Lean.
Gate 5  Every \texttt{Lx_...} named in the paper is a theorem in the paper's
        certificates. A name found only in an earlier Mx paper's certificates
        is reported as a cross-reference and passes (island rule: Mx may cite
        M1..M(x-1)).

The paper is papers/<Mx>/ if that folder holds a main .tex (one with
\documentclass), else canon/<Mx>/. Certificates: MEFProof/Paper_<Mx>/.
Build output (log, PDF) is copied to build/gates/<Mx>/ (git-ignored).
XeLaTeX: $XELATEX, else `xelatex` on PATH, else the newest Windows TeX Live
under /mnt/c/texlive (WSL); a Windows build runs in a mirror of the repository
layout under the Windows %TEMP%, so nothing is written inside canon/.
Exit status 0 only if every selected gate passes.
"""
import fnmatch
import os
import re
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
BUILD = ROOT / "build" / "gates"
MARGIN_PT = 25.0 / 25.4 * 72.0          # 25 mm
MARGIN_SLACK_PT = 72.0 / 25.4               # 1 mm past the side and top margin lines
BOTTOM_SLACK_PT = 2 * 72.0 / 25.4           # 2 mm below the text block: the last line's depth (P15)
MAX_REPORT = 40                          # findings printed per gate


# ───────────────────────── helpers ─────────────────────────

def read(p):
    return Path(p).read_text(encoding="utf-8", errors="replace").replace("\r", "")


def main_tex(d):
    hits = [p for p in sorted(Path(d).glob("*.tex"))
            if re.search(r"^\s*\\documentclass", read(p), re.M)]
    return hits[0] if hits else None


def paper_dir(pid):
    for d in (ROOT / "papers" / pid, ROOT / "canon" / pid):
        if d.is_dir() and main_tex(d):
            return d
    sys.exit(f"no paper folder with a main .tex for {pid} "
             f"(looked in papers/{pid}/ and canon/{pid}/)")


def paper_tex_files(d):
    """The paper's own .tex files, main first; the shared macro file is excluded."""
    main = main_tex(d)
    rest = [p for p in sorted(d.glob("*.tex")) if p != main and p.name != "mef_macros.tex"]
    return [main] + rest


def cert_dir(pid):
    return ROOT / "MEFProof" / f"Paper_{pid}"


def earlier_papers(pid):
    m = re.fullmatch(r"M(\d+)", pid)
    return [f"M{k}" for k in range(1, int(m.group(1)))] if m else []


def unwrap_log(txt):
    """TeX wraps log lines at 79 characters; rejoin them before parsing."""
    out, buf = [], ""
    for line in txt.split("\n"):
        buf += line
        if len(line) != 79:
            out.append(buf)
            buf = ""
    if buf:
        out.append(buf)
    return "\n".join(out)


def strip_tex_comment(line):
    return re.sub(r"(?<!\\)%.*", "", line)


def run(cmd, cwd, timeout, env=None):
    try:
        return subprocess.run([str(c) for c in cmd], cwd=str(cwd), env=env,
                              capture_output=True, text=True, errors="replace",
                              timeout=timeout)
    except subprocess.TimeoutExpired:
        return None


def pdf_pages(pdf):
    try:
        import pymupdf
    except ImportError:
        return None
    if not Path(pdf).exists():
        return None
    with pymupdf.open(str(pdf)) as doc:
        return doc.page_count


# ───────────────────────── gate 1 ─────────────────────────

def find_xelatex():
    x = os.environ.get("XELATEX") or shutil.which("xelatex")
    if x:
        return Path(x)
    cands = sorted(Path("/mnt/c/texlive").glob("*/bin/windows/xelatex.exe"))
    return cands[-1] if cands else None


def windows_temp():
    r = run(["cmd.exe", "/c", "echo %TEMP%"], "/mnt/c", 60)
    if r is None or r.returncode != 0:
        return None
    w = run(["wslpath", "-u", r.stdout.strip()], "/", 30)
    return Path(w.stdout.strip()) if w and w.returncode == 0 else None


def gate1(pid):
    d, notes = paper_dir(pid), []
    main = main_tex(d)
    x = find_xelatex()
    if not x:
        return False, ["XeLaTeX not found: set $XELATEX, install TeX in WSL, "
                       "or install TeX Live on Windows under C:\\texlive"]
    windows = x.suffix.lower() == ".exe"
    base = windows_temp() if windows else BUILD
    if base is None:
        return False, ["could not resolve the Windows %TEMP% folder"]
    work = base / "mef_gates" / pid
    if work.exists():
        shutil.rmtree(work)
    rel = d.relative_to(ROOT)
    shutil.copytree(d, work / rel)
    if cert_dir(pid).is_dir():   # the appendix lists the certificates from either layout:
        shutil.copytree(cert_dir(pid), work / cert_dir(pid).relative_to(ROOT))  # ../../MEFProof/Paper_Mx/
        shutil.copytree(cert_dir(pid), work / rel / f"{pid}_lean")              # Mx_lean/ beside the .tex
    cwd = work / rel
    uses_bibtex = re.search(r"^[^%\n]*\\bibliography\{", read(main), re.M)
    for i in (1, 2, 3):
        r = run([x, "-interaction=nonstopmode", "-file-line-error", main.name], cwd, 900)
        if r is None:
            return False, [f"pass {i} timed out"]
        if i == 1 and uses_bibtex:
            run([x.with_name("bibtex.exe" if windows else "bibtex"), main.stem], cwd, 300)
    log, pdf = cwd / f"{main.stem}.log", cwd / f"{main.stem}.pdf"
    BUILD.joinpath(pid).mkdir(parents=True, exist_ok=True)
    for f in (log, pdf):
        if f.exists():
            shutil.copy2(f, BUILD / pid / f.name)
    if not log.exists():
        return False, ["no log written: XeLaTeX did not run"]
    txt = unwrap_log(read(log))
    errors = [l for l in txt.split("\n") if re.match(r"^\S+?\.tex:\d+: ", l) or l.startswith("! ")]
    undef = re.findall(r"(Reference|Citation) [`'‘]([^'’]+)['’] on page \d+\s*undefined", txt)
    missing = re.findall(r"Missing character: There is no (\S+) ", txt)
    ok = not errors and not undef and not missing and pdf.exists()
    pages = re.search(r"Output written on .*?\((\d+) pages?", txt)
    notes.append(f"XeLaTeX: {x}  (build mirror: {work})")
    notes.append(f"output: {pages.group(1) + ' pages' if pages else 'NO PDF'}; "
                 f"log and PDF copied to {(BUILD / pid).relative_to(ROOT)}/")
    stored = d / f"{main.stem}.pdf"
    n = pdf_pages(stored)
    if n is None:
        notes.append(f"no stored PDF {stored.relative_to(ROOT)} to compare page counts with")
    elif pages:
        notes.append(f"stored PDF in {rel}/ has {n} pages "
                     f"({'matches' if n == int(pages.group(1)) else 'DIFFERS'})")
    notes += [f"error: {e}" for e in errors]
    notes += [f"undefined {k.lower()}: {name}" for k, name in sorted(set(undef))]
    if missing:
        from collections import Counter as _C
        notes.append("missing characters (the font lacks them; they print as blanks): "
                     + ", ".join(f"{ch} x{n}" for ch, n in sorted(_C(missing).items())))
    if "Label(s) may have changed" in txt:
        notes.append("warning: labels still changing after three passes")
    return ok, notes


# ───────────────────────── gate 2 ─────────────────────────

def ink_box(page, clip, zoom, exempt):
    """Page-coordinate bounding box of the non-white pixels in `clip`, ignoring `exempt` rects."""
    import pymupdf
    if clip.is_empty:
        return None
    pix = page.get_pixmap(matrix=pymupdf.Matrix(zoom, zoom), clip=clip,
                          colorspace=pymupdf.csGRAY, alpha=False, annots=False)
    w, h, stride = pix.width, pix.height, pix.stride
    buf = bytearray(pix.samples)
    for r in exempt:                                   # blank the exempt areas
        x0, y0 = max(0, int(r.x0 * zoom) - pix.x), max(0, int(r.y0 * zoom) - pix.y)
        x1, y1 = min(w, int(r.x1 * zoom) + 1 - pix.x), min(h, int(r.y1 * zoom) + 1 - pix.y)
        for y in range(y0, y1):
            if x1 > x0:
                buf[y * stride + x0:y * stride + x1] = b"\xff" * (x1 - x0)
    dark = bytes(1 if v < 200 else 0 for v in range(256))
    box = None
    for y in range(h):
        row = bytes(buf[y * stride:y * stride + w]).translate(dark)
        i = row.find(1)
        if i < 0:
            continue
        j = row.rfind(1)
        box = [i, y, j, y] if box is None else [min(box[0], i), box[1], max(box[2], j), y]
    if box is None:
        return None
    return pymupdf.Rect((pix.x + box[0]) / zoom, (pix.y + box[1]) / zoom,
                        (pix.x + box[2] + 1) / zoom, (pix.y + box[3] + 1) / zoom)



def gate2(pid):
    main = main_tex(paper_dir(pid))
    log, pdf = BUILD / pid / f"{main.stem}.log", BUILD / pid / f"{main.stem}.pdf"
    if not (log.exists() and pdf.exists()):
        return False, ["no build found: run gate 1 first"]
    try:
        import pymupdf
    except ImportError:
        return False, ["PyMuPDF not installed (python3 -m pip install --user pymupdf)"]
    notes = []
    over = [l for l in unwrap_log(read(log)).split("\n") if re.match(r"^Overfull \\[hv]box", l)]
    notes += [f"overfull: {l.strip()}" for l in over]
    m, slack, zoom, out = MARGIN_PT, MARGIN_SLACK_PT, 2, []
    a, ab = m - slack, m - BOTTOM_SLACK_PT     # flagged bands begin here
    with pymupdf.open(str(pdf)) as doc:
        for pno, page in enumerate(doc, 1):
            W, H = page.rect.width, page.rect.height
            strips = {"left": pymupdf.Rect(0, 0, a, H), "right": pymupdf.Rect(W - a, 0, W, H),
                      "top": pymupdf.Rect(a, 0, W - a, a), "bottom": pymupdf.Rect(a, H - ab, W - a, H)}
            spans = [(pymupdf.Rect(s["bbox"]), s["text"].strip())
                     for blk in page.get_text("dict")["blocks"] if blk["type"] == 0
                     for ln in blk["lines"] for s in ln["spans"] if s["text"].strip()]
            exempt = [r + (-1, -1, 1, 1) for r, txt in spans          # footer page number
                      if r.y0 >= H - m - slack and re.fullmatch(r"[0-9]+|[ivxlcdm]+", txt, re.I)]
            for side, clip in strips.items():
                ink = ink_box(page, clip, zoom, exempt if side == "bottom" else [])
                if ink is None:
                    continue
                depth = {"left": m - ink.x0, "right": ink.x1 - (W - m),
                         "top": m - ink.y0, "bottom": ink.y1 - (H - m)}[side]
                near = " ".join(txt for r, txt in spans if r.intersects(ink))[:50]
                out.append(f"margin: p.{pno} {side}: ink {depth:.1f}pt into the margin "
                           f"[{ink.x0:.0f},{ink.y0:.0f},{ink.x1:.0f},{ink.y1:.0f}] "
                           + (f"near {near!r}" if near else "(a rule or drawing)"))
    notes.insert(0, f"{len(over)} overfull box(es); ink in the 25 mm margin on {len(out)} page "
                    f"side(s) (1 mm at the sides and top, 2 mm below the block; footer page numbers exempt)")
    notes += out
    return not over and not out, notes


# ───────────────────────── gate 3 ─────────────────────────

FORBIDDEN = [  # canon/omega-definition-usage_v2.md §6a, forbidden column
    (r"coherence\s+field", re.I), (r"negentropic", re.I), (r"negentropy", re.I),
    (r"\bNOP\b", 0), (r"\\consciousness\b", 0), (r"consciousness\s+(field|gradients?)", re.I),
]

US_SPELLINGS = [
    (r"\b[a-z]{2,}(?:iz|yz)(?:e|es|ed|ing|er|ers|ation|ations|able)\b", "-ise/-yse"),
    (r"\bcolor(s|ed|ing|ful)?\b", "colour"), (r"\bbehavior(s|al)?\b", "behaviour"),
    (r"\bfavor(s|ed|ing|able|ite|ites)?\b", "favour"), (r"\bhonor(s|ed|ing|able)?\b", "honour"),
    (r"\blabor(s|ed|ing)?\b", "labour"), (r"\bneighbor(s|ing|hood|hoods)?\b", "neighbour"),
    (r"\b(flavor|humor|vapor|vigor|harbor|endeavor)(s|ed|ing)?\b", "-our"),
    (r"\b(center|centers|centered|centering)\b", "centre/centred"),
    (r"\bfiber(s|ed)?\b", "fibre"), (r"\b(liter|liters|theater|theaters|caliber)\b", "-re"),
    (r"\b(defense|offense)\b", "defence/offence"),
    (r"\b(catalog|catalogs|dialog|dialogs|analog|analogs)\b", "-ogue"),
    (r"\bprograms?\b", "programme"), (r"\bgray\b", "grey"),
    (r"\b(model|label|travel|cancel|fuel|signal|total|level|channel|tunnel|equal)(ed|ing|er|ers)\b", "double l"),
    (r"\btoward\b", "towards"), (r"\bartifacts?\b", "artefact"),
    (r"\bskeptic(s|al|ism)?\b", "sceptic"), (r"\baluminum\b", "aluminium"),
    (r"\bmaneuver", "manoeuvre"), (r"\backnowledgments?\b", "acknowledgement"),
    (r"\bgotten\b", "got"), (r"\bmath\b", "maths"),
]
US_OK = {"size", "sizes", "sized", "resize", "resized", "seize", "seized", "seizes",
         "prize", "prizes", "capsize", "maize", "assize", "baize"}

I_PRECEDERS = {"paper", "papers", "part", "type", "case", "class", "phase", "region",
               "stage", "chapter", "volume", "book", "step", "level", "sector", "table",
               "figure", "section", "appendix", "theorem", "lemma", "proposition",
               "corollary", "remark", "definition", "axiom", "rule", "group", "series",
               "model", "option", "route", "item", "regime", "kind", "species", "order"}

SKIP_ENVS = {"lstlisting", "verbatim", "Verbatim", "minted", "thebibliography",
             "equation", "equation*", "align", "align*", "gather", "gather*",
             "multline", "multline*", "eqnarray", "eqnarray*", "displaymath", "math",
             "flalign", "flalign*", "alignat", "alignat*", "tikzpicture"}
CODE_ENVS = {"lstlisting", "verbatim", "Verbatim", "minted"}

ARG_COMMANDS = (r"label|ref|eqref|autoref|cref|Cref|pageref|cite|citep|citet|nocite|"
                r"input|include|includegraphics|lstinputlisting|url|usepackage|"
                r"RequirePackage|documentclass|begin|end|texttt|lstinline|path|"
                r"definecolor|color|textcolor|hypersetup|setlength|newcommand|"
                r"renewcommand|providecommand|newtheorem|theoremstyle|bibitem|"
                r"bibliographystyle|bibliography|hyperref|href|newenvironment|"
                r"DeclareMathOperator|setcounter|addtocounter|vspace|hspace|"
                r"thispagestyle|pagestyle|lstset|captionsetup")


def prose(line):
    """Comment-free line with math, verbatim, references and command arguments removed."""
    s = strip_tex_comment(line)
    s = re.sub(r"\\verb(.).*?\1", " ", s)
    s = re.sub(r"\$\$.*?\$\$|\$[^$]*\$|\\\(.*?\\\)|\\\[.*?\\\]", " ", s)
    s = re.sub(r"\\(?:%s)\*?(?:\[[^\]]*\])*(?:\{[^{}]*\})?(?:\[[^\]]*\])*" % ARG_COMMANDS, " ", s)
    s = re.sub(r"\\[!,;: ]", " ", s)
    return s


def mx_titles():
    titles = []
    for d in sorted((ROOT / "canon").glob("M*")):
        mt = main_tex(d) if d.is_dir() else None
        if mt:
            t = re.search(r"\\title\{(.*?)\}\s*$", read(mt), re.M)
            if t:
                titles.append(norm(t.group(1)))
    return titles


def norm(s):
    return re.sub(r"\s+", " ", re.sub(r"[{}\\~]", " ", s)).strip().lower()


def corpus_keys():
    f = ROOT / "sources" / "MEF-Bibliography.tex"
    if not f.exists():
        return set()
    t = read(f)
    return set(re.findall(r"\\bibitem(?:\[[^\]]*\])?\{([^}]+)\}", t)) | \
        set(re.findall(r"^@\w+\{([^,]+),", t, re.M))


def gate3(pid):
    d = paper_dir(pid)
    files, found = paper_tex_files(d), []

    def hit(f, n, check, text):
        found.append(f"{f.relative_to(ROOT)}:{n}: [{check}] {' '.join(text.split())[:90]}")

    whole_body, bibitems = "", {}
    for f in files:
        raw = read(f)
        lines = raw.split("\n")
        nocomment = "\n".join(strip_tex_comment(l) for l in lines)
        whole_body += nocomment + "\n"
        # forbidden ω names: whole file, phrases may break across lines
        for pat, flags in FORBIDDEN:
            for mt in re.finditer(pat, nocomment, flags):
                hit(f, nocomment.count("\n", 0, mt.start()) + 1, "forbidden ω name", mt.group(0))
        for key, body in re.findall(r"\\bibitem(?:\[[^\]]*\])?\{([^}]+)\}(.*?)"
                                    r"(?=\\bibitem|\\end\{thebibliography\})", nocomment, re.S):
            bibitems[key.strip()] = body
        in_doc = not re.search(r"\\documentclass", raw)       # fragments have no preamble
        skip, display, ack = [], False, False
        for n, line in enumerate(lines, 1):
            code = strip_tex_comment(line)
            if re.search(r"\\begin\{document\}", code):
                in_doc = True
                continue
            for env in re.findall(r"\\begin\{([^}]+)\}", code):
                if env in SKIP_ENVS:
                    skip.append(env)
            in_code = any(e in CODE_ENVS for e in skip)
            ends = re.findall(r"\\end\{([^}]+)\}", code)
            if re.search(r"\\(?:sub)*section\*?\{Acknowledge?ments?\}", code):
                ack = True
            elif re.search(r"\\(?:section|appendix\b|end\{document\}|begin\{thebibliography\})", code):
                ack = False
            if not in_code:   # bullets or boxes
                for mt in re.finditer(r"\\begin\{(itemize|tcolorbox|mdframed|framed|shaded)\}|"
                               r"\\(textbullet|fbox|framebox|boxed|colorbox|fcolorbox|"
                               r"shadowbox|doublebox|ovalbox)\b|\$\\bullet\$", code):
                    hit(f, n, "bullet or box", mt.group(0))
            if "\\[" in code and "\\]" not in code.split("\\[")[-1]:
                display = True
            text_ok = in_doc and not skip and not display
            if display and "\\]" in code:
                display = False
            for e in ends:
                if e in skip:
                    skip.remove(e)
            if not text_ok:
                continue
            p = prose(line)
            for pat, uk in US_SPELLINGS:
                for mt in re.finditer(pat, p, re.I):
                    if mt.group(0).lower() not in US_OK:
                        hit(f, n, f"US spelling → {uk}", mt.group(0))
            if not ack:
                for mt in re.finditer(r"(?<![A-Za-z\\{])I(?:'(?:m|ve|d|ll)\b|(?=\s+[a-z]))", p):
                    before = re.search(r"([A-Za-z]+)[\s~(]*$", p[:mt.start()])
                    if not (before and before.group(1).lower() in I_PRECEDERS):
                        hit(f, n, '"I" voice', p[max(0, mt.start() - 30):mt.start() + 30])
            for mt in re.finditer(r"\b(Sections?|Sec\.)\s*~?\s*\d|(?:§|\\S)\s*~?\s*\d", p):
                if not re.search(r"\bM\d{1,2}\b", p[max(0, mt.start() - 20):mt.start()]):
                    hit(f, n, "hard-coded section number", mt.group(0))
            if "!" in p:
                hit(f, n, '"!" in prose', p[max(0, p.index("!") - 40):p.index("!") + 5])
    # \cite of an MEF corpus paper
    keys = set()
    for grp in re.findall(r"\\cite[pt]?\*?(?:\[[^\]]*\])*\{([^}]*)\}", whole_body):
        keys |= {k.strip() for k in grp.split(",") if k.strip()}
    titles, corpus = mx_titles(), corpus_keys()
    for k in sorted(keys):
        body = norm(bibitems.get(k, ""))
        is_mx = any(t and t in body for t in titles) or re.search(r"\bpaper m\d{1,2}\b", body)
        by_master = re.search(r"\bmaster\b(?! equation)", body)
        if k in corpus or (by_master and not is_mx):
            found.append(f"[MEF corpus \\cite] key {k!r}: {bibitems.get(k, '(no bibitem)').strip()[:80]}")
    return not found, ([f"{len(found)} finding(s) in {len(files)} file(s)"] + found)


# ───────────────────────── gate 4 ─────────────────────────

def strip_lean_comments(s):
    out, i, depth, n = [], 0, 0, len(s)
    while i < n:
        if s.startswith("/-", i):
            depth, i = depth + 1, i + 2
            continue
        if depth:
            if s.startswith("-/", i):
                depth, i = depth - 1, i + 2
                continue
            out.append("\n" if s[i] == "\n" else "")
            i += 1
            continue
        if s.startswith("--", i):
            j = s.find("\n", i)
            i = n if j < 0 else j
            continue
        if s[i] == '"':
            j = i + 1
            while j < n and s[j] != '"':
                j += 2 if s[j] == "\\" else 1
            out.append(s[i:j + 1])
            i = j + 1
            continue
        out.append(s[i])
        i += 1
    return "".join(out)


def gate4(pid):
    cd = cert_dir(pid)
    files = sorted(cd.glob("*.lean")) if cd.is_dir() else []
    if not files:
        return False, [f"no certificates in {cd.relative_to(ROOT)}/"]
    notes, ok = [], True
    for f in files:
        src = strip_lean_comments(read(f))
        rel = f.relative_to(ROOT)
        for mt in re.finditer(r"\bsorry\b", src):
            ok = False
            notes.append(f"{rel}:{src.count(chr(10), 0, mt.start()) + 1}: sorry")
        for mt in re.finditer(r"^\s*(?:private\s+|protected\s+)?axiom\b", src, re.M):
            ok = False
            notes.append(f"{rel}:{src.count(chr(10), 0, mt.start()) + 1}: axiom")
        for imp in re.findall(r"^\s*import\s+(\S+)", src, re.M):
            if imp.split(".")[0] == "Mathlib":
                ok = False
                notes.append(f"{rel}: imports {imp} (Mathlib)")
    lake = shutil.which("lake") or str(Path.home() / ".elan" / "bin" / "lake")
    mods = [f"MEFProof.Paper_{pid}.{f.stem}" for f in files]
    r = run([lake, "build", *mods], ROOT, 3600)
    if r is None or r.returncode != 0:
        ok = False
        notes.append("lake build FAILED" if r else "lake build timed out")
        if r:
            notes += [l for l in (r.stdout + r.stderr).split("\n") if "error" in l.lower()][:20]
    else:
        notes.append(f"lake build: {len(mods)} module(s) OK (only rebuilt modules are timed below)")
        notes += [l.strip() for l in r.stdout.split("\n") if "Built MEFProof" in l]
    env = {k: v for k, v in os.environ.items() if k != "LEAN_PATH"}
    lean = shutil.which("lean") or str(Path.home() / ".elan" / "bin" / "lean")
    for f in files:
        r = run([lean, f.relative_to(ROOT)], ROOT, 900, env=env)
        if r is None or r.returncode != 0:
            ok = False
            notes.append(f"standalone core Lean FAILED: {f.name}: "
                         f"{(r.stdout + r.stderr).strip()[:200] if r else 'timed out'}")
    if ok:
        notes.append(f"standalone core Lean: {len(files)} file(s) clean")
    root_imports = set(re.findall(r"^\s*import\s+(\S+)", read(ROOT / "MEFProof.lean"), re.M))
    missing = [m for m in mods if m not in root_imports]
    if missing:
        notes.append("warning: not imported by MEFProof.lean (CLAUDE.md §10): " + ", ".join(missing))
    return ok, notes


# ───────────────────────── gate 5 ─────────────────────────

THEOREM = re.compile(r"^\s*(?:@\[[^\]]*\]\s*)?(?:(?:private|protected|noncomputable)\s+)*"
                     r"(?:theorem|lemma)\s+([^\s(:{\[]+)", re.M)


def theorems(pid):
    cd = cert_dir(pid)
    names = set()
    for f in (sorted(cd.glob("*.lean")) if cd.is_dir() else []):
        names |= {n.split(".")[-1] for n in THEOREM.findall(strip_lean_comments(read(f)))}
    return names


def gate5(pid):
    d = paper_dir(pid)
    named = {}
    for f in paper_tex_files(d):
        txt = "\n".join(strip_tex_comment(l) for l in read(f).split("\n"))
        for mt in re.finditer(r"\\texttt\{([^{}]*)\}", txt):
            # a theorem name starts the token: not the L of a file name like M2\_L1\_parity.lean
            for tok in re.findall(r"(?<![A-Za-z0-9_])(?<!\\_)L\d+(?:\\_|_)[A-Za-z0-9_\\*]*(?!\.lean)",
                                  mt.group(1)):
                name = tok.replace("\\_", "_").replace("\\*", "*").rstrip("_")
                named.setdefault(name, f"{f.relative_to(ROOT)}:{txt.count(chr(10), 0, mt.start()) + 1}")
    own = theorems(pid)
    earlier = {p: theorems(p) for p in earlier_papers(pid)}
    notes, missing, cross = [], [], []
    for name, where in sorted(named.items()):
        if any(fnmatch.fnmatchcase(t, name) for t in own):
            continue
        src = [p for p, ns in earlier.items() if any(fnmatch.fnmatchcase(t, name) for t in ns)]
        (cross if src else missing).append((name, where, src))
    notes.append(f"{len(named)} name(s) cited; {len(own)} theorem(s) in "
                 f"{cert_dir(pid).relative_to(ROOT)}/; {len(missing)} missing; "
                 f"{len(cross)} cross-reference(s)")
    notes += [f"MISSING {n}  ({w})" for n, w, _ in missing]
    notes += [f"cross-reference {n} → {', '.join(s)}  ({w})" for n, w, s in cross]
    return not missing, notes


# ───────────────────────── driver ─────────────────────────

GATES = {1: ("XeLaTeX build", gate1), 2: ("overfull boxes and margins", gate2),
         3: ("lint", gate3), 4: ("Lean certificates", gate4), 5: ("certificate names", gate5)}


def main(argv):
    if not argv or argv[0] in ("-h", "--help"):
        print(__doc__)
        return 2
    pid, sel = argv[0], [int(a) for a in argv[1:]] or sorted(GATES)
    d = paper_dir(pid)
    print(f"Gates for {pid}: {main_tex(d).relative_to(ROOT)}")
    results = {}
    for g in sel:
        title, fn = GATES[g]
        ok, notes = fn(pid)
        results[g] = ok
        print(f"\nGate {g} — {title}: {'PASS' if ok else 'FAIL'}")
        for line in notes[:MAX_REPORT]:
            print(f"  {line}")
        if len(notes) > MAX_REPORT:
            print(f"  … {len(notes) - MAX_REPORT} more")
    print("\nSummary: " + "  ".join(f"G{g} {'PASS' if ok else 'FAIL'}" for g, ok in results.items()))
    return 0 if all(results.values()) else 1


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
