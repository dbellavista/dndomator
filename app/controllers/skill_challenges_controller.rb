class SkillChallengesController < ApplicationController
  # GET /skill_challenges
  # GET /skill_challenges.json
  def index
    @skill_challenges = SkillChallenge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skill_challenges }
    end
  end

  # GET /skill_challenges/1
  # GET /skill_challenges/1.json
  def show
    @skill_challenge = SkillChallenge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @skill_challenge }
    end
  end

  # GET /skill_challenges/new
  # GET /skill_challenges/new.json
  def new
    @skill_challenge = SkillChallenge.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @skill_challenge }
    end
  end

  # GET /skill_challenges/1/edit
  def edit
    @skill_challenge = SkillChallenge.find(params[:id])
  end

  # POST /skill_challenges
  # POST /skill_challenges.json
  def create
    @skill_challenge = SkillChallenge.new(params[:skill_challenge])
    check_completion @skill_challenge

    respond_to do |format|
      if @skill_challenge.save
        format.html { redirect_to @skill_challenge, notice: 'Skill challenge was successfully created.' }
        format.json { render json: @skill_challenge, status: :created, location: @skill_challenge }
      else
        format.html { render action: "new" }
        format.json { render json: @skill_challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  def failure
    @skill_challenge = SkillChallenge.find(params[:id])
    if !@skill_challenge.completed
      @skill_challenge.progress_failure += 1;
      check_completion @skill_challenge
    end
    respond_to do |format|
      if @skill_challenge.save
        format.html { redirect_to @skill_challenge, notice: 'Failure annotated!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @skill_challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  def success
    @skill_challenge = SkillChallenge.find(params[:id])
    if !@skill_challenge.completed
      @skill_challenge.progress_success += 1;
      check_completion @skill_challenge
    end
    respond_to do |format|
      if @skill_challenge.save
        format.html { redirect_to @skill_challenge, notice: 'Success annotated!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @skill_challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /skill_challenges/1
  # PUT /skill_challenges/1.json
  def update
    @skill_challenge = SkillChallenge.find(params[:id])
    @skill_challenge.attributes = params[:skill_challenge]
    check_completion @skill_challenge

    respond_to do |format|
      if @skill_challenge.update_attributes(params[:skill_challenge])
        format.html { redirect_to @skill_challenge, notice: 'Skill challenge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @skill_challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skill_challenges/1
  # DELETE /skill_challenges/1.json
  def destroy
    @skill_challenge = SkillChallenge.find(params[:id])
    @skill_challenge.destroy

    respond_to do |format|
      format.html { redirect_to skill_challenges_url }
      format.json { head :no_content }
    end
  end

  private
  def check_completion skill_challenge
    if SkillChallenge.number_of_failures(skill_challenge) == skill_challenge.progress_failure
      skill_challenge.completed = true
      skill_challenge.succeded = false
    elsif SkillChallenge.number_of_success(skill_challenge) == skill_challenge.progress_success
      skill_challenge.completed = true
      skill_challenge.succeded = true
    else
      skill_challenge.completed = false
      skill_challenge.succeded = false
    end
  end
end
