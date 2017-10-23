module Bot::DiscordCommands
    # Just a test
    module Testing
        extend Discordrb::Commands::CommandContainer
        num = 32
        innumout = 1
        command :Testing do |event, innum|
            event.respond "INPUT = #{innum}"
            innumout = innum
            event.respond "NUM = #{num}"
        end
        command :test2 do |event|
            event.respond "INNUMOUT = #{innumout}"
            event.respond "NUM = #{num}"
        end
    end
end
