---
layout: post
title: "spork_and_nailgun.el"
date: 2013-05-02 23:12
comments: true
categories: emacs lisp spork nailgun
---

Whe resently made the shift here att pugglepay to torquebox and with that JRuby.
So with that we started using spork and nailgun to run our tests.

Spork preloads instances of your application for you to have faster
startup for your tests. And nailgun is a lower level tool to have jvm
instances ready to go.

Boat application stayes alive betwean test runs. And can theare for
get "currupted". You also need to restart spork every time you change
something that is outside what it reloades betwen each test run.
Witch you normaly want to keep small to have snappy test start upp.
(Well as snappy as you can get on the jvm :P)

So we (EQ me + Jean-Louis) desided to make this a bit easier with the
answer to all the worlds problem! Anather emacs pluggin
[github: https://github.com/PugglePay/spork-and-nailgun.el]
