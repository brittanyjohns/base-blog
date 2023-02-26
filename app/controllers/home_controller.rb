class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
  end

  def seed_data
    Strain.seed_data!(10)
    @strains = Strain.all
  end

  def question_form
    respond_to do |format|
      format.html
      format.js #this is needed to handle ajaxified pagination
    end
  end

  def openai_question
    statement = professionally_say_params["question"]
    # optional_ending = "in a corporate setting"
    optional_ending = ""
    # beginning = "How do you professionally say, "
    # beginning = "Estimate the annual salary based on the following resume located in Ohio."
    beginning = "Write a cover letter for a senior software engineer position using the following resume."
    question_request = "#{beginning} \n#{statement} #{optional_ending}?"
    puts "\n\nquestion_request: \n#{question_request}\n\n"
    if statement && !statement.empty?
      openai_prompt = OpenaiPrompt.new(question_request)
      response = openai_prompt.call
      @post = Post.create(title: question_request, body: response, user_id: current_user.id)
      ActionText::RichText.create!(record_type: "Post", record_id: @post.id, name: "content", body: "<p>#{response}</p>")
    end

    respond_to do |format|
      if @post
        format.html { redirect_to post_url(@post), notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { redirect_to :question, notice: "An error has occurred.", status: :unprocessable_entity }
        format.json { render json: "An error has occurred.", status: :unprocessable_entity }
      end
    end
  end

  def professionally_say_params
    params.require(:professionally_say)
  end
end
