---
title:  "React Native & continuous deployment"
date:   2015-11-03 22:00:00
description: Exploring the idea of React Native and Amazon S3 to allow for a web style continuous deployment mobile application.
tags: [reactjs]
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2015-11-03T22:12:10+00:00"
---

Recently I have been exploring [React Native](https://facebook.github.io/react-native/), the tl;dr of React Native is pretty accurate.

> React Native enables you to build world-class application experiences on native platforms using a consistent developer experience based on JavaScript and React. The focus of React Native is on developer efficiency across all the platforms you care about

One evening I found the following [talk by Joe Stanton @ React Meetup London ](https://www.youtube.com/watch?v=9j5Uam6ORLI). The part of Joe's talk which I found most interesting was where he mentioned [continuous deployment](https://youtu.be/9j5Uam6ORLI?t=19m23s) for React Native applications. The summary of this is a developer can bring web style deployment to native mobile applications.

By using a continuous integration tool such as [CircleCI](circleci.com) or [Codeship](codeship.com), you can upload your bundled JS to an Amazon S3 bucket. Then in the `AppDelegate.m` you can download this file to the device and run the application.

## Will Apple allow this in the App Store?

Before answering this question it is worth noting that this isn't a new idea, [this article wrote by the guys at Meteor](http://info.meteor.com/blog/apple-hot-code-push-mobile) outlines a similar concept. But as the article points out, the [iOS Developer Program Agreement](https://developer.apple.com/programs/terms/ios/standard/ios_program_standard_agreement_20140909.pdf) states the following:

> 3.3.2 An Application may not download or install executable code. Interpreted code may only be used in an Application if all scripts, code, and interpreters are packaged in the Application and not downloaded. The only exception to the foregoing is scripts and code downloaded and run by Apple's builtin
WebKit framework, provided that such scripts and code do not change the primary purpose of the Application by providing features or functionality that are inconsistent with the intended and advertised purpose of the Application as submitted to the App Store.

Which means that there is no reason for Apple to reject these types of applications.

For more information, take a look at [Joe's GitHub repository](https://github.com/JoeStanton/london-react).

### Update

![Github Issue showing that the app was allowed in the app store](https://s3-eu-west-1.amazonaws.com/joshuahornby/Screenshot+2015-11-12+21.36.05.png "GH Issue")
