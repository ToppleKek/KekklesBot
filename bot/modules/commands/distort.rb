require 'rmagick'
require 'open-uri'
module Bot::DiscordCommands
    # Magick distort
    module Distort
        extend Discordrb::Commands::CommandContainer
        command :distort do |event, url|
        begin

            if event.message.attachments.any? # does the message contain any attachments
                img = open(event.message.attachments.first.url) # open it
            else url != nil
                if url =~ URI::regexp(["http", "https"])
                    img = open(url)
                else
                    event.respond ":bangbang: WARN: Not a valid URL and no image attachment :bangbang:"
                    break
                end
            end

            IO.copy_stream(img, 'data/output/noedit.png') 
            imgfile = Magick::Image.read( 'data/output/noedit.png' ).first          
            rescue
                event.respond ":x: An error has occurred while reading the file. :x:"
                break
            end
            imgfileins = Magick::Image.ping( 'data/output/noedit.png' ).first # get width and hight
            imgwidth = imgfileins.columns # get width and hight
            imgheight = imgfileins.rows # get width and hight
            if imgheight && imgwidth > 400 && imgheight && imgwidth < 999
                points = 8.times.map{ 130 + Random.rand(300) }
            elsif imgheight && imgwidth > 1000
                points = 8.times.map{ 430 + Random.rand(900) }
            else
                points = 8.times.map{ 10 + Random.rand(200) }
            end                
            imgd = imgfile.distort(Magick::ShepardsDistortion, points, [0]) do
            end
            imgd.write( 'data/output/distortout.png' )
            event.channel.send_file File.new( 'data/output/distortout.png' )
        end
    end
end

