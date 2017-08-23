module Bot::DiscordCommands
    # Ping command w/ response time
    module Ping
        extend Discordrb::Commands::CommandContainer
        command :ping do |event|
            "Pong! `#{::Time.now - event.timestamp} ms`"
        end
    end
end
