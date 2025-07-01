---
title:  "Global query parameters with Ember"
date:   2017-06-10 19:00:00
description: Using Ember computed properties to handle global query parameters
tags: [emberjs]
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: 2017-06-11 T19:00:00+01:00
---

Recently while using [Ember.js](https://www.emberjs.com/) I needed to use global query parameters across routes. For example, navigating from `/users?start=2017-01-01` to `/users/1?start=2017-01-01` I wanted to make sure the `start` filter was applied across routes.

This can be achieved by using [services](https://guides.emberjs.com/v2.13.0/applications/services/) and computed properties.

As you can see in the example below, the `date.js` service will handle the state across the lifetime of the application.

```js
// app/services/date.js
import Ember from 'ember';
import moment from 'moment';

export default Ember.Service.extend({
  start: moment().startOf('day').format('YYYY-MM-DD'),
  end: moment().endOf('day').format('YYYY-MM-DD'),

  setDates(dates){
    this.set('start', dates.dateFrom);
    this.set('end', dates.dateTo);
  }
});
```

Then in any controller where you wish to consume the query parameters, you can inject the service and use the `alias` computed property. This will create a new property that is an alias for in this the `date.start` property.

```js
// app/controller/users.js
import Ember from 'ember';

export default Ember.Controller.extend({
  date: Ember.inject.service(),

  dateFrom: Ember.computed.alias('date.start'),
  dateTo: Ember.computed.alias('date.from'),

  actions: {
    update(dateFrom, dateTo) {
      this.get('date').setDates({ dateFrom, dateTo });
    },
  },

  queryParams: ["dateFrom", "dateTo"]
});
```

When the `update` action is called, the service updates the properties on the date service.
