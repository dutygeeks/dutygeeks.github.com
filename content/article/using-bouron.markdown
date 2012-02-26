---
title: Using bouron
created_at: '2012-02-26T08:34:17+09:00'
kind: article
css: bourbon
---

Using Bourbon
=============

Bourbon is the useful Library of SASS Mixin created by [thoughtbot](http://thoughtbot.com/).

In my case, there's a few problem when I use box-shadow mixin. This is simple tutorial to use bourbon correctly with nanoc. (compact function did not work.) It seems not using sass filter has no way to "`-r bourbon/lib/bourbon.rb`" option.

    .
    |-bourbon/
    |
    |-content/
    | |
    | `stylesheet.sass
    |
    |-Rules
    |
    ...

So you should install bourbon gem first, next you should run `bourbon install` in nanoc's folder.
not into content's folder. and you will do `bourbon update` in same directory.

well, your sass file have to import bourbon. add the line `@import ../bourbon/bourbon` instead of `@import bourbon/bourbon` in `content/style.sass`.

Finally your add `Rules` to 

    require "bourbon" # maybe not need
    
    compile /stylesheet/ do
      filter :sass
    end

That's it!

<div class="box" id="bourbon-box">
  Box
</div>

**Note:** same way, if you don't need specify compass's option, you don't need to create compass's `config.rb` or `compass.rb`. (Please check out my repo. there's no `config.rb`)

<div class="box" id="box-shadow-custom-multiple">
  Box
</div>
