CONFIG = HashWithIndifferentAccess.new(YAML.load(File.read("#{Rails.root}/config/config.yml")))
