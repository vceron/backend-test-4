class Call < ApplicationRecord

  def self.create_or_update(params)
    call = self.find_or_initialize_by(call_id: params[:CallSid])
    call.assign_attributes({
        call_id: params[:CallSid],
        from: params[:From],
        to: params[:To],
        callDirection: params[:Direction]})

    call.save!
  end

end
