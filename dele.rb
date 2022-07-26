require 'fileutils'
# "\\alyans\ovk\AVK (Element)\Element certificates"

# way = "/mnt/c/Users/User/Desktop/Новая папка"


way = "//alyans/ovk/AVK (Element)/Element certificates"

def pro_name(a, w)
    b = 0
    a.chars.each do |item|
        if item  == "-"
            b += 1
        end
    end

    if b <= 1
        
        FileUtils.rm_rf("#{w}" + "/#{a}.pdf") 
    end

end

my_dir = Dir[way + "/*.pdf"]

my_dir.each do |t|
    name = File.basename("#{t}", '.pdf')
    pro_name(name, way)
end
