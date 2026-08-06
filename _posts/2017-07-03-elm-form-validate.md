---
title: Using elm-form-validate
date: 2017-07-03 11:00:00
description: "Using elm-form-validate form validate to build composable, reusable form validation in Elm."
tags: [elm]
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-08-02T08:00:00+00:00"
---

Writing another form is easy. The work is in the validation, the user feedback, and stopping the whole thing turning into a pile of nested conditionals.

Elm helps, because it pushes you to make impossible states impossible. But plain Elm form validation gets verbose fast. I wrote [`elm-form-validate`](https://package.elm-lang.org/packages/joshhornby/elm-form-validate/latest/) to keep the validation composable.

## Why elm-form-validate?

A lot of Elm form tutorials stop at "here's a simple input with `Maybe String` for an error". That doesn't scale. What happens when you want reusable rules, custom error messages, or need to add cross-field validation later? `elm-form-validate` lets you build complex forms out of small, predictable pieces.

The idea is to compose small validators and push the errors up into the type system.

## Getting started

Here's a login form with email and password. Both are required, and the password needs at least 8 characters.

### The model

You want your model to capture both the raw values and the validated form state:

```elm
type alias Model =
    { email : String
    , password : String
    , formState : Validate.State
    }
```

### Validation rules as composable pieces

Define a rule once and reuse it everywhere:

```elm
emailRules : Validator String
emailRules =
    Validate.all
        [ Validate.required "Email is required"
        , Validate.email "Enter a valid email"
        ]

passwordRules : Validator String
passwordRules =
    Validate.all
        [ Validate.required "Password is required"
        , Validate.minLength 8 "Password must be at least 8 characters"
        ]
```

You can now build up a validator for your entire form:

```elm
loginForm : Validator { email : String, password : String }
loginForm =
    Validate.record
        [ ( "email", .email, emailRules )
        , ( "password", .password, passwordRules )
        ]
```

Each field can be composed and tested on its own, and you still validate the whole form in one go.

### Validating on submit

Handle validation when the user submits:

```elm
type Msg
    = EmailChanged String
    | PasswordChanged String
    | Submit
    | GotValidation (Result (List Validate.Error) { email : String, password : String })

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        EmailChanged val ->
            ( { model | email = val }, Cmd.none )

        PasswordChanged val ->
            ( { model | password = val }, Cmd.none )

        Submit ->
            let
                result =
                    Validate.run loginForm { email = model.email, password = model.password }
            in
            case result of
                Ok _ ->
                    -- Do whatever: send to backend, show success
                    ( { model | formState = Validate.Valid }, Cmd.none )

                Err errors ->
                    ( { model | formState = Validate.Errors errors }, Cmd.none )

        GotValidation _ ->
            ( model, Cmd.none )
```

You can then render validation feedback in your view by pattern matching on `model.formState`.

### Handling validation errors in the view

Show the errors for the field the user is looking at, rather than dumping the whole list:

```elm
view : Model -> Html Msg
view model =
    div []
        [ input
            [ placeholder "Email"
            , value model.email
            , onInput EmailChanged
            ]
            []
        , errorView "email" model.formState
        , input
            [ type_ "password"
            , placeholder "Password"
            , value model.password
            , onInput PasswordChanged
            ]
            []
        , errorView "password" model.formState
        , button [ onClick Submit ] [ text "Login" ]
        ]

errorView : String -> Validate.State -> Html msg
errorView field state =
    case state of
        Validate.Errors errs ->
            case List.filter (\e -> e.field == field) errs of
                [] ->
                    text ""

                es ->
                    div [] (List.map (\e -> text e.message) es)

        _ ->
            text ""
```

The error wiring stays in one place. There's no copy-pasting and no one-off checks scattered through the view.

## What you get

The library cuts most of the boilerplate out of Elm forms. Validators compose, so you add a rule without rewriting the ones around it. And because the form state is a type, a half-validated form can't be constructed at all.

If you want to see the code running, there's an [example repo](https://github.com/joshhornby/elm-form-validate-example).
