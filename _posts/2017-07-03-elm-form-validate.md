---
title: Using elm-form-validate
date: 2017-07-03 11:00:00
description: "Using elm-form-validate form validate to build composable, reusable form validation in Elm."
tags: [elm]
---

The real pain in frontend engineering isn't writing another form; it's dealing with validation, user feedback, and keeping your codebase from turning into a spaghetti mess of conditionals.

Elm, with its focus on making impossible states impossible, is a breath of fresh air. But vanilla form validation can get verbose, fast. That's where [`elm-form-validate`](https://package.elm-lang.org/packages/joshhornby/elm-form-validate/latest/) slots in: composable validation that lets you write forms the Elm way.

Here's how I approach it.

## Why elm-form-validate?

A lot of Elm form tutorials stop at "here's a simple input with `Maybe String` for an error". That doesn't scale. What happens when you want reusable rules, custom error messages, or need to add cross-field validation later? `elm-form-validate` leans into composability and lets you build up complex forms from simple, predictable pieces.

The core philosophy: **compose small validators, push errors up the type system, and never repeat yourself**.

## Getting Started

Let's build a classic login form, email and password, both required, password needs to be at least 8 chars.

### The Model

You want your model to capture both the raw values and the validated form state:

```elm
type alias Model =
    { email : String
    , password : String
    , formState : Validate.State
    }
```

### Validation Rules as Composable Pieces

`elm-form-validate` uses a composable API, define rules once and reuse everywhere:

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

The key: each field can be composed and tested in isolation, but you get the safety of validating the whole form in one go.

### Validating on Submit

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

### Handling Validation Errors in the View

Don't just dump errors, be intentional about surfacing what matters:

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

This keeps the error wiring trivial, no copy-pasting, no ad-hoc checks. All errors are surfaced via the library, and the logic stays composable.

## Takeaways

- **elm-form-validate** reduces the "boilerplate tax" of classic Elm forms.  
- Composable validators scale with your form, add rules without rewriting everything.  
- Type-driven design means impossible states (half-validated, half-broken forms) just can't exist.  
- Surfacing validation in the view is trivial, errors are a first-class citizen.  

If you want to see the code in action, check out the [elm-form-validate-example repo](https://github.com/joshhornby/elm-form-validate-example).

Elm is built for clarity and correctness. Good validation code should be too.
