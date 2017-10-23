module Bot::DiscordCommands
    # Help command
    module Help
        extend Discordrb::Commands::CommandContainer
        command :help do |event|
            event.channel.send_embed do |embed|
                embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: 'Kekkles by TopKek',
                url: 'https://github.com/ToppleKek/KekklesBot',
                icon_url: 'https://cdn.discordapp.com/avatars/291437736274034688/e6b90bd92f0dd189ae3f09282e6fcfd8.webp?size=1024')
                embed.title = 'Help'
                embed.add_field(name: 'Fun Commands', value: "k!bench - Bench translator :D\nk!distort - distort an image")
                embed.add_field(name: 'Other Commands', value: "k!help - This command\nk!ping - ping with time")
                embed.add_field(name: 'Mod Commands', value: 'k!naenae - When the haters dab back hit them with the naenae (ban)\nk!dabon - Dab on the haters (kick)')
                embed.color = [16731434].sample
            end
        end
    end
end