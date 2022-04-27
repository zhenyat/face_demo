################################################################################
#   settings.rb:  Sets Constants and other Parameters for the run
#                 Called by: shell_load.rb
#   Relative path MUST BE applied to public/images, otherwise - sprockets error
#
#   11.10.2016  Inherited from 95km
#   09.11.2016  MULTILINGUAL added
#   30.08.2017  'access_restricted' key is added
#   27.04.2022  Adopted
################################################################################

##### Debugging   #####
SHELL_DEBUG = SHELL_CONFIG['debug']['status']

if SHELL_CONFIG['debug']['path'].nil? || SHELL_CONFIG['debug']['path'].empty?
  SHELL_LOG_FILE = nil
else
  SHELL_LOG_FILE = "#{Rails.root}/#{SHELL_CONFIG['debug']['path']}"
end

# Debug Logging: Create a log-file
if SHELL_DEBUG == true && !SHELL_LOG_FILE.nil?
  File.open(SHELL_LOG_FILE, 'w') { |file| file.puts "Starting debug log..."}
end

##### Mail  #####
MAIL_BCC = SHELL_CONFIG['mail']['bcc']

# Access control
ACCESS_RESTRICTED = SHELL_CONFIG['access_restricted']

##### Pattern constants  #####
EQUAL_PERCENT = SHELL_CONFIG['equal_percent']
LONG_SHADOW   = SHELL_CONFIG['long_shadow']
SMALL_SHADOW  = SHELL_CONFIG['small_shadow']

##### Time Slot for candles  #####
PERIOD     = eval SHELL_CONFIG['period'] 
TIME_SLOT  = eval SHELL_CONFIG['time_slot']
TIME_SLOTS = SHELL_CONFIG['time_slots'] 