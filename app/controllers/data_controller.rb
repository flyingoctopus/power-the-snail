class DataController < ApplicationController
  # GET /data
  # GET /data.json
  def index
    @data = Datum.all
    @chair_1 = Datum.where( :chair => 1).all
    @chair_2 = Datum.where( :chair => 2 ).all
    @chair_3 = Datum.where( :chair => 3 ).all
    @chair_4 = Datum.where( :chair => 4 ).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => {
          :all_data => @data,
          :chair_1 => @chair_1.last,
          :chair_2 => @chair_2,
          :chair_3 => @chair_3.last,
          :chair_4 => @chair_4.last
        }
      }
    end
  end

  # GET /data/1
  # GET /data/1.json
  def show
    @datum = Datum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @datum }
    end
  end

  # GET /data/new
  # GET /data/new.json
  def new
    # @chair_1_data where
    # @chair_2_data
    # @chair_3_data
    @datum = Datum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @datum }
    end
  end

  # GET /data/1/edit
  def edit
    @datum = Datum.find(params[:id])
  end

  # POST /data
  # POST /data.json
  def create
    @datum = Datum.new(params[:datum])

    respond_to do |format|
      if @datum.save
        format.html { redirect_to @datum, notice: 'Datum was successfully created.' }
        format.json { render json: @datum, status: :created, location: @datum }
      else
        format.html { render action: "new" }
        format.json { render json: @datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /data/1
  # PUT /data/1.json
  def update
    @datum = Datum.find(params[:id])

    respond_to do |format|
      if @datum.update_attributes(params[:datum])
        format.html { redirect_to @datum, notice: 'Datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data/1
  # DELETE /data/1.json
  def destroy
    @datum = Datum.find(params[:id])
    @datum.destroy

    respond_to do |format|
      format.html { redirect_to data_url }
      format.json { head :no_content }
    end
  end
end
