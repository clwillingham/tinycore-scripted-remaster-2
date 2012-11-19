#!/usr/bin/ruby


require 'open-uri'
require './lib_trollop'

opts = Trollop::options do
  opt :pkg, "Package to download without .tcz", :type => :string, :short => 'p'
  opt :on_demand, "add to OnDemand list", :short => 'd'
  opt :on_boot, "add to boot list", :short => 'b'
  opt :xbase, "add to xbase list", :short => 'x'
  opt :copy2fs, "add to copy2fs list", :short => 'c'
end



def addToList(listName, line)
  File.open("../src/include/cde/#{listName}", "a") do |file|
    file.puts(line)
  end
end

def downloadPkg(pkgName, opts)
  if(!File.exist?("../src/include/cde/optional/#{pkgName}"))
    puts "Getting: #{pkgName}.dep"
    #File.open("../src/include/cde")
    begin
      open("http://distro.ibiblio.org/tinycorelinux/4.x/x86/tcz/#{pkgName}.dep"){|f|
        f.each_line{|line|
          if line != "\n" && line != "" && line != nil
            puts "LINE: " + line
            downloadPkg(line.strip, opts)
          else
            puts "line empty"
          end
        }
      }
    rescue OpenURI::HTTPError => e
      puts "#{pkgName} has no dependencies"
    end

    if opts[:on_demand]
      addToList 'ondemand.lst', pkgName
    end

    if opts[:on_boot]
      addToList 'onboot.lst', pkgName
    end

    if opts[:xbase]
      addToList 'xbase.lst', pkgName
    end

    if opts[:copy2fs]
      addToList 'copy2fs.lst', pkgName
    end

    system "wget http://distro.ibiblio.org/tinycorelinux/4.x/x86/tcz/#{pkgName}"
    system "mv #{pkgName} ../src/include/cde/optional/"
  end
end

if opts[:pkg] != nil
  p opts[:pkg]
  downloadPkg(opts[:pkg], opts)
end



