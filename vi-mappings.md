# NvChad Key mappings (and others)

Continuously under construction..

[Neovim Quick Reference](https://neovim.io/doc/user/quickref.html)

## General

Leader: **Space**

Repeat last command or motion: **.** (dot)

Themes: **Leader + th**

Cheat sheet: **Leader + ch**

Main help: **:h nvui**

Show key mappings: **Leader + w + K**

Toggle relative line numbers: **Leader + rn**

Open link in browser: **gx**

Open file under cursor: **gf**

Redo: **Ctrl + r**

Split buffer horizontally: **Ctrl + w + v**

## Surrounding - [Plugin](https://github.com/kylechui/nvim-surround/blob/main/doc/nvim-surround.txt)

Manipulates surrounding left/right delimiter pairs, e.g. parentheses, quotes, HTML tags, and more.\
\
Make sure to type FAST the combinations *ys/ds/cs/yss* or it won't work. Repeatable with . (dot).\
Can be used with tags (**t**), including *html*.\
When changing or removing, the cursor most be placed between surroundings.\
\
Add surrounding: **ys + motion + surrounding\
**Surrounding a line: **yss**

Replacing surrounding: **cs + old surrounding + new**\
**q** is aliased to : **\`**, **'** and **"** - use 'q' as the previous character when replacing, e.g: "test" -\> 'test' : **csq'**

Delete surrounding: **ds + surrounding**

### Examples

The **\*** represents the position of the cursor

```         
surr*ound_words             ysiw)           (surround_words)
*make strings               ys$"            "make strings"
[delete ar*ound me!]        ds]             delete around me!
remove <b>HTML t*ags</b>    dst             remove HTML tags
'change quot*es'            csq"            "change quotes"
"test"                      dsq             test
<b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
Title                       ysiwtH1 id='test'   <H1 id='test'>Title</H1>
delete(functi*on calls)     dsf             function calls
arg*s                       ysiwffunc       func(args)
f*unc_name(a, b, x)         dsf             a, b, x
f*unc_name(a, b, x)         csfnew_name     new_name(a, b, x)
```

## Text Objects

Defaults: w/W, s/S, p/P, t/T, (, ), {, }, ", ', \`, [, ], \<, \>, /

### Programming

Function: af/if

#### Comment Blocks

vgc : to select dgc : to delete it cgc : to change it ygc : to yank it gcgc: to uncomment

#### Additional

<https://github.com/chrisgrieser/nvim-various-textobjs?tab=readme-ov-file#list-of-text-objects>

indentation ii, ai, aI, (iI) restOfIndentation R greedyOuterIndentation ag/ig subword iS/aS toNextClosingBracket C toNextQuotationMark Q anyQuote iq/aq anyBracket io/ao restOfParagraph r entireBuffer gG nearEoL n lineCharacterwise i\_/a\_ column \| value iv/av key ik/ak url L number in/an diagnostic ! closedFold iz/az chainMember im/am visibleInWindow gw restOfWindow gW lastChange g; mdLink il/al mdEmphasis ie/ae mdFencedCodeBlock iC/aC cssSelector ic/ac cssColor i#/a# htmlAttribute ix/ax doubleSquareBrackets iD/aD shellPipe iP/aP pyTripleQuotes iy/ay notebookCell iN/aN

## Stay in insert mode

In insert mode: <https://neovim.io/doc/user/quickref.html#Q_ss>

### Registers

Paste from clipboard: Ctrl + r + Register name Paste whatever you entered in insert mode last time: Ctrl + a

### Filename Completion

Name of the open file: echo bufname("%") <https://github.com/hrsh7th/nvim-cmp> Just start typing the filename path! Starts with ./ if in the same directory Even shows you the file content.

## Operations

d/c/y = basic 4\~ - Swap CASE: no motion gu/gU - Lower/Upper case: yes motion \>/\< - Indent 5+ - Go to column 0 of the 5th line below 4\$ - Go to the 4th line end

## Which Key

<https://github.com/folke/which-key.nvim>

### Registers (clipboard)

List: " Select: "\*/+/"/-/./0/1/2/3 .. Paste: p Whatever your entered in insert mode last time: Ctrl + r + . Replace current line: Vp Deleting_a_line_without_copying_it:/ttps://www.reddit.com/r/vim/comments/ilp32r/deleting_a_line_without_copying_it/

### Marks (bookmarks)

List: ' Select: '' / '" / '[ / '] / '. / 'O .. Jump back and forth: ''

## Characters

Go to next character occurrence: f + 2chars / Previous: F + 2chars

## Words

Go to next word: w/W

Go to previous word: b/B

Go to end of word: e/E

Go to end of previous word: ge

Delete the rest of the word: dw

Change the rest of the word: cw

Replace word inside: ciw

Replace to the end of word: ce

### Spelling

Go to next misspelled word: ]s / Previous: [s View spelling suggestions: z= Select the number of the suggestions To repeat the same correction on all the same misspelled words: spellrepall Add word to dictionary: zg

## Lines

Go to the beginning of the line: 0

Go to the first character of the line: \_

Go to the beginning of the previous line: -

Go to the end of the line: \$

Add new line : o/O

Delete line: dd

Delete until the end of the line: D

Delete line and enter normal mode: S

Delete line and enter insert mode: cc

Change line: cc

## Paragraphs

Go to the beginning of the paragraph: { Go to the end of the paragraph: } Wrap long lines: Vgq

## Buffers

New empty buffer: Leader + b

Close buffer: Leader + x

Next buffer: Tab

Previous buffer: S-Tab

## Windows

Open window: Ctrl + w + v/h

Close window: Ctrl + w + q

Navigate windows: Ctrl + j/k/h/l

## Tabs

Go to next tab: gt

Go to previous tab: gT

Open current window in new tab: Ctrl + w + T

Open terminal in a new tab: :tab ter

## Terminals

Open terminal: Leader + v/h

Enter normal mode: Ctrl + x

Enter insert mode: i

Enter visual mode: v

Open terminal in a new tab: :tab ter

## Files

Search files: Leader + ff

Search for word under cursor: \* \<\<\<----

Grep into files: Leader + fw

Open recent file: Leader + fo

File explorer: Leader + e / Ctrl + n

Copy whole file: Ctrl + c

Save file: Crtl + s

Retrive file content: :r file.txt

Retrive command output: :r !ls

Save as new file: w file.txt

## Command mode

Enter OS command: !

Paste from clipboard: Ctrl + r +

Paste from yank: Ctrl + r + "/\*/+/- (see :help registers)

Completion suggestions for open file: Ctrl + d

## Page navigation

zt: Scroll the current line to the top of the windows zz: Scroll the current line to the middle of the Windows zb: Scroll the current line to the bottom of the windows

Scroll up: Ctrl + b

Scroll up half page: Ctrl + u

Scroll down: Ctrl + f

Scroll down half page: Ctrl + d

Go to top: gg

Go to bottom: G

Go the the next/previous blank line: { / }

Go back to previous location: Ctrl + o

Go back to next location: Ctrl + i

Go back to last location on the same file: '' (see :help mark-motions)

Go to previous insert location: g; Go to last insert location: g,

Go to next character occurrence: t + char / Previous: T + char

Go to the first character of the line: \_

Go to the first character of the previous line: -

Next unmatched group: ]g / Previous: [g

Move cursor to the TOP of the screen: H

Move cursor to the MIDDLE of the screen: M

Move cursor to the BOTTOM of the screen: L

Move to the next/previous 2 letters match: f + char + char (Leap plugin)

## Folding

Press zM to fold all initialy (and zR to unfold all) so the following commands work:

Fold all: zM Unfold all: zR Toggle fold under cursor: za Toggle all folds: zi Open fold under cursor: zo Close fold under cursor: zc

In case of problems, use zR/zM

## Code

Format code: Leader + fm
Disable auto format for current buffer, temporarily: Leader + tF

Comment line: Leader + / - Better: gc4j or gcap

Jump de implementation: gi

Jump to definition: gd /gD

Show references: gr

Jump to next syntax error: ]d / Previous: [d

Rover function documentation: Shift + k

Copilot accept suggestion: Shift + Enter

Next method start: ]m / Previous: [m

Next method end: ]M / Previous: [M

Next misspelled word: ]s / Previous: [s

Next diagnostic: ]d / Previous: [d

Diagnose under the cursor: Ctrl + W + d

Code actions: Leader + ca

Wrong -- Rename symbol: Leader + ra

## Git

View commit history: Leader + c + m

View git status: Leader + g + t

Line blame: Gitsigns toggle_current_line_blame

Diff: Gitsigns diffthis

## Visual mode

Select: v

Select line: V

Select block: Ctrl + v Insert should use capital I, A, or c

Select all: ggVG

Invert selection start: o

Select all inside brackets: vi( / vi{ / vi[

Select all inside brackets including: va( / va{ / va[

Call command with selection: :!cmd

Increase numbers in selection: g \<Ctrl + a\>

## Globals

g/regex/vim command/ - Execute command on all lines that match the regex g!/regex/d - delete all lines that NOT match the regex g/where/s/what/with/g - Replace what with with on all lines that match 'where' g/The/normal A //Comment - Add '//Comment' to the end of all lines that match 'The' g/The/normal I \# - Add '\#' to the beginning of all lines that match 'The' g/.\*/y - Yank all lines but you have access only to the last one ? :1,5g/console/d matches the string "console" between lines 1 and 5 and deletes them. :1,+5g/console/d matches 5 lines starting from line 1 and deletes them. :g/\^\$/,/./-1j - Join all lines between empty lines

## ArgLists

Source: <http://www.vimgenius.com/lessons/vim-arglist>

Arglist is a feature of Vim that lets you specify a set of files then run commands on those files.

```         
:arg to show the files in your current arglist
:argdo to run a command on your arglist
:argadd or :arga to add files to your arglist
:argdelete or :argd to remove files from your arglist
:argdo update to save all changes to your arglist
:argdo undo to undo changes to your arglist
```

E.g:

```         
:argdo %s/sam/bob/g
```
