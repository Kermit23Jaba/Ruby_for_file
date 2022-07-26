
# удаляем файлы pdf
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




#Поиск и копия файлов
require 'fileutils'

my_dir_1 = Dir[ "//SOBOL/ovk/База АВК/АВК ГОТОВЫЕ/*/*/*/*.pdf"]

my_dir_1.each do |t|
	# "//SOBOL/ovk/База АВК/АВК ГОТОВЫЕ/Заявка №963/1182) 30-VV-400015-44-AF1-IH-U01/1) 21814 - SD35860.pdf"
	# p t
	name = File.basename("#{t}", '.pdf')
	dest_folder = "C:/General AVK/Rename/A1/#{name}.pdf"
	FileUtils.cp(t, dest_folder)
end


#Поиск файлов по тхт и копирование их в определенную папку
require 'fileutils'

all_f = File.readlines('find element certificates.txt', chomp: true )

all_f.each do |f|
    my_dir = Dir["//SOBOL/ovk/Element certificates/#{f}.pdf"]
    my_dir.each do |f|
    name = File.basename("#{f}", '.pdf')
    dest_folder = "C:/General AVK/AVK creation/#{all_f[0]}/#{name}.pdf"
    FileUtils.cp(f, dest_folder)
    end
end


#удаляет пробелы
require 'fileutils'

def word_not_probel(a)
    b = ''
    a.chars.each do |i|
        if i == ' ' 
            i.delete(' ')
        else
            b << i
        end
    end
    return b
end

#удаляет от и до скобки
def del_skoba(a)
    a.chars.each_with_index do |i,index| 
        if i == ")"
            a.slice!(0...index + 1)
        end
    end
    return a
end


#a = "Документ о качестве № А-11 от 31.08.2019г. - (U30, 3 машина, 2097,59 кг.)"

def del_dok_o_kach(a)
    a.slice!(40...a.size)
    a.slice!(0...20)
    b = ''
    a.chars.each_with_index do |i, index|
    i = " " if i == "-"
    b << i
    end
    return b
end

# p del_dok_o_kach(a)
# "№ А 11 от 31.08.2019"

folder_path = "//SOBOL/ovk/АВК Опоры/Doc o cachestve/"

Dir.glob(folder_path + "/*").each do |f|

    filename = File.basename(f, File.extname(f))

    File.rename(f, folder_path + "/" + del_dok_o_kach(filename) + File.extname(f))
end

#Забирает папки и копирует

require 'fileutils'

def slovo_dell_fraz_e(a)
    b = a.split(" ")
    b[3]
end

def slovo_dell_fraz_s(a)
    b = a.split(" ")
    b[2]
end

my_dir_e = Dir[ "//ALYANS/ovk/AVK (Element)/Arhiv/*/*"]

my_dir_e.each do |t|
  
    t_t = slovo_dell_fraz_e(t)
	p name = File.basename("#{t_t}", "*")

    if name.size > 20
	dest_folder_e = "//ALYANS/ovk/Arhiv/#{name}/Elements/"
    FileUtils::mkdir_p dest_folder_e
	FileUtils.cp_r t, dest_folder_e
    end

end
1

#Удаляет если название в файле мень 2ух -
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
