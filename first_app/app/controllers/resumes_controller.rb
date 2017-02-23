class ResumesController < ApplicationController
   $apkname=""
   $sign_apkname=""
   #@cmd='exec curl --noproxy 10.193.130.200 "http://redd_huang:98732e1d040d81947c5f35a3ae25c78b@10.193.130.200:8080/buildByToken/buildWithParameters?job=SignAPK&token=asdf&APK=#{@apkname}"'
   def index
      @resumes = Resume.all
   end
   
   def new
      @resume = Resume.new
   end
   
   def create
      @resume = Resume.new(resume_params)
      #@resume = Resume.new()

      if @resume.save
         #@resume.filename="test"
         puts "#{@resume.attributes}"
         puts "#{@resume.attribute_names}"
         puts params.inspect
         puts
         puts params[:resume]
         puts
         puts params[:resume][:name]
         puts params[:resume][:attachment].original_filename
         puts DateTime.now.strftime("%Y%m%d_%H%M")
         #puts params[:resume].original_filename
         #puts @resume.filename
         $apkname="#{@resume.attachment.url.split('/')[-1]}"
         $sign_apkname="signed_"+"#{$apkname}"
         #@resume.update_attributes(:apkname => "test")
         #puts "#{@resume.(:apkname)}"
         #@resume.apkname="#{@resume.attachment.url.split('/')[-1]}"
         #puts "apkname="+"#{@resume[apkname]}"
         #puts "#{@resume}"
         #puts "apkname="+"#{@resume.attachment}"
         system 'exec /home/spike/Projects/release/tools/Auto_Sign_Server2.sh ME372CG'+" #{$apkname} #{$sign_apkname}"
         redirect_to resumes_path, notice: "The resume #{@resume.name} has been uploaded."
      else
         render "new"
      end
      
   end
   
   def destroy
      @resume = Resume.find(params[:id])
      @resume.destroy
      redirect_to resumes_path, notice:  "The resume #{@resume.name} has been deleted."
   end

   def download
      @resume = Resume.find(params[:resume_id])
      #@resume.apkname="test"
      #puts "#{@resume.apkname}"
      #puts "hello, im spike"
      #puts @cmd
      #puts "begin"
      #puts $apkname
      #puts @resume.name
      #puts @resume.attachment.url
      #puts @resume.attachment.url.split('/')[-1]
      #puts "signed_"+"#{@resume.attachment.url.split('/')[-1]}"
      #$apkname="#{@resume.attachment.url.split('/')[-1]}"
      #$sign_apkname="signed_"+"#{@resume.attachment.url.split('/')[-1]}"
      #puts "end"
      #puts 'exec /home/spike/Projects/release/tools/Auto_Sign_Server2.sh ME372CG'+"#{$apkname} #{$sign_apkname}"
      #system 'exec curl --noproxy 10.193.130.200 "http://redd_huang:98732e1d040d81947c5f35a3ae25c78b@10.193.130.200:8080/buildByToken/buildWithParameters?job=SignAPK2&token=asdf&APK='+"#{$apkname}"+'"'
      #system 'exec /home/spike/Projects/release/tools/Auto_Sign_Server2.sh ME372CG'+" #{$apkname} #{$sign_apkname}"
      #send_file "#{Rails.root}/public/#{@resume.attachment.url}"
      $sign_apkname="signed_"+"#{@resume.attachment.url.split('/')[-1]}"
      send_file "#{Rails.root}/public/uploads/#{$sign_apkname}"
   end
   
   private
      def resume_params
      #params.require(:resume)
      params.require(:resume).permit(:name, :attachment)
   end
   
end
