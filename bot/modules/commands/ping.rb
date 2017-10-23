module Bot::DiscordCommands
    # Ping command w/ response time
    module Ping
        extend Discordrb::Commands::CommandContainer
        command :ping do |event|
            ping = ::Time.now - event.timestamp
            pingr = ping * 1000
            "Pong! `#{pingr.round} ms`"
        end
    end
end
