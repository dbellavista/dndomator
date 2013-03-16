class TreasuresController < ApplicationController
  # GET /treasures
  # GET /treasures.json
  def index
    @treasures = Treasure.find :all, :order => "level DESC, packet ASC"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @treasures }
    end
  end

  # GET /treasures/1
  # GET /treasures/1.json
  def show
    @treasure = Treasure.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @treasure }
    end
  end

  # GET /treasures/new
  # GET /treasures/new.json
  def new
    @treasure = Treasure.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @treasure }
    end
  end

  # GET /treasures/1/edit
  def edit
    @treasure = Treasure.find(params[:id])
  end

  def give
    @treasure = Treasure.find(params[:id])
    to_give = @treasure.quantity - @treasure.quantity_assigned
    respond_to do |format|
      if @treasure.update_attribute(:quantity_assigned, to_give + @treasure.quantity_assigned)
        format.html { redirect_to @treasure, notice: 'Treasure was successfully assigned.' }
        format.json { head :no_content }
      else
        format.html { render action: "show" }
        format.json { render json: @treasure.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /treasures
  # POST /treasures.json
  def create

    params[:treasure][:item] = Item.find(params[:treasure][:item])
    if !params[:treasure][:hero].nil?
      params[:treasure][:hero] = Hero.find(params[:treasure][:hero])
    end

    @treasure = Treasure.new(params[:treasure])

    respond_to do |format|
      if @treasure.save
        format.html { redirect_to @treasure, notice: 'Treasure was successfully created.' }
        format.json { render json: @treasure, status: :created, location: @treasure }
      else
        format.html { render action: "new" }
        format.json { render json: @treasure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /treasures/1
  # PUT /treasures/1.json
  def update
    params[:treasure][:item] = Item.find(params[:treasure][:item])
    @treasure = Treasure.find(params[:id])
    if !params[:treasure][:hero].empty?
      params[:treasure][:hero] = Hero.find(params[:treasure][:hero])
    else
      params[:treasure][:hero] = nil
    end

    respond_to do |format|
      if @treasure.update_attributes(params[:treasure])
        format.html { redirect_to @treasure, notice: 'Treasure was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @treasure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treasures/1
  # DELETE /treasures/1.json
  def destroy
    @treasure = Treasure.find(params[:id])
    @treasure.destroy

    respond_to do |format|
      format.html { redirect_to treasures_url }
      format.json { head :no_content }
    end
  end
end
