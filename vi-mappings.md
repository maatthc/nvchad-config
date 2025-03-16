# Key mappings

WIP

## General
Leader: Space

A: Alt

C: Ctrl

S: Shift

.: Repeate last command

Themes: Leader + th 

Cheatsheet: Leader + ch

Main help: :h nvui

Show key mappings: Leader + w + K

Toggle relative line numbers: Leader + rn <<--

Open link in browser: gx

Open file under cursor: gf

Redo: Ctrl + r

## Text Objects
Defaults: w/W, s/S, p/P, t/T, (, ), {, }, ", ', `, [, ], <, >, /

### Programming
Function: af/if

#### Comment Blocks
vgc : to select
dgc : to delete it
cgc : to change it
ygc : to yank it
gcgc: to uncomment

#### Additionals (~30)
https://github.com/chrisgrieser/nvim-various-textobjs?tab=readme-ov-file#list-of-text-objects

ii/ai - Inner/around indentation
gG - Whole Buffer
i_/a_ - Line
L - url
in/an - Number
iD/aD - [[]]
ix/ax - html Attribute
i#/a# - cssColor
g; - Last change
...


## Stay in insert mode
In insert mode:

### Registers
Paste from clipboard: Ctrl + r + Register name
Paste whatever you entered in insert mode last time: Ctrl + a

### Filename Completion
https://github.com/hrsh7th/nvim-cmp
Just start typing the filename path! Starts with ./ if in the same directory
Even shows you the file content.

## Operations 
d/c/y = basic
4~ - Swap CASE: no motion
gu/gU - Lower/Upper case: yes motion
>/< - Indent
5+ - Go to column 0 of the 5th line below
4$ - Go to the 4th line end

## Registers (clipboard)
List: "
Select: "*/+/"/-/./0/1/2/3 ..
Paste: p
Whatever your entered in insert mode last time: Ctrl + r + .

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

## Lines
Go to the beginning of the line: 0

Go to the first character of the line: _

Go to the beginning of the previous line: -

Go to the end of the line: $

Add new line : o/O

Delete line: dd

Delete until the end of the line: D

Delete line and enter normal mode: S

Delete line and enter insert mode: cc

Change line: cc


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

Grep into files: Leader + fw

Open recent file: Leader + fo

File explorer: Leader + e / Ctrl + n

Copy whole file: Ctrl + c

Retrive file content: :r file.txt

Retrive command output: :r !ls

Save as new file: w file.txt

## Command mode
Enter OS command: !

Paste from clipboard: Ctrl + r +

Paste from yank: Ctrl + r + "/*/+/- (see :help registers)

Completion suggestions for open file: Ctrl + d

## Page navigation
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

Go to previous insert location: g;
Go to last insert location: g,

Go to next character occurrence: t + char / Previous: T + char

Go to the first character of the line: _

Go to the first character of the previous line: -

Next unmatched group: ]g / Previous: [g

Move cursor to the TOP of the screen: H

Move cursor to the MIDDLE of the screen: M

Move cursor to the BOTTOM of the screen: L

Move to the next/previous 2 letters match: f + char + char (Leap plugin) 

## Folding
Press zM to fold all initialy (and zR to unfold all) so the following commands work:

Toggle fold under cursor: za
Toggle all folds: zi
Open fold under cursor: zo
Close fold under cursor: zc

In case of problems, use zR/zM 

## Code
Format code: Leader + fm

Comment line: Leader + / - Better: gc4j or gcap

Jump de implementation: gi

Jump to definition: gd /gD 

Show references: gr

Jump to next syntax error: ]d / Previous: [d

Rover function signature: Shift + k

Copilot accept suggestion: Shift + Enter

Next method start: ]m / Previous: [m

Next method end: ]M / Previous: [M

Next misspelled word: ]s / Previous: [s

Next diagnostic: ]d / Previous: [d

Diagnose under the cursor: Ctrl + W + d

Code actions: Leader + ca

wrong -- Rename symbol: Leader + ra

## Git
View commit history: Leader + c + m

View git status: Leader + g + t

## Visual mode
Select: v

Select line: V

Select block: Ctrl + v
    Insert should use capital I, A, or c

Select all: ggVG

Invert selection start: o

Select all inside brackets: vi( / vi{ / vi[

Select all inside brackets including: va( / va{ / va[

Call command with selection: :!cmd

Increase numbers in selection: g <Ctrl + a>

## Globals
g/regex/vim command/ - Execute command on all lines that match the regex
g!/regex/d - delete all lines that NOT match the regex
g/where/s/what/with/g - Replace what with with on all lines that match 'where' 
g/The/normal A //Comment - Add '//Comment' to the end of all lines that match 'The'
g/The/normal I # - Add '#' to the beginning of all lines that match 'The'
g/.*/y - Yank all lines but you have access only to the last one ?
:1,5g/console/d matches the string "console" between lines 1 and 5 and deletes them.
:g/^$/,/./-1j - Join all lines between empty lines

## ArgLists
Source: http://www.vimgenius.com/lessons/vim-arglist

Arglist is a feature of Vim that lets you specify a set of files then run commands on those files.


    :arg to show the files in your current arglist
    :argdo to run a command on your arglist
    :argadd or :arga to add files to your arglist
    :argdelete or :argd to remove files from your arglist
    :argdo update to save all changes to your arglist
    :argdo undo to undo changes to your arglist
E.g:
```
:argdo %s/sam/bob/g
```
