---
title:  "Lessons learned from building an app with React.js"
date:   2015-10-12 11:50:00
description: An in depth look at flux, React.js and data fetching.
tags: [reactjs]
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: 2015-10-12T23:49:00+00:00
---

A brief overview of what I have learnt when using React.js on a modern web applciation.

## The Stack

-   [React.js](https://facebook.github.io/react/)
-   [Alt - Isomorphic flux implementation](http://alt.js.org)
-   [Node.js](https://nodejs.org/en/)
-   [ES6 JavaScript](https://github.com/lukehoban/es6features)
-   [Webpack](https://webpack.github.io/)

![JavaScript Everywhere](https://media.licdn.com/mpr/mpr/shrinknp_800_800/p/5/005/0b6/1c4/199aff3.jpg)

I'd also like to extend thanks to [Ken Ding](https://github.com/choonkending) and his [brilliant boilerplate](https://github.com/choonkending/react-webpack-node) application.

## Why React?

This is a very good question, after some failed experiments using [ember.js](http://emberjs.com/) React seemed the next logical choice. A major  plus point was the fact that we could render both the client and server in JavaScript, something which is kown as [universal](https://medium.com/@mjackson/universal-javascript-4761051b7ae9) JavaScript.

## Thinking dumb

The biggest question we had when writing our React application was, *'what is the correct way to write compontents?'* The answer came from the fantastic [Dan Abramov](https://twitter.com/dan_abramov) and his article on [smart and dumb components](https://medium.com/@dan_abramov/smart-and-dumb-components-7ca2f9a7c7d0)

We then began a refactor and splitting most of our components into data fetching smart components and prop rendering dump components. This is where we found [AltContainer](http://alt.js.org/docs/components/altContainer/) extremely useful, a higher-order container component but also known as [the swiss army knife of the alt world](https://github.com/goatslacker/alt/blob/master/components/AltContainer.js). This allowed us to remove a lot of the alt.js boilerplate code and focus on writing simple, clean and maintainable JavaScript.

## Universal JS can be painful

Due to the server side rendering aspect of Universal JS this can lead to a few headaches along the way, one of our biggest was when we wanted to use external libraries, for example using the React Highcharts package [we had issues](https://github.com/kirjs/react-highcharts/issues/12) with getting this package to work in a server side application. Although this isn't a reason not to build Universal JS apps its something to take on board, and be prepared for the odd hacky fix.

## The Future

-   Look at using [flow](http://flowtype.org/) on the node API.
-   Explore [immutable-js](https://facebook.github.io/immutable-js/)
-   It seems everyone in the React community is talking about [Redux](https://github.com/rackt/redux)
-   Data fetching 2.0 [Relay.js](http://facebook.github.io/react/blog/2015/05/01/graphql-introduction.html)/[GraphQL](http://facebook.github.io/react/blog/2015/08/11/relay-technical-preview.html)
