require 'rails_helper'
include ActiveJob::TestHelper

RSpec.describe MessageBroadcastJob, type: :job do

  let(:user){ User.create(body: 'some text') }



end
