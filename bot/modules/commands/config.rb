require 'yaml'
module Bot::DiscordCommands
    # Config creator
    module Config
        extend Discordrb::Commands::CommandContainer
        command :config do |event|
            File.new('test.yaml', 'w')
            testconf = YAML.load_file 'test.yaml'
            testconf['oof']['gay'] = 1
            File.open('test.yaml', 'r+') { |f| f.write testconf.to_yaml }
            event.respond "#{testconf.to_yaml}"
        end
    end
end