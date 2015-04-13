class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    $logger.debug{"Show surveys."}

    survey_id =  params[:id]
    @questions = Question.all

    # get all the question_ids associated with the survey
    @tests     = Test.select("question_id").where(survey_id: survey_id)

    survey_questions = Array.new

    @tests.each do |test|
      $logger.debug {test.question_id}
      survey_questions << test.question_id
    end

    $logger.debug{@survey_questions}

    # get all the questions that are associated with the survey
    # duplicate questions are ommited
    @questions = Question.where("id in(?)", survey_questions).to_a

    $logger.debug{"here"}
    $logger.debug{@questions}
  end

  # GET /surveys/new
  def new
    $logger.debug{"New survey."}
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    $logger.debug{"Create survey: #{survey_params[:name].to_s}"}

    @survey = Survey.new(survey_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    $logger.debug{"Update survey."}

    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    $logger.debug{"Destroy Survey."}
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def save_survey
    $logger.debug{"Save survey."}
    respond_to do |format|
      if true
        format.html { redirect_to surveys_url, notice: 'Survey was successfully completed.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:name)
    end
end
