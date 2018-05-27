class CallsController < ApplicationController

  # Instead setting 'protect_from_forgery prepend: true' in ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :log_call

  # show all calls
  def index
  end

  # POST "/calls/process_selection
  # Entry webhook from Twilio
  # handle call, send say & gather commands
  def handle
    response = Twilio::TwiML::VoiceResponse.new
    response.say('This is the answer machine of Victor!',
                 voice: 'woman',
                 language: 'en-US')
    response.gather(input: 'dtmf', timeout: 5, num_digits: 1, action: selection_url) do |gather|
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

  # POST "/calls/process_selection"
  # process interaction of gather command
  def process_selection
    Call.save_selection(params)
    case params[:Digits]
      when "1" then forward_call
      when "2" then record_message
      else handle
    end
  end

  def process_dial
    render status: 200, json: @controller.to_json
  end

  def process_record
    Call.save_recording_details(params)
    render status: 200, json: @controller.to_json
  end

  # Destroy logged call
  def destroy
  end

  # POST "/calls/update_details"
  # CALL STATUS CHANGES :
  # Almost empty as 'before_action' does the job
  # https://www.twilio.com/blog/2015/05/introducing-call-progress-events-flexibly-track-and-control-your-outbound-calls.html
  def update_details
    render status: 200, json: @controller.to_json
  end

  private
  def log_call
    puts params.to_s
    Call.create_or_update(params) unless !params[:RecordingSid].nil? || !params[:DialCallSid].nil? #only save original call details
  end

  def forward_call
    response = Twilio::TwiML::VoiceResponse.new
    response.say('Forwarding call to Victor', voice: 'woman', language: 'en-US')
    response.dial(number: '33603477892',
                  action: dial_url)
    response.say('Thank you for calling, good bye!', voice: 'woman', language: 'en-US')
    response.hangup

    render xml: response.to_s
  end

  def record_message
    response = Twilio::TwiML::VoiceResponse.new
    response.say('Start your message after the bip.', voice: 'woman', language: 'en-US')
    response.record(timeout: 10,
                    play_beep: true,
                    finish_on_key: '#',
                    action: record_url)
    render xml: response.to_s
  end
end
