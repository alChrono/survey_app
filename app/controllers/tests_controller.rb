class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  # GET /tests
  # GET /tests.json
  def index
    $logger.debug{"Test index."}
    @tests = Test.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
    $logger.debug{"Show Test."}
  end

  # GET /tests/new
  def new
    $logger.debug{"New Test."}
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
      $logger.debug{"Edit Test."}
  end

  # POST /tests
  # POST /tests.json
  def create
    i_survey_id   = params[:test][:survey_id].to_i
    i_question_id = params[:test][:question_id].to_i

    if params[:commit] == "Load Selected Survey"
      $logger.debug {"Reload survey ID #{i_survey_id}."}

      # store the survey ID so we can load the questions in the survey 
      # after page is reloaded
      session[:survey] =  i_survey_id   
      redirect_to :back 
    else
      respond_to do |format|
        $logger.debug{"Add question ID #{i_question_id} to survey ID #{i_survey_id}."}

        # create a new record and save it 
        @test = Test.new(:survey_id => i_survey_id, :question_id => i_question_id)
        #@test = Test.new(:survey_id => 55, :question_id => 55)
        @test.save

        # render the page again and display errors if any
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    $logger.debug{"Update Test."}

    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    $logger.debug{"Delete Test."}

    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:survey, :question)
    end
end

