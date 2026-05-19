class JobsController < ApplicationController
  allow_unauthenticated_access only: [ :index, :show ]
  before_action :set_job, only: [ :edit, :update, :destroy ]

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
     @job = Current.user.jobs.new(job_params)
     if @job.save
       redirect_to @job, notice: "Your job was posted successfully."
     else
       render :new, status: :unprocessable_content
     end
   end

   def edit
   end

   def update
     if @job.update(job_params)
       redirect_to @job, notice: "Job was updated successfully"
     else
       render :edit, status: :unprocessable_content
     end
   end

   def destroy
     @job.destroy
     redirect_to root_path, notice: "Job has been deleted"
   end

   private

   def job_params
     params.expect(job: [
      :title, :company, :salary, :region, :apply_url, :apply_email, :description
    ])
   end

   def set_job
     @job = Current.user.jobs.find(params[:id])
   rescue ActiveRecord::RecordNotFound
    redirect_to root_path
   end
end
