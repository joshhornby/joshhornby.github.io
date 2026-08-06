---
title:  "Using the JSON API spec in a Laravel API"
date:   2016-03-01 11:50:00
description: Using Laravel to build an API that is compliant with the JSON API spec.
tags: [laravel, php] 
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2016-03-01T23:49:00+00:00"
---

*This blog post assumes you are using [Laravel](http://laravel.com) & [Dingo API](https://github.com/dingo/api).*

The [JSON API spec](http://jsonapi.org/) sets out how a JSON response should be shaped. Follow it and you can use off-the-shelf client tooling instead of writing your own.

To add the JSON API spec to your API create a service provider called `JSONApiServiceProvider` and add the following in your register function:

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

Next add `JSONApiServiceProvider` to the provider array in `config/app.php`.


This will use the built in `JsonApiSerializer` from [Fractal](http://fractal.thephpleague.com). This makes using the JSON API Spec as simple as calling a transformer.

In a controller add the following:

```php

public function index()
{
    $posts = Post::all();

    return $this->response->collection($posts, new PostTransformer(), [ 'key' => "posts" ]);
}
```
The final step is to create a Transformer. A transformer takes data in one format and outputs it in another. It sits between your database and your response, so you can map the same records to any output format. Here, that format is the JSON API spec.

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

The code above produces the JSON below, which is valid against the JSON API spec.

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
