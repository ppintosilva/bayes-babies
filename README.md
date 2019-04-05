# Bayes Babies
Learning _Bayesian Statistics_ by doing, the baby way

<img src="sessions/images/bayes-babies.png" alt="A Bayesian baby in the wild" width="275"/>

---

## Meet-up Tracker @ Newcastle University

| Meet-up 	| Date          	| Session Document                                 	  | Status            	|
|---------	|---------------	|------------------------------------------	  |-------------------	|
| 1       	| 3 April 2019 	| [ Session 1: Of Tosses and Coins](https://pedroswits.github.io/bayes-babies/sessions/session-1.html) 	|  :white_check_mark: 	|
| 2       	| 24 April 2019  	| [ Session 1: Of Tosses and Coins](https://pedroswits.github.io/bayes-babies/sessions/session-1.html) (continued)                               	  |  :clock1:                  	|
| 3       	| -             	| -                                        	  |  -                 	|
| 4       	| -             	| -                                        	  |  -                 	|
| 5       	| -             	| -                                        	  |  -                 	|

---

## Who are the Bayes Babies?

We're a group of PhD students at Newcastle University (:uk:) . Our goal is to learn _Bayesian Statistics_ from the ground up, as a team. "Learn by doing" and "show rather than simply tell" are our mottos.


## Learning material and meet-ups

There are a lot of good references and reading+learning material for _Bayesian Statistics_. Now more than ever. We will borrow material from such sources and adapt it to guide our learning process and motivate our meet-ups.

A **session** document describes a self-contained small-size project designed to guide learning and group discussion. Groups are responsible for organising the frequency of meet-ups, in which they share/discuss solutions to the problem and their understanding of the underlying theory/subject. The content of a session should (more often than not) be designed for a single meet-up. However, this is only a general guideline. Sessions can be split between several meet-ups depending on a variety of factors (time constraints, amount of preparation, etc).

The tasks should specify what the user has to do, but **should not** tell the user how to do it! The person or persons responsible for drafting the **session document** usually have a concrete idea of what the solution to the problem is or what they want the users to take away from the session. Hence, the tasks should be designed in such a way that users arrive at the knowledge/solution by themselves, rather than being told. As no prior knowledge is assumed, don't be afraid to be verbose and use layman's language when drafting a **session document**.

### The session document should

- Highlight the **learning goals** for the session.
- Propose a **motivating** problem.
- Identify a sequence of **tasks** that should be performed in order to solve the problem.
- Provide relevant references and bibliography.
- Provide hints and tips if applicable.

#### The meet-ups should

- Follow a clear set of goals/exercises (usually described in a session document).
- Not last for hours on end (2 hours _max_ as a rule of thumb).
- (Optionally) be preceded/followed by preparatory/supplmenetary work.
- Start with an overview of the problem and input from each member of the group.
- Be moderated so that the individual learning interests of each member are preserved and the meet-up stays on course according to the **session** plan and learning goals.
- End with a summary of lessons learned, and a quick discussion on follow-up content and times for the next meet-up.

### Group moderator

The group moderator(s) is responsible for organising/coordinating the meet-ups and making sure that the **session** documents are drafted and ready before the meet-ups, in the agreed format and with adequate content (right amount of content, simple language, not too easy or too hard).


## Contributions

Everyone can contribute towards the drafting of session documents and related content (e.g. summary of lessons learned at the end of each session). GitHub offers the right platform for this. If you're not familiar with GitHub and pull requests, please check the [online documentation](https://help.github.com/en/articles/about-pull-requests). It boils down to the following steps:

1. Fork this repository
2. Make commits and push them to the master branch (or other branch) of your fork.
3. Create a pull request

We'll use issues and pull requests to discuss, draft and add material.

## Build Environment

[asciidoctor](!https://asciidoctor.org/) is used to build the html files via the `Makefile`:

```
make html
```

This will build all the `*.adoc` files on the **sessions** directory into the corresponding html files on the **build/sessions** directory. You can them view the resulting html files on your favourite browser.

We'll also publish these on the web via **github-pages**.

## Contact

Mailing list: bayes-babies@newcastle.ac.uk

Moderator: p.pinto-da-silva2@newcastle.ac.uk
