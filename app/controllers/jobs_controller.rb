class JobsController < ApplicationController
   def index
     @jobs = Job.all
   end

   def show
     params[:id] #=> "1"
     @job = Job.find(params[:id])
   end
end
