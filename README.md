# Bayes Babies
Learning _Bayesian Statistics_ by doing, the baby way :baby:

<img src="sessions/images/bayes-babies.png" alt="A Bayesian baby in the wild" width="275"/>

---

## Meet-up Tracker @ Newcastle University

| Meet-up 	| Date          	| Summary                                 	  | Status            	|
|---------	|---------------	|------------------------------------------	  |-------------------	|
| 1       	| 3 April 2019 	  | Overview and discussions of Bayesian Inference motivated by [the coin toss problem](https://pedroswits.github.io/bayes-babies/sessions/session-1.html)	|  :white_check_mark: 	|
| 2       	| 26 April 2019  	| Overview and discussions of Bayesian Inference motivated by [the coin toss problem](https://pedroswits.github.io/bayes-babies/sessions/session-1.html)  |  :white_check_mark:   |
| 3       	| 9 May 2019    	| Chapter 4 of the book (Likelihood) - Problem 4.1    |  :white_check_mark:  	|
| 4       	| 24 May 2019    	| Chapter 5 of the book (Prior) - Problem 5.1      	  |                     	|
| 5       	| -             	| -                                        	  |  -                 	|
| 6       	| -             	| -                                        	  |  -                 	|

---

## Who are we?

We're a group of PhD students at Newcastle University. Our goal is to learn _Bayesian Statistics_ from the ground up, as a team. "Learn by doing" is our motto.

## Learning resources

We follow the book [A Student's Guide to Bayesian Statistics](https://ben-lambert.com/a-students-guide-to-bayesian-statistics/) by Ben Lambert.

There are however other excellent resources to draw from!

## Meet-ups

The meet-ups usually consist of group discussion about selected problems from the book and concepts introduced earlier in the book.

Alternatively, members can propose custom study problems or small-size projects, that consist, for instance, of analysing a specific dataset. The problem and corresponding tasks should be described in a self-contained document. The tasks should specify what the user has to do, but **should not** tell the user how to do it! The person responsible for drafting the document usually has a concrete idea of what the solution to the problem is or what they want the users to take away from the session. Hence, the tasks should be designed in such a way that users arrive at the knowledge/solution by themselves (or are guided towards the solution), rather than being told. As no prior knowledge is assumed, don't be afraid to be verbose and use layman's language when drafting a **session document**.

### Organisation

Groups are responsible for organising the frequency of meet-ups, in which they share/discuss solutions to the problem and their understanding of the underlying theory/subject. The content of a session should (more often than not) be designed for a single meet-up. However, this is only a general guideline. Sessions can be split between several meet-ups depending on a variety of factors (time constraints, amount of preparation, etc).

The meet-ups should:

- Follow a clear set of goals/exercises (e.g. reviewing a problem from the book, doing usually described in a session document).
- Not last for hours on end (2 hours _max_ as a rule of thumb).
- (Optionally) be preceded/followed by preparatory/supplementary work.
- Start with an overview of the problem and input from each member of the group.
- Be moderated so that the individual learning interests of each member are preserved and the meet-up stays on course according to the **session** plan and learning goals.
- End with a summary of lessons learned, and a quick discussion on follow-up content and times for the next meet-up.


### Group moderator

The group moderator(s) is responsible for organising/coordinating the meet-ups and making sure that the **session** documents are drafted and ready before the meet-ups, in the agreed format and with adequate content (right amount of content, simple language, not too easy or too hard).


## Contributions

Everyone can contribute towards the pool of learning resources: custom problems/datasets, notes, session summaries, lessons learned, etc. GitHub offers the right platform for this. If you're not familiar with GitHub and pull requests, please check the [online documentation](https://help.github.com/en/articles/about-pull-requests). It boils down to the following steps:

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
