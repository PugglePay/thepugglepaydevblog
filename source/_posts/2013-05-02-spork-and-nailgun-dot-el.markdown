---
layout: post
title: "spork_and_nailgun.el"
date: 2013-05-02 23:31
comments: true
categories: emacs lisp spork nailgun
---

We recently made the shift here at pugglepay to torquebox and with that JRuby. So with that we started using spork and nailgun to run our tests.

[Spork](https://github.com/sporkrb/spork) preloads instances of your application for you to have faster startup for your tests. And nailgun (wich comes with jruby) is a lower level tool to have jvm instances ready to go.

Both of them stayes alive between test runs and can get “corrupted”. You also need to restart spork every time you change something that is outside what it reloads between each test (blueprints for example in our case).

So we (eq me and Jean-Louis) decided to spend a hour to make this a bit easier.
With the answer to all technical problems!
###[A emacs plugin](https://github.com/PugglePay/spork-and-nailgun.el)

So install it (with [el-get](https://github.com/dimitri/el-get) perhaps) and bind a key (ex C-c C-l) to 'sang-start-all and run it.

* It will kill any running instances of spork and nailgun you have running (by what port there listening to)
* Jump to the root of the project your currently editing in and activate your the right rvm env
* Start upp Spork and nailgun in separate buffers.

The spork buffer will popup and it can have some useful information if you have some errors.

<a href="http://imgur.com/RozzIIv"><img src="http://i.imgur.com/RozzIIv.png" title="Hosted by imgur.com"/></a>

Now your ready to run your tests [(C-c , v)](https://github.com/pezra/rspec-mode)

This plugin works well for our workflow so [try it out](https://github.com/PugglePay/spork-and-nailgun.el) your self.

{% render_partial sing/patrik.markdown %}
