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
    response.say('This is the answer machine of Victor!',
                 voice: 'woman',
                 language: 'en-US')
    response.gather(input: 'dtmf', timeout: 5, num_digits: 1, action: calls_process_selection_url) do |gather|
      gather.say(' Press 1 to call to him to his personal phone or 2 to leave him a message.',
                 voice: 'woman',
                 language: 'en-US')
    end

    #If the 'timeout' is reached before the caller enters any digits, or if the caller enters the 'finishOnKey'
    # value before entering any other digits, Twilio will not make a request to the 'action' URL but instead continue
    # processing the current TwiML document with the verb immediately following the <Gather>.

    response.say('As I did not received any response I suppose you are not trying anymore to reach Victor. Good bye!',
                 voice: 'woman',
                 language: 'en-US')
    response.hangup

    render xml: response.to_s
  end

  # process interaction of gather command
  def process_selection
    msg = "Pressed key is #{params['Digits']}"
    response = Twilio::TwiML::VoiceResponse.new
    response.say(msg,
                 voice: 'woman',
                 language: 'en-US')
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
