# HASU

## WHAT IS HASU

[hasu](https://github.com/michaelfairley/hasu)

## INSTALL


In order to use [hasu](https://github.com/michaelfairley/hasu), we must install [gosu](http://www.libgosu.org). Gosu is mostly in ruby, but has a C implementation for graphics, that requires your MacOS to have certain libraries for graphics, sound, etc. You can install them easily if you have [HomeBrew](http://brew.sh/), otherwise, you can install [HomeBrew](http://brew.sh/), because it's awesome.

```
  $ brew install sdl2 libogg libvorbis

  ==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/sdl2-2.0.3.mavericks.bottle.tar.gz
  ######################################################################## 100.0%
  ==> Pouring sdl2-2.0.3.mavericks.bottle.tar.gz
  🍺  /usr/local/Cellar/sdl2/2.0.3: 75 files, 3.9M
  ==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/libogg-1.3.2.mavericks.bottle.tar.gz
  ######################################################################## 100.0%
  ==> Pouring libogg-1.3.2.mavericks.bottle.tar.gz
  🍺  /usr/local/Cellar/libogg/1.3.2: 95 files, 672K
  ==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/libvorbis-1.3.4.mavericks.bottle.tar.gz
  ######################################################################## 100.0%
  ==> Pouring libvorbis-1.3.4.mavericks.bottle.tar.gz
  🍺  /usr/local/Cellar/libvorbis/1.3.4: 162 files, 2.7M
```

Now we can install the hasu gem with gem install:

```
  $ gem install hasu

  Building native extensions.  This could take a while...
  Successfully installed gosu-0.8.5
  Fetching: hasu-0.1.5.gem (100%)
  Successfully installed hasu-0.1.5
  Parsing documentation for gosu-0.8.5
  Installing ri documentation for gosu-0.8.5
  Parsing documentation for hasu-0.1.5
  Installing ri documentation for hasu-0.1.5
  Done installing documentation for gosu, hasu after 11 seconds
  2 gems installed
```

## OVERVIEW

All games 

```ruby
  setup
  while game_is_running?
    update
    render
  end
```

## BASIC SETUP

### Create your game

After adding the hasu module, we get access to Hasu. Your game will have to subclass `Hasu::Window`, which can give us initially:

- initialize: the constructor to create a window for the game
- .run: method that starts the game!

game.rb:

```ruby
  require "hasu"

  class Name__Your__Game < Hasu::Window
    
    WIDTH       = 768
    HEIGHT      = 576

    def initialize
      super(WIDTH, HEIGHT, false)  # full-screen = false
    end

  end
  Name__Your__Game.run
```

And we can run it by typing in terminal:
```
  $ ruby game.rb
```

