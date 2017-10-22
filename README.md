# elm-spa-minimum

A simple Elm app to start Single Page Application

This app are mashed up ideas from these sources:
* [How to create a SPA application in Elm 0.18 (from scratch)
](https://medium.com/@adrian_ribao/how-to-create-a-spa-application-in-elm-0-18-from-scratch-68d25e0631f6)
* [Best way to handle clicks on hashless URLs?](https://github.com/elm-lang/navigation/issues/13)

## Usage
To run this app:
```bash
git clone https://github.com/yanief/elm-spa-minimum.git 
cd elm-spa-minimum
npm install
cd elm
elm-package install
# you will be prompted to install, press y
# or if you just want to approve the plan, run this instead:
#    elm-package install -y
cd ..
```

Inside the folder, you can start the simple server by running:
```bash
npm run server
```

This app uses chokidar and `elm make` will run any time it detects changes on any elm files
