---
title:  "Immutable and namespaced CSS made easy"
date:   2016-02-02 20:00:00
description: todo
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: 2016-02-02GMT20:00:00+00:00
---

Two of my favourite CSS blog posts are written by Harry Roberts, [More Transparent UI Code with Namespaces](http://csswizardry.com/2015/03/more-transparent-ui-code-with-namespaces/) and [Immutable CSS](http://csswizardry.com/2015/03/immutable-css/).

A little package called [bem-constructor](https://github.com/danielguillan/bem-constructor) takes both ideas from Harry's blogs and includes them in a fantastic mixin. Bem-constructor makes writing [object oriented css](https://www.smashingmagazine.com/2011/12/an-introduction-to-object-oriented-css-oocss/) much simpler and wraps the logic in an elegant syntax. Take a look at this rather contrived example:

```scss
@include object('media') {
  display: block;
  @include element('image') {
    border: 1px solid black;
    @include modifier('rounded-corners') {
      border-radius: 5px;
    }
  }
}
```

This will generate the following CSS:

```css
.o-media {
  display: block; }
  .o-media__image {
    border: 1px solid black; }
    .o-media__image--rounded-corners {
      border-radius: 5px; }
```
By enforcing a consistent and programatic way of defining objects it ensures a more structured, robust and secure object codebase that is easy to understand and maintain. Objects defined using [bem-constructor](https://github.com/danielguillan/bem-constructor) are impossible to modify and reassign by mistake or omission.
