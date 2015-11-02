module CollectorHelper

   def read_topics
     temporary_coordinates = []
     Thread.new do
       loop do
         if topic_file_exists?
           temporary_coordinates <<  IO.read(topic_path).to_f
           if temporary_coordinates.length == 10
             update_coordinates temporary_coordinates
             self.save!
             temporary_coordinates = []
           end
           sleep(0.5)
         end
       end
     end
   end
  
  def topic_file_exists?
   return File.exist?(topic_path)
  end
end
