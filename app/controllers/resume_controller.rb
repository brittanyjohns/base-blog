class ResumeController < ApplicationController
  before_action :set_question_type, :set_resume_text, :set_question_text

  def openai_question
    puts "\n\n#{params}\n\n#{@question_type}"
    puts "@resume_text: #{@resume_text}"
    resume_text = @resume_text
    # optional_ending = "in a corporate setting"
    # beginning = get_question_text
    # beginning = "Estimate the annual salary based on the following resume located in Ohio."
    # beginning = "Write a cover letter for a senior software engineer position using the following resume."
    question_request = "#{@question_text} \n#{resume_text}"
    puts "\n\nquestion_request: \n#{question_request}\n\n"
    if resume_text && !resume_text.empty?
      post_title = !@question_text.empty? ? @question_text : resume_text
      openai_prompt = OpenaiPrompt.new(question_request)
      response = openai_prompt.call
      @post = Post.create(title: post_title, body: resume_text, user_id: current_user.id)
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

  def set_question_type
    @question_type = params["commit"]
  end

  def set_resume_text
    @resume_text = params["resume"]["resume_text"]
  end

  def set_question_text
    case @question_type
    when "Cover Letter"
      @question_text = "Write a cover letter for a senior software engineer position using the following resume"
    when "Estimate Salary"
      @question_text = "Estimate the annual salary based on the following work experience"
    when "Estimate Pay"
      @question_text = "Estimate the annual salary based on the following job posting"
    when "None"
      @question_text = ""
    when "About"
      @question_text = "Rewrite the About section of this LinkedIn profile"
    when "Summary"
      @question_text = "Write a professional summary using the work experience in this LinkedIn profile"
    else
      @question_text = "Write a professional summary using my resume and include my total years of experience"
    end
  end

  def resume_params
    params.require(:resume)
  end
end
