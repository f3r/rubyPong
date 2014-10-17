# HASU

[Hasu](https://github.com/michaelfairley/hasu) is a thin ruby gem that wraps and give us access to two game development libraries that help us build game easily. [Chingu](https://github.com/ippa/chingu) is an OpenGL accelerated 2D game framework for Ruby, and [Gosu](http://www.libgosu.org), that we are going to explore in a minute.

## HASU AND GOSU

In order to use [hasu](https://github.com/michaelfairley/hasu), we must install [gosu](http://www.libgosu.org) first. Gosu is a 2D game development library for the Ruby and C++ programming languages, available for Mac OS X, Windows, and Linux. The Ruby version works with MRI, MacRuby, and Rubinius, but not JRuby. Gosu only provides basic building blocks:

- a window with a main loop and callbacks
- 2D graphics and text, accelerated by 3D hardware
- sound samples and music in various formats
- keyboard, mouse, and gamepad input

Gosu is mostly in ruby, but has a C implementation for graphics, that requires your MacOS to have certain libraries for graphics, sound, etc. You can install them easily if you have [HomeBrew](http://brew.sh/), otherwise, you can install [HomeBrew](http://brew.sh/), because it's awesome.

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

## PHASES OF THE GAME

All games based on Gosu follow the same standard pattern:

```ruby
  reset
  while game_is_running?
    update
    draw
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

    def reset
      # ...
    end

    def update
      # ...
    end

    def draw
      # ...
    end
  end

  Name__Your__Game.run
```

And we can run it by typing in terminal:
```
  $ ruby game.rb
```

## Pong
### Create Actions

### 2: require your game's files

For the files you want to be hot loaded, use `Hasu.load` instead of `require`.

```ruby
  Hasu.load "ball.rb"
```

### 3: Run your game with `.run`

Instead of `Game.new.show`, run your Hasu game with `Game.run`.


## SETUP

### Create Characters
```ruby
  @player = ItalianPlumber.new
  @bad_guy = FireBreathingTurtle.new
```

### Load configurations from file
```ruby
  Map.load_from_file("castle.yml")
```

### Save User Games
```ruby
  load_saved_game("save3.json")
```

## UPDATE

### Previous State
```ruby
  @player.y -= @player.y_vel
  @player.y_vel -= 9.8
```

### Player Input
```ruby
  if button_down?("A")
    @player.jump!
  end
```

### Time
```ruby
  if last_fire < Time.now -2
    breather_fire!
  end
```

### Add Randomness
```ruby
  item = [
    :fire_flower,
    :cape,
    :mushroom
  ].sample

  spawn(item)
```

## RENDER
```ruby
plumber_image.draw(
  @player.x,
  @player.y
)
```

# Other interesting libraries

```
gem install gosu
```
complete with examples, precompiled for Windows (Ruby 1.8 & 1.9), needs an Apple compiler on OS X (usually Xcode)

```
gem install releasy
```
automatically distribute any Ruby game as a Windows executable or Mac app, by Spooner

```
gem install texplay
```
pixel-based drawing on Gosu images, by banister

```
gem install ashton
```
a C extension that integrates GL shaders and a particle engine with Gosu, also by Spooner

```
gem install gamebox
```
a complete game framework based on Gosu, by shawn42

```
gem install chingu
```
a library that adds more game logic, by ippa (not updated anymore)

```
gem install chipmunk
```
a popular physics library with an integration example in the wiki
