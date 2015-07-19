arr = []
# system "cls"
# puts "#{Time.now}"

def wrt(ar)
	File.open("index.html", "w") do |write|
		write << "<!doctype html>"
		write << "<html>"
		write << "<head>"
		write << "<style>"
		write << "p { color: blue; margin: 3px }"
		write << "#cnt{ color: red}"
		write << "</style>"
		write << "<body>"
		cnt = 0
		ar.each { |x|
			if cnt % 4 == 0 then
				write << "<div id=\"cnt\"> #{cnt/4} </div>"
			end
				write << "<p>" << x << "</p>"
			cnt += 1
		}
		write << "</body>"
		write << "</html>"
	end	
end

def output_stack(ar) 
	cnt = 0
	stack = []
	ar.each { |line|
		if cnt % 4 == 0 then
			stack << "{ " + line.strip + ", "
		elsif cnt % 4 == 1
			stack << "[]int{" + line.split(" ").join(", ") + "}, "
		elsif cnt % 4 == 2
			stack << line.strip + ", "
		elsif cnt % 4 == 3
			stack << line.strip + "}, "
		end
		cnt += 1
	}
	stack
end

Dir.glob("*.[^r|^html]*").each { |file|
	File.open("#{file}").each { |line|
		if line != " " then
			arr << line
		end
	}
}

# wrt(arr)
vl = output_stack(arr) 
wrt(vl)


vl.each_with_index { |x, indx|
	if indx % 4 == 0 then
		puts
	end
	print "#{x} "
}