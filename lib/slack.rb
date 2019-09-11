#!/usr/bin/env ruby

require_relative 'workspace'

COMMANDS = ['list users', 'list channels', 'select user', 'select channel', 'details', 'quit']
SEARCH_KEYS = ['name', 'id']

def show_commands
  puts "Available commands:"
  puts COMMANDS
  puts
end

def get_command
  begin
    input = gets.chomp.downcase 
    puts "Please enter a valid command"
    show_commands
  end until COMMANDS.include? input
  return input
end

def prompt_recipient
  puts "What do you like to search for: name or id:"
  key = gets.chomp.downcase until SEARCH_KEYS.include? key
  
  puts "Please enter #{key}:"
  input = gets.chomp
  
  key == 'name' ? {name: input} : {slack_id: input}
end

def main
  puts "Welcome to the Ada Slack CLI!\n"
  
  workspace = Workspace.new
  workspace.show_details
  while true
    show_commands
    command = get_command
    
    case command
    when 'quit'
      break
      
    when 'list users'
      workspace.show_details :users
      
    when 'list channels'
      workspace.show_details :channels
      
    when 'select channel'
      channel_info = prompt_recipient
      workspace.select_channel(channel_info)
      workspace.selected ? workspace.show_selected : puts("Channel not found\n\n")  
      
    when 'select user'
      user_info = prompt_recipient
      workspace.select_user(user_info)
      workspace.selected ? workspace.show_selected : puts("User not found\n\n") 
      
    when 'details'
      workspace.show_selected
    end
  end
  
  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME
