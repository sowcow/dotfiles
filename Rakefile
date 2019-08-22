task :default do
  paths = <<-paths.lines.map(&:strip).reject(&:empty?)
    ~/.mplayer
    ~/.config/nvim
  paths
  paths.each { |x|
    system 'mkdir -p %s' % x
  }

  Dir['*'].each { |x|
    next unless File.directory? x
    puts x
    system 'stow -v %s' % x
  }
end
