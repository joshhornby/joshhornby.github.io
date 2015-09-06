---
title:  "ES6 - My favourite parts"
date:   2015-10-04 10:18:00
description: A look at some of the new features of ES6
---

## Destructuring

Destructuring makes it easier to work with objects and arrays in JavaScript. Using a pattern syntax similar to object and array literals, we can poke into data structures and pick out the information we want into variables. This is best explained with examples:


{% highlight javascript %}
// object pattern matching
let {lName, fName} = {fName: 'John', age: 15, lName: 'Doe'};

// array pattern matching
let [first, second, third] = [8, 4, 100, -5, 20];

// output: Doe, John
console.log(lName + ', '+ fName);

// output: 100, 4, 8
console.log(third, second, first);
{% endhighlight %}


## Template Strings

A simple example showing the new template string functionality can be found in a basic string concatenation example:

{% highlight javascript %}
let name = "Josh";
console.log(`Hey, ${name}!`); // Hey, Josh!
{% endhighlight %}

Template Strings bring many important capabilities to JavaScript. These include better ways to do string & expression interpolation, multiline strings and the ability to create your own DSLs.

## Fat Arrows

Fat arrows are increasingly becoming one of my favorite ES6 additions. Fat arrows do away with having to bind 'this' two functions and also make it clearer for the reader that the code block inherits scope.

{% highlight javascript %}
// ES5
function() { console.log('ES5') }.bind(this);

// ES6
() => { console.log('ES6') };  
{% endhighlight %}
