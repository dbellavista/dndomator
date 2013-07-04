class TreasuresController < ApplicationController
  # GET /treasures
  # GET /treasures.json
  def index
    @treasures = Treasure.all :order => "level DESC"

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
		@new = true
		@edit = false
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @treasure }
    end
  end

  # GET /treasures/1/edit
  def edit
		@new = false
		@edit = true
    @treasure = Treasure.find(params[:id])
  end

  def give
    @treasure = Treasure.find(params[:id])
    @component = @treasure.treasure_components.find(params[:cid])
    to_give = @component.quantity - @component.quantity_assigned
    unless @component.update_attribute(:quantity_assigned, to_give + @component.quantity_assigned)
      raise ActiveRecord::Rollback, "Error #{@components.errors.to_s}"
    end

    respond_to do |format|
      format.html { redirect_to @treasure, notice: 'Treasure was successfully assigned.' }
      format.json { render json: @treasure }
    end
  end

  def giveall
    @treasure = Treasure.find(params[:id])
    @treasure.treasure_components.each do |component|
      to_give = component.quantity - component.quantity_assigned
      unless component.update_attribute(:quantity_assigned, to_give + component.quantity_assigned)
        raise ActiveRecord::Rollback, "Error #{components.errors.to_s}"
      end
    end

    respond_to do |format|
      format.html { redirect_to @treasure, notice: 'Treasure was successfully assigned.' }
      format.json { render json: @treasure }
    end
  end

  # POST /treasures
  # POST /treasures.json
  def create

    @treasure = Treasure.new(params[:treasure])
    components = create_components @treasure
    @treasure.save!
    components.each do |component|
      record = TreasureComponent.new(component)
      raise ActiveRecord::Rollback, "Error #{record.errors.to_s}" unless record.save
    end

    respond_to do |format|
      if true
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
    @treasure = Treasure.find(params[:id])

    components = create_components @treasure
    @treasure.save!
    TreasureComponent.where(:treasure_id => @treasure.id).delete_all
    components.each do |component|
      record = TreasureComponent.new(component)
      raise ActiveRecord::Rollback, "Error #{record.errors.to_s}" unless record.save
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

  def create_components treasure
    components = []
    params[:component][:ids].each do |item, value|
      component = {}
      next unless value == "true"
      component[:treasure] = treasure
      component[:item] = Item.find(item)
      component[:quantity] = params[:component]['quantity'][item]
      component[:description] = params[:component]['description'][item]
      component[:quantity_assigned] = params[:component]['quantity_assigned'][item]
      component[:hero] = params[:component]['hero'][item] == "" ? nil : Hero.find(params[:component]['hero'][item])
      components << component
    end
    return components
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
