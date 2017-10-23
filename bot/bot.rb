#https://github.com/z64/gemstone
#credit to z64
$LOAD_PATH << File.dirname(__FILE__)

require 'discordrb'
require 'ostruct'
require 'yaml'

# The main bot module.
module Bot
  # Load non-Discordrb modules
  Dir['bot/modules/*.rb'].each { |mod| load mod }

  CONFIG = OpenStruct.new YAML.load_file 'data/config.yaml'
  BOT = Discordrb::Commands::CommandBot.new(client_id: CONFIG.client_id,
  token: CONFIG.token,
  prefix: CONFIG.prefix)

  BOT.ready do |event|
    LOGGER = Logger.new(ENV['DISCORDRB_FANCY_LOG'])
    LOGGER.debug
    puts "Kekkles Bot, V: 0.0.1"
  end
  
  # This class method wraps the module lazy-loading process of discordrb command
  # and event modules. Any module name passed to this method will have its child
  # constants iterated over and passed to `Discordrb::Commands::CommandBot#include!`
  # Any module name passed to this method *must*:
  #   - extend Discordrb::EventContainer
  #   - extend Discordrb::Commands::CommandContainer
  # @param klass [Symbol, #to_sym] the name of the module
  # @param path [String] the path underneath `src/modules/` to load files from
  def self.load_modules(klass, path)
    new_module = Module.new
    const_set(klass.to_sym, new_module)
    Dir["bot/modules/#{path}/*.rb"].each { |file| load file }
    new_module.constants.each do |mod|
      BOT.include! new_module.const_get(mod)
    end
  end

  load_modules(:DiscordEvents, 'events')
  load_modules(:DiscordCommands, 'commands')

  # Run the bot
  BOT.run
end