################################################################################
# shell_load.rb:
#   (1) Loads default config parameters from YAML file at Initialization Phase
#   (2) Updates parameters with values set for the Application Run
#
#   Source: http://railscasts.com/episodes/85-yaml-configuration-file
#
#   11.10.2016  Inherited from 95km
#   24.04.2022  Adopted
################################################################################

# Gets default App configuration parameters
filename = 'config/shell/default.yml'
if File.exists? "#{Rails.root}/#{filename}"
  SHELL_CONFIG = YAML.load_file("#{Rails.root}/#{filename}")[Rails.env]

  # Updates default configuration parameters for the current Application Run
  filename = 'config/shell/run.yml'
  if File.exists? "#{Rails.root}/#{filename}"
    run_config = YAML.load_file("#{Rails.root}/#{filename}")
    SHELL_CONFIG.deep_merge! run_config if run_config.present?  # File contains values
  end
end

# Sets Constants and Parameters for the App run
filename = 'config/shell/settings.rb'
if File.exists? "#{Rails.root}/#{filename}"
  eval File.read("#{Rails.root}/#{filename}")
end