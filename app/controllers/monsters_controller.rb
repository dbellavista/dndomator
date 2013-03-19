class MonstersController < ApplicationController
  # GET /monsters
  # GET /monsters.json
  def index
    @monsters = Monster.all(:order => "level DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @monsters }
    end
  end

  # GET /monsters/1
  # GET /monsters/1.json
  def show
    @monster = Monster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @monster }
    end
  end

  # GET /monsters/new
  # GET /monsters/new.json
  def new
    @monster = Monster.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @monster }
    end
  end

  # GET /monsters/1/edit
  def edit
    @monster = Monster.find(params[:id])
  end

  # POST /monsters
  # POST /monsters.json
  def create
    @monster = Monster.new(params[:monster])

    respond_to do |format|
      if @monster.save
        format.html { redirect_to @monster, notice: 'Monster was successfully created.' }
        format.json { render json: @monster, status: :created, location: @monster }
      else
        format.html { render action: "new" }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  def auto_create

    errors = ""

    Dir.foreach(Monster.monster_path) do |item|
      ext = File.extname(item)
      next if item == '.' or item == '..' or ! Monster.accepted_formats.include? ext
      splitted = File.basename(item, ext).split("_")
      level = Integer(splitted[0])
      name = splitted[1]
      param = {:name => name, :level => level}
      next if Monster.exists? param
      @monster = Monster.new(param)
      errors = errors + "; " + @monster.errors unless @monster.save
    end

    respond_to do |format|
      if errors == ""
        format.html { redirect_to monsters_path, notice: 'Monsters were successfully created.' }
        format.json { render json: @monster, status: :created, location: @monster }
      else
        format.html { redirect_to monsters_path, notice: errors }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /monsters/1
  # PUT /monsters/1.json
  def update
    @monster = Monster.find(params[:id])

    respond_to do |format|
      if @monster.update_attributes(params[:monster])
        format.html { redirect_to @monster, notice: 'Monster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monsters/1
  # DELETE /monsters/1.json
  def destroy
    @monster = Monster.find(params[:id])
    @monster.destroy

    respond_to do |format|
      format.html { redirect_to monsters_url }
      format.json { head :no_content }
    end
  end
end
