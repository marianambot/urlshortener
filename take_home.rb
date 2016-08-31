
require 'mysql2'

#class DbConnection
class DbConnection
	def connectDB
		# connect to the MySQL server
		# create global variable
		$client = Mysql2::Client.new(
			:host => "localhost" , 		
			:username => "user_1" , 
			:password => "user_1" ,
			:database => "ruby_db")
	end
	
	def disconnectDB
		$client.close
	end
end #end class DbConnection

# ---------------------------------------------
#class FullURLClass
# ---------------------------------------------
class FullURLClass

    def initialize()
		
    end	
	
    def setURL(full_url_string)
        # create instance variable
        @full_url_string = full_url_string	
        puts "==> Full URL: #{@full_url_string}"		
		
		# genearate auto increment ID with by inserting NULL
		$client.query("INSERT INTO full_url 
						(Full_Url_Id,
						 Full_Url_string)
						VALUES (NULL,'#{@full_url_string}')
					")
		
		# get ID of last inserted Full URL
		results = $client.query("SELECT LAST_INSERT_ID()")
		results.each do |row|
			@full_url_id_inserted = row["LAST_INSERT_ID()"]
		end
		puts "==> Last ID inserted: #{@full_url_id_inserted}"		
		puts "==> Full URL record has been created"		
    end	
	
	def getURL
		return @full_url_string
	end 
	
    def getURL(url_id)
		results = $client.query("SELECT Full_Url_string FROM full_url WHERE Full_Url_Id = #{url_id}")
		results.each do |row|
			@full_url_string = row["Full_Url_string"]
		end
		puts "==> FullURLClass: Full URL is #{@full_url_string}"	        
        return @full_url_string
    end	
	
	def getLastInsertedUrlID
		return @full_url_id_inserted		
	end
end #end FullURLClass

# ---------------------------------------------
#class ShorURLClass
# ---------------------------------------------
class ShortURLClass

    def initialize()
        # create class variable, shared by all instances
		@@short_prefix = "http://mmb.url/"
    end	
	
	def setURL(full_url_id)
		# get last Inserted URL row ID from FullURL table
		@full_url_id_inserted = full_url_id
		puts "==> ShortURLClass: Last Full ID inserted is #{@full_url_id_inserted} "
		# concatenate short_prefix with short_url_id
        @short_url = "#{@@short_prefix}#{@full_url_id_inserted}"
		puts "==> Short URL: #{@short_url}"
						
		$client.query("INSERT INTO short_url (
							Short_Url_id,
							Short_Url_Full_Id,
							Short_Url_String,
							Short_Url_Number_Of_Accesses,
							Short_Url_IP_Address_Of_Acess)
						VALUES (NULL,
							 #{@full_url_id_inserted},
							'#{@short_url}',
							0,'')
					")

		puts "==> Short URL record has been created"	
	end

    def getURL     
        return @short_url
    end
	
	# get Short URL row ID from a given Short URL string
	def getShortURLId(url_string)
		results = $client.query("SELECT Short_Url_id FROM short_url WHERE Short_Url_String = '#{url_string}'")
		results.each do |row|
			@short_url_id = row["Short_Url_id"]
		end
		puts "==> ShorURLClass: Short URL ID is #{@short_url_id}"	
		return @short_url_id
	end
	
	# get Full URL row ID from a given Short URL row ID in 
	# short_url table
	def getFullURLId(short_url_id)
		results = $client.query("SELECT Short_Url_Full_Id FROM short_url WHERE Short_Url_id = '#{short_url_id}'")
		results.each do |row|
			@full_url_id = row["Short_Url_Full_Id"]
		end
		puts "==> ShorURLClass: Full URL ID is #{@full_url_id}"	
		return @full_url_id
	end
		
end #end ShortURLClass


# ---------------------------------------------
# Testing
# ---------------------------------------------

# Test to generate and store a Short URL string from 
#  a Full URL string
connection = DbConnection.new
connection.connectDB

my_full_url = FullURLClass.new
my_full_url.setURL("http://www.cnn.com/opinions")

my_short_url = ShortURLClass.new
my_short_url.setURL(my_full_url.getLastInsertedUrlID)

connection.disconnectDB


# Test to recover a Full URL string from a Short URL string:
connection = DbConnection.new
connection.connectDB

my_short_url2 = ShortURLClass.new
my_short_url2_id = my_short_url2.getShortURLId("http://mmb.url/38")
my_full_url2_id = my_short_url2.getFullURLId(my_short_url2_id)

my_full_url = FullURLClass.new
my_full_url.getURL(my_full_url2_id)

connection.disconnectDB
