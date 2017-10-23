CONFIG = Bot::CONFIG
BOT = Bot::BOT

module Bot::DiscordCommands
    # Naenae and dab (Ban and kick)
    module NaeDab

        extend Discordrb::Commands::CommandContainer

        command :naenae do |event, ban, *pm|
            if event.user.defined_permission?(:administrator) || event.user.id == CONFIG.owner
                if ban == nil
                    event.respond "no1 2 naenae"
                    break
                end             
                if ban.include?('@everyone')     
                    event.respond 'what am i gonna do?! mintz the server ***again***??!?!?!?!?!?'
                    break
                  elsif ban.include?('282876393254289418')
                    event.respond "woah what am i gonna do nae nae myself??!?!?!?!??"
                    break
                  elsif ban.include?('168111169708490752')
                    event.respond "im not gonna nae nae the god!!!!!!!!!!!!!!!!"
                    break    
                  elsif ban.include?("#{event.server.owner.id}")
                    event.respond "owo that persons the owner no nae nae"
                    break
                  end
        
                userToBanId = event.message.mentions.first.id
                userToBanName = event.message.mentions.first.name
                begin
                  BOT.user(userToBanId).pm "Get heccing naenae'd from #{event.server.name} They naenae'd you for: #{pm.join(' ')}"
                rescue Discordrb::Errors::NoPermission # if it has no perms to pm
                  event.channel.send_embed do |embed|
                      embed.title = "Permission Error"
                      embed.description = "Bot does not have permission to send a PM to that user, but I'll try to naenae anyway."
                      embed.color = [11736341].sample
                  end
                end
                begin
                    event.server.ban(userToBanId, 7)
                    event.channel.send_embed do |embed|
                        embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "#{userToBanName} JUST GOT NAENAED")
                        embed.title = "RIP"
                        embed.description = "GET FRICKED KIDDO"
                        embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: 'https://cdn.discordapp.com/attachments/242345022719000595/352625339891056640/lmao.gif')
                        embed.color = [1571692].sample
                    end
                  rescue Discordrb::Errors::NoPermission # if it has no perms to ban
                    event.channel.send_embed do |embed|
                      embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: 'An error has occurred')
                      embed.title = "Permission Error"
                      embed.description = "Bot does not have permission to naenae."
                      embed.color = [11736341].sample
                    end
                    break
                rescue # if the command user does a bad and puts an invalid mention.
                    event.channel.send_embed do |embed|
                        embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: 'An error has occurred')
                        embed.title = "Unknown user"
                        embed.description = "Please include a mention to the person you want to nae nae."
                        embed.color = [11736341].sample
                    end
                    break
                end
                
                begin
                  BOT.channel(y.fetch(event.server.id)['modlog']).send_embed do |embed|
                    embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: 'USER NAENAED')
                    embed.title = "#{event.user.name}\##{event.user.discriminator} Used ..naenae"
                    embed.description = "#{event.user.name}\##{event.user.discriminator} naenaed #{event.message.mentions.first.name}\##{event.message.mentions.first.discriminator} for: ``#{pm.join(' ')}``"
                    embed.color = [7506394].sample
                end 
                rescue
                  event.respond "You don't have a modlog set. In the future, you will be able to set one yourself. But until TopKek gets off his lazy ass and makes that, you'll have to ask him to make it for you. PM him an invite."
                end
            else
                event.channel.send_embed do |embed|
                    embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: 'Access denied')
                    embed.title = "Your role does not have sufficient permissions to execute this command."
                    embed.description = "Your role needs administrator defined"
                    embed.color = [16731392].sample
                end
            end
        end
        # TODO fix up this indentation
        command(:dabon) do |event, kick, *reason|
            if event.user.defined_permission?(:administrator) || event.user.id == CONFIG.owner || event.user.defined_permission?(:kick_members)
              if kick == nil
                  event.respond "no1 2 naenae"
                  break
              end             
              case kick
              when '@everyone'
                  event.respond 'what am i gonna do?! mintz the server ***again***??!?!?!?!?!?'
                  break
              when '<@282876393254289418>'
                  event.respond "how do i dab on myself?!?!?111????!"
                  break
              when '<@168111169708490752>'
                  event.respond "this guy is god!!!!!!11 why would i dab on him?!?!??!?!??!"
                  break    
              when "<@#{event.server.owner.id}>"
                  event.respond "owo that persons the owner no dab"
                  break
              end
        
              userToKickId = event.message.mentions.first.id
              userToKickName = event.message.mentions.first.name
              begin
                BOT.user(userToKickId).pm "Get heccing dabbed on from #{event.server.name} They dabbed on you for: #{reason.join(' ')}"
              rescue Discordrb::Errors::NoPermission # if it has no perms to pm
                event.channel.send_embed do |embed|
                    embed.title = "Permission Error"
                    embed.description = "Bot does not have permission to send a PM to that user, but I'll try to dab anyway."
                    embed.color = [11736341].sample
                end
              end
              begin
                  event.server.kick(userToKickId)
                  event.channel.send_embed do |embed|
                      embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "#{userToKickName} JUST GOT DABBED ON")
                      embed.title = "RIP"
                      embed.description = "GET FRICKED KIDDO"
                      embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: 'https://s8.postimg.org/cbcaniyk5/breaddab.gif')
                      embed.color = [1571692].sample
                  end
                rescue Discordrb::Errors::NoPermission # if it has no perms to kick
                  event.channel.send_embed do |embed|
                    embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: 'An error has occurred')
                    embed.title = "Permission Error"
                    embed.description = "Bot does not have permission to dab. Dabbing is banned i guess."
                    embed.color = [11736341].sample
                  end
                  break
              rescue # if the command user does a bad and puts an invalid mention.
                  event.channel.send_embed do |embed|
                      embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: 'An error has occurred')
                      embed.title = "Unknown user"
                      embed.description = "Please include a mention to the person you want to dab on."
                      embed.color = [11736341].sample
                  end
                  break
              end
              
            begin
                BOT.channel(y.fetch(event.server.id)['modlog']).send_embed do |embed|
                    embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: 'USER DABBED ON')
                    embed.title = "#{event.user.name}\##{event.user.discriminator} Used ..dabon"
                    embed.description = "#{event.user.name}\##{event.user.discriminator} dabbed on #{event.message.mentions.first.name}\##{event.message.mentions.first.discriminator} for: ``#{reason.join(' ')}``"
                    embed.color = [7506394].sample
                end 
            rescue
                event.respond "You don't have a modlog set. In the future, you will be able to set one yourself. But until TopKek gets off his lazy ass and makes that, you'll have to ask him to make it for you. PM him an invite."
            end
        else
            event.channel.send_embed do |embed|
                embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: 'Access denied')
                embed.title = "Your role does not have sufficient permissions to execute this command."
                embed.description = "Your role needs administrator or kick_members defined"
                embed.color = [16731392].sample
            end
            end
        end
    end
end