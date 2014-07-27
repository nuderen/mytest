# 相対パス=>絶対パスに変換s
puts Dir.pwd
puts __FILE__ # 現在のソースファイルを返す
puts File.expand_path("./code.rb") #第二引数に指定したディレクトリを基準として....

#############prettyprint library##############
# This class implements a pretty printing algorithm. It finds line breaks and
# nice indentations for grouped structure.
class PrettyPrint
	def PrettyPrint.format(output='',maxwidth=79,newline="\n",genspace=lambda {|n| ' ' * n}) 
		q = PrettyPrint.new(output,maxwidth,newline,&genspace)
		yield q
		q flush
		output
	end

	attr_reader :output
	attr_reader :maxwidth
	attr_reader :newline
	attr_reader :genspace

	# creates a buffer for a pretty printing
	def initialize(output="",maxwidth=79,newline="\n",&genspace)
		@output = output
	    @maxwidth = maxwidth
    	@newline = newline
    	@genspace = genspace || lambda {|n| ' ' * n}

	    @output_width = 0	
   	 	@buffer_width = 0
    	@buffer = []

    	root_group = Group.new(0)
    	@group_stack =[root_group]
	end

	#outputs buffered data 
	def flush
		@buffer.each {|data| 
			@output_width = data.output(@output,@output_width)
		}
	end
	# @ is instance valialble

	# The group class is used for making indentation easier
	class Group
		def initialize(depth)
			@depth=depth
			@breakables=[]
			@break=false
		end
	end

	class GroupQueue
		def initialize(*groups)
			@queue= []
			groups.each{|g| enq g}
		end

		def enq(group)
			depth=group.depth
end

q = PrettyPrint.new()
p q

#yield 
#http://d.hatena.ne.jp/yoshidaa/20090511/1241967137
def hogehoge(x)
	p block_given?
	return x + 2
end

p hogehoge(3)
p hogehoge(5){p "foo"} #yieldはブロックを渡すことができる


def hoge1(x ,&proc) #second argument is block
	proc.call if block_given? # proc is object of context(do objective)
	return x + 2
end

p hoge1(2)
p hoge1(3){p "foo"} 

# Proc 
prci = Proc.new{p "hoge"} #prci is instance
p prci.class
prci.call

prci2 = Proc.new{|a,b| (a + b)}
puts prci2.call(4,6) 

#hoge1 = hoge2
def  hoge2(x)
	yield if block_given?
	return x + 2
end

p hoge2(5){p "foo2"}

def hoge3(x,&kazu)
	kazu.call if block_given?
	return x * x
end

puts hoge3(3){p "kazukazu"}


#block and proc and lambda
#http://d.hatena.ne.jp/shunsuk/20090101/1230816826
array = [1,2,3,4]
array.collect! do |n| # = map !! and => creates a new array containing the values returned by the block
	n **2
end

puts array.inspect # object returns easy reading string


# original code equals collect => this is very hard and useful studing of dcode
class Array # => add method to Array class
	def iterate!
		self.each_with_index do |n,i| #calls block with two argumentsm,for each item in enum
			self[i] = yield(n)			# very good useful argorism
		end
	end
end

ary = [2,3,4,5]
ary.iterate! do |n|
	n + 10
end

puts ary.inspect

# use Lambda
class Array
	def iterate(code)
		self.each_with_index do |n,i|
			self[i] = code.call(n)
		end
	end
end

num = [5,6,7,8]
num.iterate(lambda{|n| n**2})
puts num.inspect

# Lambda's feacher
# check number of arguments
# if Lambda give return but, Lambda continue working process


class Group
	def initialize(depth)
		@depth=depth
		@breakables=[]
		@break=false
	end
end

g = Group.new(0)
p g
p [g]


#############pp library#############
