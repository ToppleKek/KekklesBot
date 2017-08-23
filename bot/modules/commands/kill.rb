module Bot::DiscordCommands
    # Kill the bot
    module Kill
        extend Discordrb::Commands::CommandContainer
        command :kill do |event|
            "Bye"
            exit
        end
    end
end