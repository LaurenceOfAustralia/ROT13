CHARSET = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
    'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
]

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
    puts "ROT_#{offset}"

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

    puts "#{content} -> #{result}"
end

# rot13.rb {offset} {content}
rot_x(ARGV[0].to_i, ARGV[1])