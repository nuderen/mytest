class HTTPVersion
	attr_accessor :major
	attr_accessor :minor

	def self.convert(version)
		version.is_a?(self) ? version : new(version)
	end

def initialize(version)
  case version
  when HTTPVersion
    @major, @minor = version.major, version.minor
  when String
    if /^(\d+)\.(\d+)$/ =~ version
      @major, @minor = $1.to_i, $2.to_i
    end 
  end 
  if @major.nil? || @minor.nil?
    raise ArgumentError,
      format("cannot convert %s into %s", version.class, self.class)
  end 
end 
end

h1 = HTTPVersion.new('1.1')
h2 = HTTPVersion.new('1.2')
#h3 = HTTPVersion.new('331.5')
h3 = HTTPVersion.new('5d')
p h1
p h2
p h3