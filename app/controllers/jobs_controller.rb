class JobsController < ApplicationController
   def index
     @jobs = Job.all
   end

   def show
     # params[:id] #=> "1"
     @job = Job.find(params[:id])
   end

   def new
     @job = Job.new
   end

   def create
     @job = Job.new(job_params)
     if @job.save
       redirect_to @job, notice: "Your job was posted successfully."
     else
       render :new, status: :unprocessable_content
     end
   end

   private

   def job_params
     params.expect(job: [
      :title, :company, :salary, :region, :apply_url, :apply_email
    ])
   end
end
