# Checking brief for the passes of M1 v7.0 (kinds 2, 3 and the second half of 4)

**Fixed on 13 November 2026, before Pass A was checked. It is used unchanged for Check A and for Check B (`tools/Paper_assembly_protocol.md`, "What an error is"; `papers/M1/HANDOVER_BUILD.md` §2).**

## What you are

A fresh reader. You are given no conclusion and you are not told what the check is expected to find. You check a text against a list; you do not judge the mathematics.

## What you are given, and nothing else is read

1. This brief.
2. `CLAUDE.md` at the repository root, read from the file on disk (the rules of the repository; §§4 and 5 bind you).
3. **The pass under check**: one `.tex` file in `papers/M1/build_v7/`, named in your instructions.
4. `papers/M1/WRITE_LOG.md`: the write-up log. The fenced `tex` block of each entry headed `· active` is a **confirmed sentence**. Entries headed `· retired` are superseded and are not confirmed sentences.
5. `papers/M1/build_v7/RULINGS_LIST.md`: the list of what the rulings removed or replaced (Corpus Errors Register entries 32 to 36, and the index of `HANDOVER_BUILD.md` §5, both copied by script, with the lines of the earlier version v6.3 that they cite quoted in an appendix). Line numbers in it are of v6.3 and not of the pass: find a passage in the pass by its words.

You read no other file: no other pass, no error log, no register, no handover, no other paper, nothing under `canon/`, `sow/`, `registers/`, `superseded/`, `sources/`, `papers/M2/` or `papers/M3/`. You run no web search.

## What the pass is

The earlier version of the paper with the confirmed sentences put in. Around them stand sentences of the earlier version. Some of those no longer fit.

## What to report

Read the whole pass from `\begin{document}` to `\end{document}`, with every confirmed sentence and the whole of the list before you. Report each instance of these three kinds, and nothing else:

- **Kind 2.** A sentence of the pass that is *not* a confirmed sentence and that a confirmed sentence replaces or contradicts. "Replaces": the confirmed sentence, or its entry's "Rests on", "Mark" or "Retires" line, or the list, says that it stands in place of this sentence or of words in it. "Contradicts": the two cannot both be said by one paper (they give one thing two different definitions, hypotheses, grounds, values or names).
- **Kind 3.** A word or phrase that a ruling removed, still in use in a sentence that is not a confirmed sentence, at a place where the ruling applies. The list and the entries say which words and where. The same word standing where no ruling touches it is not an error: say in one line why a use is or is not within the ruling when it is in doubt.
- **Kind 4 (numbers and counts in the prose).** A number, count, ordinal or cross-reference written out in words or digits in the prose that is no longer right in this pass: for example a count of things that the confirmed sentences have changed, a reference to a numbered clause that the definition no longer has, or "Section n" for something that stands elsewhere. (Undefined `\ref` labels are found by compiling and are not yours.)

A confirmed sentence is never reported as an error and is never to be changed: where two confirmed sentences seem to you to conflict, say so in one sentence under "Other", with the entry numbers, and go on.

**For each finding give:** a running number; the kind; the offending sentence **quoted whole and exactly** from the pass (an error is identified by its kind and this sentence, not by a line number; you may add the line number of the pass as a help); the confirmed entry (M1-Wnnn) or the item of the list (for example "Corpus Errors 33(a)") that it is measured against, with the words of that entry or item that decide it, quoted; and one line saying why it is of that kind. If one sentence is an error of two kinds, give it once with both.

**Then, apart, and not counted as errors:**

- **Register items still standing that fit none of the three kinds.** An item of the list that names a wording still present in the pass, where no confirmed sentence replaces or contradicts it and no ruling removed a word of it. Quote the sentence and name the item.
- **Items of the list you looked for and found already met** in the pass, by item, in one line each.
- **Other.** Anything you could not decide, in one sentence each.

## What you do not do

- You do not say whether any statement, proof or result is true, and you do not look for counter-examples (`CLAUDE.md` §5). If something looks to you like an error of mathematics, say so in one sentence with the lines under "Other" and do not pursue it.
- You do not propose wording. You may say "delete" or name the confirmed sentence that already says what the old one said; you write no new sentence.
- You do not report style, flow, order, repetition or layout. A confirmed sentence that repeats an old sentence which agrees with it is not an error.
- You do not edit any file.

Completeness matters more than brevity: go through the pass in order, and through every item of the list.
