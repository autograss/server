class Graph < ActiveRecord::Base

  serialize :fields
  serialize :data

  def update

    graph_file = "#{Rails.root}/app/assets/images/umidade.svg"

    file = if File.exist? graph_file
            File.open(graph_file,'w+')
          else
            File.new(graph_file,'w+')
          end
    file.write create_svg_graph.burn
    file.close
  end

  
  def initialize_data value
    self.data ||= []
     data << IO.read("#{Rails.root}/graph_values/value").to_f
     data << IO.read("#{Rails.root}/graph_values/value1").to_f
    self.data << value
  end

end
