class HerosController < ApplicationController
  # GET /heros
  # GET /heros.json
  def index
    @details = params[:details] || true
    @heros = Hero.all :order => "name"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @heros }
    end
  end

  # GET /heros/1
  # GET /heros/1.json
  def show
    @hero = Hero.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hero }
    end
  end

  def assign_experience

    exp = Hero.assign_experience params[:experience].to_i

    respond_to do |format|
      format.html { redirect_to heros_path, notice: "Assigned #{exp} experience points each!" }
    end
  end

  # GET /heros/new
  # GET /heros/new.json
  def new
    @hero = Hero.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hero }
    end
  end

  # GET /heros/1/edit
  def edit
    @hero = Hero.find(params[:id])
  end

  # POST /heros
  # POST /heros.json
  def create
    @hero = Hero.new(params[:hero])

    respond_to do |format|
      if @hero.save
        format.html { redirect_to @hero, notice: 'Hero was successfully created.' }
        format.json { render json: @hero, status: :created, location: @hero }
      else
        format.html { render action: "new" }
        format.json { render json: @hero.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /heros/1
  # PUT /heros/1.json
  def update
    @hero = Hero.find(params[:id])

    respond_to do |format|
      if @hero.update_attributes(params[:hero])
        format.html { redirect_to @hero, notice: 'Hero was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hero.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heros/1
  # DELETE /heros/1.json
  def destroy
    @hero = Hero.find(params[:id])
    @hero.destroy

    respond_to do |format|
      format.html { redirect_to heros_url }
      format.json { head :no_content }
    end
  end
end
