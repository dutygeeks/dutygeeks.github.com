---
title: Optipng Filter
created_at: '2012-01-22T11:18:27+09:00'
kind: article
---

Optipng Filter
==============

today, i added optipng filter. this is the coolest way i guess.

[gist: 1655310](https://gist.github.com/1655310)

in this case, i added sample file and check their file sizes...

![before](/2011-01-22/1.png)
![before](/2011-01-22/2.png)
before => 88,152 bytes

![after](/2011-01-22/3.png)
![after](/2011-01-22/4.png)
**after => 45,715 bytes**

newest nanoc can compile once and skip after.

usage is adding `filter :optipng, :level => 2`(between 0 and 7) to your `Rules` file.

but i don't add filtering binaries, so you should do that...

    if item.binary?
      case item[:extension]
      when 'png'
        filter :optipng, :level => 2
      end
    end

this trick is from [guides](http://nanoc.stoneship.org/docs/6-guides/#using-filters-based-on-file-extensions)

hopefully enjoy!
