class AchievementInstancesController < ApplicationController
  # GET /achievement_instances
  # GET /achievement_instances.json
  def index
    @achievement_instances = AchievementInstance.all

    respond_to do |format|
      format.html { redirect_to achievements_path }
      format.json { render json: @achievement_instances }
    end
  end

  # GET /achievement_instances/1
  # GET /achievement_instances/1.json
  def show
    @achievement_instance = AchievementInstance.find(params[:id])
    achievement = @achievement_instance.achievement

    respond_to do |format|
      format.html { redirect_to achievement }
      format.json { render json: @achievement_instance }
    end
  end

  # GET /achievement_instances/new
  # GET /achievement_instances/new.json
  def new
    @achievement_instance = AchievementInstance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @achievement_instance }
    end
  end

  # GET /achievement_instances/1/edit
  def edit
    @achievement_instance = AchievementInstance.find(params[:id])
  end

  # POST /achievement_instances
  # POST /achievement_instances.json
  def create
    hero = Hero.find(params[:achievement_instance][:hero].to_i)
    achievement = Achievement.find(params[:achievement_instance][:achievement].to_i)
    params[:achievement_instance][:hero] = hero
    params[:achievement_instance][:achievement] = achievement

    @achievement_instance = AchievementInstance.new(params[:achievement_instance])

    respond_to do |format|
      if @achievement_instance.save
        format.html { redirect_to achievement, notice: 'Achievement instance was successfully created.' }
        format.json { render json: achievement, status: :created, location: achievement }
      else
        format.html { render action: "new" }
        format.json { render json: achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /achievement_instances/1
  # PUT /achievement_instances/1.json
  def update
    @achievement_instance = AchievementInstance.find(params[:id])

    hero = Hero.find(params[:achievement_instance][:hero].to_i)
    achievement = Achievement.find(params[:achievement_instance][:achievement].to_i)
    params[:achievement_instance][:hero] = hero
    params[:achievement_instance][:achievement] = achievement

    respond_to do |format|
      if @achievement_instance.update_attributes(params[:achievement_instance])
        format.html { redirect_to achievement, notice: 'Achievement instance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achievement_instances/1
  # DELETE /achievement_instances/1.json
  def destroy
    @achievement_instance = AchievementInstance.find(params[:id])
    @achievement_instance.destroy

    respond_to do |format|
      format.html { redirect_to achievement_instances_url }
      format.json { head :no_content }
    end
  end
end
