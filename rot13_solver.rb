CHARSET = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
    'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
]

$words = []

# Loop back to zero
def new_index(start, add)
    result = start

    add.times do
        if result == 25
            result = 0
        else 
            result += 1
        end
    end

    result
end

def rot_x(offset, content)
    content = content.upcase
    result = ""
    content.chars do |c_char|
        CHARSET.each_with_index do |set_char, i|
            if set_char == c_char
                result << CHARSET[new_index(i, offset)]
            end
        end

        if c_char == ' '
            result << ' '
        end
    end

    result
end

def test_offset(offset, message)
    rot_message = rot_x(offset, message)
    num_incl_words = 0
    $words.each_with_index do |word, i|
        if i % 1113 == 0
            print "\r"
            print "#{i}/#{$words.length} words tested"
        end

        if rot_message.include? word.upcase
            num_incl_words += 1
        end
    end

    print "\r"
    print "#{$words.length}/#{$words.length}"
    puts "\n\n"

    [num_incl_words, offset]
end

def solve(message)
    results = []
    for i in 1..25 do
        puts "Testing ROT_#{i}"
        results.push test_offset(i, message)
    end

    results = results.sort.reverse
    puts "This message is most likely decipherable with ROT_#{results[0][1]}.\nThe deciphered text is...\n#{rot_x(results[0][1], message)}"
end


# rot13_solver.rb {content_to_crack}


# Taken from https://github.com/dwyl/english-words/, thanks dwyl
File.readlines('words_alpha.txt').each do |word|
    $words.push(word.chomp)
end

solve(ARGV[0].upcase)