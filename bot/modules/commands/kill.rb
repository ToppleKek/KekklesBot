module Bot::DiscordCommands
    # Kill the bot
    module Kill
        extend Discordrb::Commands::CommandContainer
        command :kill do |event|
            event.respond "Bye"
            exit
        end
    end
end