class AchievementsController < ApplicationController
  # GET /achievements
  # GET /achievements.json

  def index
    @list = params[:list] || false
    @achievements = Achievement.all(:order => "name")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @achievements }
    end
  end

  # GET /achievements/1
  # GET /achievements/1.json
  def show
    @achievement = Achievement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @achievement }
    end
  end

  # GET /achievements/new
  # GET /achievements/new.json
  def new
    @achievement = Achievement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @achievement }
    end
  end

  # GET /achievements/1/edit
  def edit
    @achievement = Achievement.find(params[:id])
  end

  # POST /achievements
  # POST /achievements.json
  def create
    @achievement = Achievement.new(params[:achievement])

    respond_to do |format|
      if @achievement.save
        format.html { redirect_to @achievement, notice: 'Achievement was successfully created.' }
        format.json { render json: @achievement, status: :created, location: @achievement }
      else
        format.html { render action: "new" }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /achievements/1
  # PUT /achievements/1.json
  def update
    @achievement = Achievement.find(params[:id])

    unless params[:instance_description].nil?
      params[:instance_description].each do |instance, value|
        achievement_instance = AchievementInstance.find(instance.to_i)
        if params[:instance_delete].has_key? instance
          achievement_instance.destroy
        else
          achievement_instance.update_attribute(:description, value)
        end
      end
    end

    respond_to do |format|
      if @achievement.update_attributes(params[:achievement])
        format.html { redirect_to @achievement, notice: 'Achievement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achievements/1
  # DELETE /achievements/1.json
  def destroy
    @achievement = Achievement.find(params[:id])
    @achievement.destroy

    respond_to do |format|
      format.html { redirect_to achievements_url }
      format.json { head :no_content }
    end
  end
end
