class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  require "httparty"
  # HTTParty::Basement.default_options.update(verify: false)

  # Use the class methods to get down to business quickly

  def index
  end

  def seed_data
    Strain.seed_data!(10)
    @strains = Strain.all
  end

  def question_form
  end

  def openai_question
    statement = professionally_say_params["question"]
    question_request = "How do you professionally say, #{statement} in a corporate setting?"
    puts "statement: #{statement}"
    if statement && !statement.empty?
      openai_prompt = OpenaiPrompt.new(question_request)
      response = openai_prompt.call
      @post = Post.create(title: statement, body: response, user_id: current_user.id)
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
