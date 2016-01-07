# Quiz 2

## Question 1

In the slidify YAML text. Changing the framework from 𝚒𝚘𝟸𝟶𝟷𝟸 to 𝚜𝚑𝚘𝚠𝚎𝚛 does what?

- It changes whether the document is self contained or requires being connected to the internet.
- It changes the html5 framework thus changing the style of the slides.
- It changes the ability to display mathjax javascript rendering.
- It changes nothing.

## Question 2

You wrote R code in a slidify document as follows

```r
fit <- lm(y ~ x1 + x2 + x3)
summary(fit)
```

If you want to hide the results of the CODEsummaryCODE statement (yet still have it run) what should you do?

- Add a 𝚎𝚌𝚑𝚘 = 𝙵𝙰𝙻𝚂𝙴 option in the {𝚛} call of the code chunk
- Comment out the command # 𝚜𝚞𝚖𝚖𝚊𝚛𝚢(𝚏𝚒𝚝)
- Comment the command as below but also use a bang symbol after the comment, as in #! 𝚜𝚞𝚖𝚖𝚊𝚛𝚢(𝚏𝚒𝚝)
- Add a 𝚛𝚎𝚜𝚞𝚕𝚝𝚜 = '𝚑𝚒𝚍𝚎' option in the {𝚛} call of the code chunk

## Question 3

You wrote R code in a slidify document as follows

```r
fit <- lm(y ~ x1 + x2 + x3)
summary(fit)
```

If you want to display the results, but not the actual code, what should you do?

- Add a 𝚎𝚌𝚑𝚘 = 𝙵𝙰𝙻𝚂𝙴 option in the {𝚛} call of the code chunk
- Comment the command, but use a bang symbol after the comment, as in #! 𝚜𝚞𝚖𝚖𝚊𝚛𝚢(𝚏𝚒𝚝)
- Comment out the command # 𝚜𝚞𝚖𝚖𝚊𝚛𝚢(𝚏𝚒𝚝)
- Add a 𝚎𝚌𝚑𝚘 = 𝚃𝚁𝚄𝙴option in the {𝚛} call of the code chunk

## Question 4

R studio presentation tool does what?

- Creates a presentation that can only be run from within Rstudio.
- Creates HTML5 slides using a generalized markdown format having an extention Rpres and creates reproducible presentations by embedding and running the R code from within the presentation document.
- Creates presentable R code from within presentations. However, it does not actually run the code.
- Creates a power point presentation from a generalized markdown format having an extension Rpres.

## Question 5

In Rstudio presenter, if you do not want the code to be evaluated, what option do you need to add to the `{𝚛}` options?

- `echo = FALSE`
- `results = 'hide'`
- `eval = FALSE`
- `run = FALSE`

## Question 6

When presenting data analysis to a broad audience, which of the following should be done?

- Do not include figure captions.
- Make the figure axes readable.
- Present results in the chronological order in which it was performed.
- Show every analysis and method that was done.
