---
title:  "Building a JSON-Spec API in Laravel and an Ember.js Single Page Application"
date:   2016-02-18 11:50:00
description: Foo.
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: 2015-02-18T23:49:00+00:00
---

Laravel is a PHP framework that deals with a lot of the boilerplate, plumbing and structure of a PHP application so we can concentrate on building out the important stuff for our specific application.

A Front-End framework, such as Ember or Angular, provides much of the structure and components you will need to build a Single-Page Application.

## Setting up the Laravel API

```bash
composer create-project --prefer-dist laravel/laravel my-json-spec-api
```
Once you have Laravel installed its time to install a package called [Dingo API](https://github.com/dingo/api/). A detailed installation guide can be found on [their wiki](https://github.com/dingo/api/wiki/Installation).

Once you have successfully installed Dingo you can begin to configure your API to output JSON which follows the JSON API Spec. Add a service provider called `JSONApiServiceProvider` and add the following in your register function:

```php
$this->app->bind('League\Fractal\Manager', function($app) {
    $fractal = new Manager();
    $serializer = new JsonApiSerializer();
    $fractal->setSerializer($serializer);

    return $fractal;
});

$this->app->bind('Dingo\Api\Transformer\Adapter\Fractal', function($app) {
    $fractal = $app->make('\League\Fractal\Manager');

    return new Fractal($fractal);
});
```

This will use the built in `JsonApiSerializer` from [Fractal](http://fractal.thephpleague.com). This makes makes using the JSON API Spec as simple as calling a transformer.

In a controller add the following:

```php

public function index()
{
    $posts = Post::all();

    return $this->response->collection($posts, new PostTransformer(), [ 'key' => "posts" ]);
}
```
The final step is to create a Transformer, in a nut shell a transformer takes the data in one format and outputs it to another. It provides an abstraction layer over the database which allows you to map the data to any output, in our case the JSON API Spec.

> Transformers are classes, or anonymous functions, which are responsible for taking one instance of the resource data and converting it to a basic array. This process is done to obfuscate your data store, avoiding Object-relational impedance mismatch and allowing you to even glue various elements together from different data stores if you wish. The data is taken from these complex data store(s) and made into a format that is more manageable, and ready to be Serialized.

```php
class PostTransformer extends \Fractal\TransformerAbstract
{
    public function transform(Post $post)
    {
        return [
            'id' => $post->id,
            'title' => $post->title,
            'body' => $post->body,
        ];
    }
}
```

The code above will provide the JSON you can see below, perfectly formed JSON API spec valid JSON!

```json
{
    "data": [
        {
            "type": "posts",
            "id": "1",
            "attributes": {
                "title": "This is a title",
                "body": "This is a body"
            }
        }
    ]
}
```

## Using this in Ember

To get going with Ember CLI, first you will need to install Node. This will vary depending on your operating system. I’m running OS X, and so I usually install Node via [Homebrew](http://brew.sh/).

```bash
npm install -g ember-cli
npm install -g bower
```

Next you can create your Ember application, I like to keep my API code and SPA code in the same project, so I add a folder inside my `my-json-spec-api` project.

```bash
ember new my-new-app
```
