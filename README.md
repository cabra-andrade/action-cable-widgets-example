# Widget Loader with Individual Job calls
This is a proof of concept for making the Pelican's dashboard widget loader a bit
more server-rendered and less reliant on massive amounts of JS.

There are some forays here into some potentially unecessary POROs (Plain Old Ruby Objects), check
`app/models/widget` for instance. I think those will probably be replaced by `ViewComponent`s in
the merged code.

At the same time, there's potential for MORE abstraction to remove some of the repetition (with
inheritance and some meta programming), I'm aware of this. Keep in mind that this is a proof of
concept from someone who has limited knowledge of the actual currently implementation. So, initially,
I'd rather have MORE repetition than risk delving into abstractions too early and risk making some
spaghetti code nonsense.

If anything... maybe I already started with too much abstraction. I hope the potential is clear from
this example tho. 🤘

# Running
```shell
bundle install
yarn install
rails s
```
