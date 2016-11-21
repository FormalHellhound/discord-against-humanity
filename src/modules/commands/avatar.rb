module Bot
  module DiscordCommands
    # Lets you set the bot's avatar.
    module Avatar
      extend Discordrb::Commands::CommandContainer
      command(:botav,
              min_args: 1,
              max_args: 1,
              required_roles: CONFIG.modroles,
              description: 'Sets the bot\'s avatar',
              usage: "#{BOT.prefix}botav <image url>") do |event, arg|
        open(arg) {|f|
          File.open("avatars/bot.png","wb") do |file|
            file.puts f.read
          end
        }
        event.bot.profile.avatar = File.open("avatars/bot.png", 'r')
        File.delete("avatars/bot.png")
	nil
      end
    end
  end
end
