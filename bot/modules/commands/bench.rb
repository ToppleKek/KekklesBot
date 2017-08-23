module Bot::DiscordCommands
    # Bench :D
    module Bench
        extend Discordrb::Commands::CommandContainer
        command(:bench) do |event, *bench| # I know all of this looks bad but hey, it was one of the first things I wrote in ruby so I wanted to add it here.
            bench.each do |s| #Feel free to submit a pull request to make this way better.
                s.gsub!('good', 'gode')
                s.gsub!('hello', 'henlo')
                s.gsub!('cpu', 'cups')
                s.gsub!('meme', 'MEME :smile:')
            end
            if bench.join(' ').include? "bad"
                if bench.join(' ').include? " a "
                    event.respond "mmmmmmm, #{bench.join(' ').gsub!(' a ', ' an ')} my man :sob:"
                else
                    if bench.join(' ').include? " ok "
                        event.respond "mmmmmmm, #{bench.join(' ').gsub!(' ok ', ' many of ok my man ')} my man :sob:"
                    else
                        if bench.join(' ').include? " ok"
                            event.respond "mmmmmmm, #{bench.join(' ').gsub!(' ok', ' many of ok my man :sob:')}"
                        else
                            event.respond "mmmmmmm, #{bench.join(' ')} my man :sob:"
                        end
                    end
                end
            else
                if bench.join(' ').include? " a "
                    event.respond "haha #{bench.join(' ').gsub!(' a ', ' an ')} my man :smile:"
                else
                    if bench.join(' ').include? " ok "
                        event.respond "haha #{bench.join(' ').gsub!(' ok ', ' many of ok my man ')} my man :smile:"
                    else
                        if bench.join(' ').include? " ok"
                            event.respond "haha #{bench.join(' ').gsub!(' ok', ' many of ok my man :smile:')}"
                        else
                            event.respond "haha #{bench.join(' ')} my man :smile:"
                        end
                    end
                end
            end
        end         
    end
end