---
layout: post
title: "The whys of reviewing"
date: 2015-04-16 15:42
comments: true
categories: general process reviewing
author: gustaf
---
The other week we talked about reviews, why do we do them, what do we look at,
and what do we get out of it.

What we didn't really discuss was the technical hows, these details come down to
your own style. Some people like seeing the changes in increments, in a commit
by commit view, some like to see the sum of changes in all their glory. This
might be another meeting and another blog post.

<!-- more -->

#The whys
The answer here might seem obvious, but it's nice to restate even the given
answers. Maybe we find out that our set of reasons is larger than we think.

##Being right
Correctness is the obvious answer, and it's a good one. I don't know about you, but here at Zimpler we are all fallible humans, and a
second set of eyes is always useful.

This is what I like to think of as the 'objective' part of the review. Either
your code does what it should do, or it doesn't. Either your tests cover the
edge cases or they don't.

The points we collected under this heading were:

- Does the code do what it's supposed to?
  - Does it follow the specification?
  - Do the tests test the right stuff?
- Does the code avoid breaking the rest of the system?
  - Will the performance be good enough?
  - Will the implementation break any expectations present in other parts of the
    code?
- Does the code directly contradict any planned changes?

If the code does not measure up on these points, it's pretty much going to get rejected, no
discussion.

I'd like to take an extra look at the final point: Planned Changes. Maybe you've
been locked in your office for a week working on this feature, maybe another
team is working on something you aren't really aware of. And maybe your
implementation will make things very hard for them.
When this happened, you really have to think about who gets priority, and how to
accommodate each other. You might not be wrong, but you might still have to
change.
In the end, any change will close some doors in the future while opening others.
The thing you want to prevent here is direct conflicts with planned changes, not
theoretical future strawmen. As a reviewer you should be reasonable in your
expectations of the implementers soothsaying capabilities and aware of your own.

## Being read
Even if your code is correct, it might not be obviously so. As I mentioned
we're all humans here, and we do complicated work, so any help is appreciated in
understanding each others.

This is a much more subjective side of the process. This is where you get into
heated discussions about names, line breaks and bikeshed colors, but it's still
important!

Some points we lined up under this heading:

- Help minimize technical debt.
- Check readability/grokability/styling.

Restating the above, even if you're right, your code might still be bad, the
mitigating factor is that you might not be aware of it. Your reviewer is
responsible for pointing out your nasty hacks, your convoluted logical
constructs and your ugly bikesheds.

For these kind of things, we won't immediately reject a story. Changes of this
kind are often relatively minor and clear, so bouncing them back and forth often
solves it in less time than restarting the story.

Quite often you even get to prove your reviewer wrong, which is always a nice
feeling.

## Becoming enlightened
So what do we get out of all this?

### Primary results
From the first part of the review, we get a working system, reasonable
performance and a clear way forward.
The code does its job without getting in the way of everyone else.

In the second part we make sure to pave the way for more general future
improvements. By reducing quirks, complications and unexpected behavior we make
it easier to get things done for future us.

### Gazing into the abyss
Apart from the reviews positive effects on the code, the review also improves
the reviewer, as well as the reviewee!

Reading code is extremely important, it gives you both a better understanding of
the code base you have, just from looking at parts your not currently working
with. It also works as a puzzle, where you have to understand a different
persons style of writing code.

### Talking to your friends
While reading code is important, discussing code is vital. By critiquing and
analyzing the code of your fellow programmers, you invite discussion on both
design choices and styling.

Discussion almost always leads to learning and that's our final fringe benefit
in the review process.

## Reviewing should be fun
Reviewing improves your company in multiple ways beyond just the code. So make
sure you do it well, be clear and honest in your review comments, and try to
learn as much as you can as you go along.

I'm planning to schedule another meeting to follow this up, on how to review
code, and to how to help others review yours. After that I hope to do another
blog post.
