---
layout: blog
title: The Test md Page

---

# Title!

Whatever...

"hi!"

Bye...

  - bang!
  - bang!
  - bang!


  1. uno
  1. dos
  1. tres&hellip;

```cs
function jump() {
  console.log('Jump!')
}
```

## Vue Components

Use a component (this one happens to embed a "live" component tree).

<forge-live-chunk src="/some-bundle.js" mount="#some-mount" />

Vue variable expansion? (i.e. {{ }} )
  - yeah, gotta do this:
  `\{\{ insertTextHere \}\}`

## Formatting

__bold__ **bold**

_italic_ *italic*

~~strikethrough~~

__*bold and italic*__ **_bold and italic_**

super^script^

sub~script~

## Tables

Colons can be used to align columns&hellip;

| Tables        | Are           |   Cool          |      Yo         |
| ------------- |:-------------:| ---------------:|:----------------|
| col 3 is      | centered      |   right-aligned |    left-aligned |
| col 2 is      | ...           |     --          |      .....      |
| zebra stripes | .             |      ---        |       ...       |

There must be at least 3 dashes separating each header cell.
The outer pipes (|) are optional, and you don't need to make the
raw Markdown line up prettily. You can also use inline Markdown.

Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3

## Footnotes

Here is an inline note.^[Inlines notes are easier to write, since
you don't have to pick an identifier and move down to type the
note.]

Here is a footnote reference,[^1] and another.[^longnote]

[^1]: Here is the footnote.

[^longnote]: Here's one with multiple blocks.

    Subsequent paragraphs are indented to show that they
belong to the previous footnote.
