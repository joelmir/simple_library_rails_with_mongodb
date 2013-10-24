class WritersController < ApplicationController
  before_action :set_writer, only: [:show, :edit, :update, :destroy]

  # GET /writers
  # GET /writers.json
  def index
    @writers = Writer.all
  end

  def sync
    #Clear objects on Database
    Writer.destroy_all
    
    directory = "public"
    path_data = File.join(directory, "dados.txt")
    counter = 1
    builder = Nokogiri::XML::Builder.new do |xml|
    xml.writers {
      File.open(path_data, "r") do |f|    
        while (line = f.gets) and counter < 1000
          @w = Writer.create({:code => line[0..6] ,:book=> line[7..51].strip ,
            :name=>line[52..80].strip ,:address=>line[81..86].strip})
          counter = counter + 1

          xml.writer {
            xml.code_  @w.code
            xml.name_  @w.name
            xml.book_  @w.book
            xml.address_  @w.address
          }
        end
      end
    }
    end

    path_xml = File.join(directory, "data.xml")
    File.open(path_xml, "w") do |f|  
      f.write(builder.to_xml)
    end


  end

  # GET /writers/1
  # GET /writers/1.json
  def show
  end

  # GET /writers/new
  def new
    @writer = Writer.new
  end

  # GET /writers/1/edit
  def edit
  end

  # POST /writers
  # POST /writers.json
  def create
    @writer = Writer.new(writer_params)

    respond_to do |format|
      if @writer.save
        format.html { redirect_to @writer, notice: 'Writer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @writer }
      else
        format.html { render action: 'new' }
        format.json { render json: @writer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /writers/1
  # PATCH/PUT /writers/1.json
  def update
    respond_to do |format|
      if @writer.update(writer_params)
        format.html { redirect_to @writer, notice: 'Writer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @writer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /writers/1
  # DELETE /writers/1.json
  def destroy
    @writer.destroy
    respond_to do |format|
      format.html { redirect_to writers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_writer
      @writer = Writer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def writer_params
      params.require(:writer).permit(:name, :book, :address)
    end
end
