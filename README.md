# Developing Data Products

## Course Project Instructions

This peer assessed assignment has two parts. First, you will create a **Shiny** application and deploy it on Rstudio's servers. Second, you will use **Slidify** or **Rstudio Presenter** to prepare a reproducible pitch presentation about your application.

### Your Shiny Application

1. Write a **Shiny** application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application.
2. Deploy the application on Rstudio's Shiny server.
3. Share the application link by pasting it into the provided text box.
4. Share your `server.R` and `ui.R` code on **github**.

The **application must include** the following:

1. Some form of input (widget: textbox, radio button, checkbox, ...).
2. Some operation on the ui input in `server.R`,
3. Some reactive output displayed as a result of server calculations.
4. You must also include enough documentation so that a novice user could use your application.
5. The documentation should be at the Shiny website itself. Do not post to an external link.

The Shiny application in question is entirely up to you. However, if you're having trouble coming up with ideas, you could start from the simple prediction algorithm done in class and build a new algorithm on one of the R datasets packages. 

Please make the package simple for the end user, so that they don't need a lot of your prerequisite knowledge to evaluate your application. You should emphasize a simple project given the short time frame.

### Your Reproducible Pitch Presentation

OK, you've made your Shiny app, now it's time to make your pitch. You get 5 slides (inclusive of the title slide) to pitch a your app. You're going to create a web page using **Slidify** or **Rstudio Presenter** with an **html5 slide deck**.

Here's what you need:

1. 5 slides to pitch our idea done in Slidify or Rstudio Presenter.
2. Your presentation pushed to github or Rpubs.
3. A link to your github or Rpubs presentation pasted into the provided text box.

Your **presentation must satisfy** the following:

1. It must be done in Slidify or Rstudio Presenter.
2. It must be 5 pages.
3. It must be hosted on **github** or **Rpubs**.
4. It must contain some embedded R code that gets run when slidifying the document.

### Publishing Your Presentation

Notice to publish your Slidify presentation to **github** or **Rpubs**, there's the publish command. [This link](http://slidify.org/publish.html) outlines how to do it (it's one line). 

**Rstudio Presenter** has a button to publish directly to **Rpubs** [read more](https://support.rstudio.com/hc/en-us/articles/200714023-Displaying-and-Distributing-Presentations). 

:warning: If you are using Rpubs, put in the link to the presentation into the submission box as a `http://` link, not a `https://` link.

You can also publish using both formats to **github** manually using `gh-pages`, though your github branch must have a `.nojekyll` file and be on a branch names `gh-pages`. There's more on `gh-pages` [here](https://pages.github.com/), and there is a video lecture outlining how to do this.
