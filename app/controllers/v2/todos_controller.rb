class V2::TodosController < ApplicationController
  def index
    json_response({ message: 'Test V2'})
  end
end
