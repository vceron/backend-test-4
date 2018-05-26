class CallsController < ApplicationController

  # Instead setting 'protect_from_forgery prepend: true' in ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :log_call

  # show all calls
  def index
  end

  # handle call, send say & gather commands
  def handle
    response = Twilio::TwiML::VoiceResponse.new
    response.say('This is the answer machine of Victor!', voice: 'woman', language: 'en')
    render xml: response.to_s
  end

  # Destroy logged call
  def destroy
  end

  private
  def log_call
    @call = Call.create_or_update(params)
  end
end
