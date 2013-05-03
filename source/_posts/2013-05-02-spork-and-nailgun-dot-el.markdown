---
layout: post
title: "spork_and_nailgun.el"
date: 2013-05-02 23:31
comments: true
categories: emacs lisp spork nailgun
---

We recently made the shift to TorqueBox here at PugglePay, and that
meant moving from MRI to JRuby. I order to cope with the slow start-up
induced by the JVM we started using spork and nailgun for running our
tests.

[Spork](https://github.com/sporkrb/spork) preloads instances of your
application for you to have faster startup for your tests. And nailgun
(wich comes with JRuby) is a lower level tool to have jvm instances
ready to go.

Both of them stay alive between test runs and can get "corrupted". You
also need to restart spork every time you change something that is
outside what it reloads between each test (blueprints for example in
our case).

So we (eq me and Jean-Louis) decided to spend an hour to make this a
bit easier. With the answer to all technical problems!

<!-- more -->

###[An Emacs Plugin](https://github.com/PugglePay/spork-and-nailgun.el)

So install it (with [el-get](https://github.com/dimitri/el-get) perhaps) and bind a key (ex `C-c C-l`) to 'sang-start-all and run it.

* It will kill any running instances of spork and nailgun you have
  running (by looking up the port they are listening to),
* Jump to the root of the project your currently editing in and
  activate the right rvm env,
* Start upp Spork and nailgun in separate buffers.

The spork buffer will popup and it can have some useful information if
you have some errors.

<a href="http://imgur.com/RozzIIv"><img src="http://i.imgur.com/RozzIIv.png" title="Hosted by imgur.com"/></a>

Now your ready to run your tests with [`C-c , v`](https://github.com/pezra/rspec-mode)

This plugin works well for our workflow so [try it out](https://github.com/PugglePay/spork-and-nailgun.el) yourself.

{% render_partial sign/patrik.md %}
