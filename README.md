# Magic the Gathering Deck Scraper
A ruby script for downloading decklists from the Star City Games

Outputs the decklist to a text file in the most commonly used format.

Currently just a script that is run with ruby like this:

```
git clone https://github.com/smcabrera/mtg_deck_scraper.git
gem install mechanize
cd mtg_deck_scraper
ruby scraper.rb
```

The command line prompt asks you for a URL and a textfile and then populates the textfile with the deck, main deck and sideboard separated by a new line.

Here's a simple [example video](https://monosnap.com/file/oX9jdAZtvSAWBfNV6TP5O40pfL6WcK) showing it in action.

Just a pet project I did one night when I was bored, stemming from my own laziness and my frustration that many of the sites that post decklists seem to have removed their download links. I could just copy and paste but I'm too lazy for that! Let me know if you'd be interested in help me out fleshing this out more. Ideas include:

- creating scrapers for more websites
- creating a web app to host and save files you find (possibly just using redis as a simple database)
- A nicer command line interface
- Looking up prices using another scraper or an API.
- Packaging as an actual ruby gem

Let me know if you'd be interested in contributing. Thanks and enjoy!
