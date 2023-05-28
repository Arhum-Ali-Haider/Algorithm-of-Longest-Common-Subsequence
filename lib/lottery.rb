#get winning ticket number by command-line input

puts 'Enter the winning ticket number:'
winning_ticket = gets.chomp.strip
while winning_ticket.nil? || winning_ticket.empty? || winning_ticket !~ /^\d+$/
  puts 'Invalid input. Please enter a valid number:'
  winning_ticket = gets.chomp.strip
end

data = {}

#get credits for lcs
def lcs(str1, str2)
  matrix = [[], []]
  matrix = Array.new(str1.length + 1) { Array.new(str2.length + 1) }
  (0..str2.length).each { |i| matrix[0][i] = 0 }
  (0..str1.length).each { |i| matrix[i][0] = 0 }

  #computing matrix to get credits
  str1.each_char.with_index(1) do |x, i|
    str2.each_char.with_index(1) do |y, j|
      matrix[i][j] = if x == y
                      matrix[i - 1][j - 1] + 1
                    else
                      [matrix[i][j - 1], matrix[i - 1][j]].max
                    end
    end
  end
  # matrix.each { |row| puts row.join(' ') } #uncomment this line to see the computed matrix in command line but add some string separators e.g '--------' to separate all the matrices
  return matrix[str1.length][str2.length]
end

# iterating through comma separated file of all the participants
File.foreach("public/input.txt") do |entry|
  ticket = entry.split(",")[3].strip
  identity = entry.split(",").first(3).map(&:strip).join(",")
  credit = lcs(ticket, winning_ticket)
  if data.key?(identity)
    data["#{identity}"] += credit #adding credits if one participant has more than one winning
  else
    data["#{identity}"] = credit unless credit.zero? #adding credits of a participant who has one winning 
  end
end

#sorting data
sorted_output = data.sort_by do |key, _|
  last_name, first_name, country = key.split(",")
  [last_name, first_name, country]
end

sorted_hash = Hash[sorted_output]

# writing data in output file
File.open("public/output.txt", "w") do |file|
  sorted_hash.each do |key, value|
    file.puts "#{key},#{value}"
  end
end