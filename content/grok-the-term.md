---
title: grok the term
slug: grok-the-term
date: 2020-01-29 
modified: 2020-12-26
status: published
---

A few minutes into a conversation about [why I use Linux](), I am hit with the question. *So what is* a terminal?

looking at a segment of `pstree`

```bash
 ├─st───zsh───tmux: client
 └─st───zsh───pstree
```

You can see htop running on this terminal.

Now if we look at the process tree below&hellip;

```bash
 ─firefox─┬─Privileged Cont───20*[{Privileged Cont}]
          ├─Web Content───26*[{Web Content}]
          ├─2*[Web Content───23*[{Web Content}]]
          ├─2*[Web Content───24*[{Web Content}]]
          ├─Web Content───15*[{Web Content}]
          ├─WebExtensions───22*[{WebExtensions}]
          └─79*[{firefox}]
```

*Woah*, a lot more processes.

Firefox uses a *graphical user interface (GUI)* which runs more programs for user accessibility. 

By interacting with a terminal, I reduce the need to expend resources at the expense of learning a new skill.

Consider another example. Using Notepad++ and Vim. Or Vim and gVim (vim running with a GUI).
Scaling up, we get to a desktop with its clickable menus and convenient taskbar. 

For a laptop that is 10 years old, extra processes takes it's toll.  
I also only use a handful of applications: text-editor, file manager, music player, pdf viewer. Everything else is online. 

No desktop, minimal GUI, only the applications I need.

I think Bruce Lee sums it up well:

> Absorb what is useful, discard what is useless and add what is specifically your own.





