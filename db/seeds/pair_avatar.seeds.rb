begin
  avatars = 0
  Pair.all.each do |pair|
    relative_filename = "#{pair.name.downcase}.png"
    # Get sources from iCloud
    source_dir = "/Users/zhenya/Library/Mobile Documents/com~apple~CloudDocs/Development/Projects/Tra/Pairs"
    source_file = "#{source_dir}/#{relative_filename}"

    if File.exist? source_file and not pair.avatar.present?
      pair.avatar.attach io: File.open(source_file), filename: relative_filename
      avatars += 1
    end
  end
  puts "===== #{avatars} Pair Avatars uploaded"
rescue
  puts "----- Achtung! Something went wrong..."
end