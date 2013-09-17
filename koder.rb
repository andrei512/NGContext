SIGNATURE = "// crafted by Koder www.koder-tools.com"
file = ARGV[0]


def signed_kode source_kode
	unless source_kode.match(/#{SIGNATURE}$/) 
		source_kode = "#{source_kode}\n#{SIGNATURE}"
	end
	return source_kode
end

def tokenized_kode source_kode
	begin_kode = /\/\*kode/ # /*kode
	end_kode = /\*\//

	tokens = /(#{begin_kode}|#{end_kode})/
	

	matches = source_kode.scan(tokens)

	tokens = source_kode.split(tokens)

	tokens.map! { |token|
		if token.match(begin_kode)
			:begin_kode
		elsif token.match(end_kode)
			:end_kode
		else
			token
		end			
	}

	new_tokens = []
	temp = nil
	index = 0

	while index < tokens.count
		token = tokens[index]

		if token == :begin_kode
			temp = ""
		elsif token == :end_kode
			new_tokens << {
				:kode => temp
			}
			temp = nil
		elsif temp != nil
			temp = temp + token
		else
			new_tokens << {
				:code => token
			}
		end
		index = index + 1
	end

	return new_tokens
end

def process_tokens tokens
	return tokens
end

def detokenize_kode tokens
	tokens.map { |token|
		if token[:code]
			token[:code]
		elsif token[:kode]
			"/*kode#{token[:kode]}*/"
		else
			"/* Koder error !!*/"
		end				
	}.join
end

source_kode = signed_kode(open(file).read)

tokens = tokenized_kode(source_kode)

kode = detokenize_kode tokens

puts kode